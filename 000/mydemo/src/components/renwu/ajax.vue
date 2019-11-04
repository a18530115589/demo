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
                      ajax请求 计算属性
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
                        <h2>ajax请求</h2>
                        <i-button @click="qwe" type="primary">发送请求</i-button>
                        <InputNumber v-model="first"></InputNumber>+
                        <InputNumber v-model="Second" ></InputNumber>=
                        <InputNumber v-model="sum" ></InputNumber>
                    </div>
                </Card>
            </Content>
        </Layout>
    </div>
</template>
<script>
export default {
    data(){
        return {
             first:'',
             Second:''

        }
    },
    components:{

    },
    methods:{
       qwe(){
            this.axios.post('https://web-api.juejin.im/v3/web/wbbr/bgeda')
            .then(res=>{
                console.log(res)
            })
            .catch(res=>{
                console.log(res)
            })
       }
        },
     computed:{
      sum(){
        return this.first+this.Second
      }
  },
    }
</script>
<style scoped>

</style>