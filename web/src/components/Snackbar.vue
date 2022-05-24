<template>
    <v-snackbar v-model="enabled" timeout="2500">
        {{text}}
        <template v-slot:action="{ attrs }">
            <v-btn
                color="primary"
                text
                v-bind="attrs"
                @click="emitDismissed">
                <v-icon>mdi-close</v-icon>
            </v-btn>
        </template>
    </v-snackbar>
</template>

<script lang="ts">
import Vue from 'vue'

interface Data {
    enabled: boolean,
    timeoutId: number | null,
}

export default Vue.extend({
    props: {
        text: {
            type: [String],
            default: null,
        }
    },
    data(): Data {
        return {
            enabled: false,
            timeoutId: null
        }
    },
    methods: {
        emitDismissed() {
            if(this.timeoutId != null) {
                clearTimeout(this.timeoutId)
            }

            this.$emit('dismissed')
        }
    },
    watch: {
        text: {
            immediate: true,
            handler(value) {
                this.enabled = value != null
                this.timeoutId = setTimeout(() => {
                    this.timeoutId = null
                    this.emitDismissed()
                }, 2500)
            }
        }
    }
})
</script>