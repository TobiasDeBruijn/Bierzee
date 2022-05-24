<template>
    <v-app>
        <v-app-bar
            app
            v-if="showAppBar"
            color="primary"
            dark>
            <div class="d-flex align-center">
                <v-img
                    alt="Vuetify Logo"
                    class="shrink mr-2"
                    contain
                    src="https://cdn.vuetifyjs.com/images/logos/vuetify-logo-dark.png"
                    transition="scale-transition"
                    width="40"
                ></v-img>

                <div class="text-h4">
                    Bierzee
                </div>
            </div>

        </v-app-bar>

        <v-main class="mr-4 ml-4 mt-4">
            <router-view/>
        </v-main>
    </v-app>
</template>

<script lang="ts">
import Vue from 'vue';
import {Api} from "@/api";

interface Data {
    showAppBar: boolean
}

export default Vue.extend({
    name: 'App',
    data(): Data {
        return {
            showAppBar: false,
        }
    },
    mounted() {
        this.$router.onReady(async () => {
            let path = this.$router.currentRoute.path

            if(!path.startsWith('/login')) {
                this.showAppBar = true
                await this.checkLoggedIn()
            }
        })
    },
    watch: {
        $route(to, from) {
            let path = this.$router.currentRoute.path
            this.showAppBar = !path.startsWith('/login')
        }
    },
    methods: {
        async checkLoggedIn() {
            let sessionMaybeGone = Api.buildFromStorage()?.checkSession()
            if(sessionMaybeGone == undefined) {
                await this.$router.push('/login')
                return
            }

            let session = await sessionMaybeGone
            if(session.isFail() || !session.getOkResult().isAdmin) {
                await this.$router.push('/login')
                return
            }

            // OK
        }
    }
});
</script>
