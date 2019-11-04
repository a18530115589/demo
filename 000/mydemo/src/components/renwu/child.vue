<template>
    <div>
        <h2>child子组件部分</h2>
        <p>{{message}}</p>
        <h2>子传父</h2>
        <button @click="qwe">向父组件传值</button>
    </div>
</template>
<script>
export default {
    props:['message'],
    methods:{
        qwe(){
            this.$emit('asd','这是子组件的内容')
        }
    }
}
</script>
<style scoped>

</style>