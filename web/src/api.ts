const SESSION_ID_KEY = "BIERZEE_SESSION_ID";
const SERVER = "https://bierzee-v2.k8s.array21.dev";
const PDF_SERVER = "http://localhost:8080";

const INTERNAL_ERROR = "Something went wrong, please try again later";

export class ApiResult<T = any> {
    private readonly result: T | null
    private readonly message: string | null

    private constructor(t: T | null, msg: string | null) {
        this.result = t
        this.message = msg
    }

    generalize<R>(): ApiResult<R> {
        return new ApiResult<any>(null, this.message)
    }

    static fail(message: string): ApiResult {
        return new ApiResult(null, message)
    }

    static ok<R>(result: R): ApiResult {
        return new ApiResult<R>(result, null);
    }

    isSuccess(): boolean {
        return this.result != null
    }

    isFail(): boolean {
        return this.result == null
    }

    getOkResult(): T {
        console.assert(this.isSuccess())
        return this.result!
    }

    getFailMessage(): string {
        console.assert(!this.isSuccess())
        return this.message!
    }
}

export class Beer {
    consumedAt: number;
    consumedBy: User;

    constructor(api: ApiBeer) {
        this.consumedBy = new User(api.consumed_by)
        this.consumedAt = api.consumed_at
    }

    toApi(): ApiBeer {
        return {
            consumed_at: this.consumedAt,
            consumed_by: this.consumedBy.toApi()
        }
    }
}

interface ApiBeer {
    consumed_by: ApiUser
    consumed_at: number
}

export class User {
    name: string;
    loginId: string;
    id: string;

    constructor(api: ApiUser) {
        this.name = api.name
        this.loginId = api.login_id
        this.id = api.id
    }

    toApi(): ApiUser {
        return {
            name: this.name,
            id: this.id,
            login_id: this.loginId
        }
    }
}

interface ApiUser {
    login_id: string,
    name: string,
    id: string,
}

export class Session {
    user: User;
    id: string;
    isAdmin: boolean;

    constructor(user: User, id: string, isAdmin: boolean) {
        this.user = user
        this.id = id
        this.isAdmin = isAdmin
    }
}

export class Api {

    private readonly sessionId: string;

    private constructor(sessionId: string) {
        this.sessionId = sessionId
    }

    static buildFromStorage(): Api | null {
        let sessionId = window.localStorage.getItem(SESSION_ID_KEY);
        if(sessionId == null) {
            return null
        }

        return new Api(sessionId)
    }

    static async buildWithLogin(loginId: string, organizationId: string, orgPassword: string): Promise<ApiResult<[Api, string, boolean]>> {
        let r = await fetch(`${SERVER}/api/v1/auth/login`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Accepts': 'application/json',
            },
            body: JSON.stringify({
                user_login_id: loginId,
                organization_code: organizationId,
                organization_password: orgPassword
            })
        })

        switch(r.status) {
            case 200:
                interface Response {
                    user: {
                        name: string,
                    },
                    session: {
                        id: string,
                    },
                    is_admin: boolean
                }

                let json = <Response> await r.json()
                window.localStorage.setItem(SESSION_ID_KEY, json.session.id)
                let api = new Api(json.session.id)
                return ApiResult.ok([api, json.user.name, json.is_admin])
            case 401:
                return ApiResult.fail('Invalid credentials')
            default:
                return ApiResult.fail(INTERNAL_ERROR)
        }
    }

    async checkSession(): Promise<ApiResult<Session>> {
        interface Response {
            user: ApiUser,
            session: {
                id: string,
            },
            is_admin: boolean
        }
        let r = await this.getRequest<Response>('/api/v1/auth/session')
        if(r.isFail()) {
            return r.generalize()
        }

        let payload = r.getOkResult()
        return ApiResult.ok(new Session(new User(payload.user), payload.session.id, payload.is_admin))
    }

    private async getRequest<T>(path: string): Promise<ApiResult<T>> {
        let r = await fetch(`${SERVER}${path}`, {
            headers: {
                'Accept': 'application/json',
                'Authorization': this.sessionId
            }
        })

        switch(r.status) {
            case 200:
                let json = <T> await r.json()
                return ApiResult.ok(json)
            default:
                return ApiResult.fail(await r.text())
        }
    }

    async getConsumedBeers(): Promise<ApiResult<Beer[]>> {
        interface Response {
            beers: ApiBeer[]
        }

        let r = await this.getRequest<Response>("/api/v1/organization/beer/list")
        if(r.isFail()) {
            return r.generalize()
        }

        let beers = r.getOkResult().beers.map(x => new Beer(x))
        return ApiResult.ok(beers)
    }

    async getConsumedBeersPdf(): Promise<ApiResult<Blob>> {
        let r = await fetch(`${PDF_SERVER}/beer/list`, {
            headers: {
                'Authorization': this.sessionId
            }
        })

        switch(r.status) {
            case 200:
                return ApiResult.ok(await r.blob())
            default:
                return ApiResult.fail(await r.text())
        }
    }
}