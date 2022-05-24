<template>
    <v-card flat>
        <v-form v-model="valid">
            <v-text-field
                v-model="credentials.loginId"
                :rules="rules.required"
                counter="64"
                hint="Your Login ID"
                label="Login ID"></v-text-field>
            <v-text-field
                v-model="credentials.organizationId"
                :rules="rules.required"
                counter="64"
                hint="Your Organization ID"
                label="Organization ID"></v-text-field>
            <v-text-field
                v-model="credentials.password"
                :rules="rules.required"
                counter="64"
                type="password"
                hint="The Organization's password"
                label="Organization Password"></v-text-field>
        </v-form>

        <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
                color="primary"
                :disabled="!valid"
                :loading="loading"
                @click="$emit('login', credentials)">
                Login
            </v-btn>
        </v-card-actions>
    </v-card>
</template>

<script lang="ts">
import Vue from 'vue'
import {Credentials} from "@/views/login/Login.vue";
import {InputValidationRules} from "vuetify";

interface Data {
    valid: boolean,
    rules: Rules,
    credentials: Credentials
}

interface Rules {
    required: InputValidationRules
}

export default Vue.extend({
    props: {
        loading: Boolean
    },
    data(): Data {
        return {
            valid: true,
            rules: {
                required: [
                    v => !!v || 'This field is required'
                ]
            },
            credentials: {
                password: '',
                loginId: '',
                organizationId: '',
            }
        }
    }
})
</script>