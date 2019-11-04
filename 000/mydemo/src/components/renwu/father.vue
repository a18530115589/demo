<template>
    <div>
        <Layout>
            <Header>
                <Menu mode='horizontal' theme='dark' active-name='1'>
                  <div>
                      <MenuItem name='father' to='/father'>
                        父子传参
                      </MenuItem>
                      <MenuItem name='ajax' to='/ajax'>
                      ajax请求  计算属性
                      </MenuItem>
                      <MenuItem name='from' to='/from'>
                      From表单验证
                      </MenuItem>
                      <MenuItem name='list' to='/list'>
                      分页列表
                      </MenuItem>
                  </div>
                </Menu>
            </Header>
            <Content :style="{padding: '0 50px'}">
                <Card>
                    <div>
                        <child message="hello" v-on:asd="zxc"></child>
                        <i-input id='aaa'></i-input>
                    </div>
                </Card>
            </Content>
        </Layout>
    </div>
</template>
<script>
import child from './child.vue'
export default {
    data(){
        return {

        }
    },
    components:{
        child
    },
    methods:{
        zxc(data){
            document.getElementById('aaa').innerHTML=data
        }
    }
}
</script>
<style scoped>

</style>