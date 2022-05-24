<template>
    <v-container>
        <Snackbar :text="snackbar" @dismissed="snackbar = null"></Snackbar>

        <div class="d-flex flex-row justify-center">
            <v-card
                class="flex-grow-1"
                max-width="600px"
                elevation="2">
                <v-card-title> Bierzee Dashboard Login </v-card-title>
                <v-card-text>
                    <CredentialsForm @login="onLogin" :loading="loginLoading"></CredentialsForm>
                </v-card-text>
            </v-card>
        </div>
    </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import Snackbar from "@/components/Snackbar.vue";
import CredentialsForm from "@/views/login/CredentialsForm.vue";
import {Api} from "@/api";

interface Data {
    snackbar: string | null,
    loginLoading: boolean,
}

export interface Credentials {
    loginId: string,
    organizationId: string,
    password: string
}

export default Vue.extend({
    components: {CredentialsForm, Snackbar},
    data(): Data {
        return {
            snackbar: null,
            loginLoading: false,
        }
    },
    methods: {
        async onLogin(credentials: Credentials) {
            this.loginLoading = true
            let r = await Api.buildWithLogin(credentials.loginId, credentials.organizationId, credentials.password)
            this.loginLoading = false

            if(r.isFail()) {
                this.snackbar = r.getFailMessage()
                return;
            }

            if(!r.getOkResult()[2]) {
                this.snackbar = 'You are not an administrator'
                return;
            }

            await this.$router.push('/dashboard')
        }
    }
})
</script>