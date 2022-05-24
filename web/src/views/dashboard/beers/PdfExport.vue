<template>
    <div>
        <Snackbar :text="snackbar" @dismissed="snackbar = null"></Snackbar>
        <v-btn
            color="primary"
            :loading="loading"
            @click="listBeerExportPdf">
            <v-icon class="mr-2">mdi-database-export-outline</v-icon>
            Export as PDF
        </v-btn>
    </div>
</template>

<script lang="ts">
import Vue from 'vue'
import {Api} from "@/api";
import Snackbar from "@/components/Snackbar.vue";

interface Data {
    snackbar: string | null,
    loading: boolean
}

export default Vue.extend({
    components: {Snackbar},
    data(): Data {
        return {
            snackbar: null,
            loading: false
        }
    },
    methods: {
        async listBeerExportPdf() {
            this.loading = true
            let pdf = await Api.buildFromStorage()!.getConsumedBeersPdf()
            this.loading = false

            if(pdf.isFail()) {
                this.snackbar = pdf.getFailMessage()
                return
            }

            let blob = pdf.getOkResult()
            let url = URL.createObjectURL(blob)
            window.open(url, '_blank')
        }
    }
})
</script>