<template>
    <div class="content">
        
        <div class="overlay" v-if="pageLoading == true">
            <i class="fa fa-refresh fa-spin"></i>
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            
        },
        data: function(){
            return {
                pageLoading: false
            }
        },
        methods: {
            example: function(){
                axios.get('url').then(response => {
                    //response
                }).catch(error => {
                    _.forIn(error.response.data.errors, function(value,key) {
                        console.log(value);
                    });
                    console.log(error);
                });
            }
        }
    }
</script>
