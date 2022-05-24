<template>
    <v-container>
        <Snackbar :text="snackbar" @dismissed="snackbar = null"></Snackbar>
        <v-data-table
            :loading="loading"
            :items="items"
            :headers="headers"
            sort-by="consumedAt"
            :footer-props="{
                'items-per-page-options': [10, 50, 100, -1]
            }"
            dense>

            <template v-slot:[`item.consumedAt`]="{ item }">
                <div>{{ new Date(item.consumedAt * 1000).toLocaleString() }}</div>
            </template>
        </v-data-table>
    </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import Snackbar from "@/components/Snackbar.vue";
import {Api, Beer} from "@/api";
import {DataTableHeader} from "vuetify";

interface Data {
    snackbar: string | null,
    loading: boolean,
    items: Beer[],
    headers: DataTableHeader[],
}

export default Vue.extend({
    components: {Snackbar},
    data(): Data {
        return {
            snackbar: null,
            loading: false,
            items: [],
            headers: [
                {
                    text: 'Gebruiker',
                    value: 'consumedBy.name'
                },
                {
                    text: 'Datum',
                    value: 'consumedAt'
                }
            ]
        }
    },
    mounted() {
        this.getBeers()
    },
    methods: {
        notify(foo: any) {
            console.log(foo)
        },
        async getBeers() {
            this.loading = true
            let r = await Api.buildFromStorage()!.getConsumedBeers();
            this.loading = false

            if(r.isFail()) {
                this.snackbar = r.getFailMessage()
            }
            this.items = r.getOkResult()
        }
    }
})
</script>