<template>
    <v-container>
        <v-card elevation="2" class="pa-3">
            <v-card-title>Bier</v-card-title>
            <v-expansion-panels>
                <v-expansion-panel>
                    <v-expansion-panel-header>Lijst gedronken</v-expansion-panel-header>
                    <v-expansion-panel-content>
                        <div class="d-flex flex-row justify-end">
                            <PdfExport></PdfExport>
                        </div>
                        <List></List>
                    </v-expansion-panel-content>
                </v-expansion-panel>
            </v-expansion-panels>
        </v-card>
    </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import List from "@/views/dashboard/beers/List.vue";
import PdfExport from "@/views/dashboard/beers/PdfExport.vue";

export default Vue.extend({
    components: {List, PdfExport},
})
</script>