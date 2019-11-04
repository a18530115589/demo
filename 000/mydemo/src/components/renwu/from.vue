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
                      <h2>From表单验证</h2>
                       <template>
                        <i-Form ref="from" :rules="yz" :model="from"  :label-width="80">
                             <FormItem label="用户名" prop='name'>
                                 <i-Input v-model="from.name" placeholder="请输入用户名"></i-Input>
                             </FormItem>
                             <FormItem label="密码" prop='password'>
                                 <i-Input v-model="from.password" placeholder="请输入密码"></i-Input>
                             </FormItem>
                              <FormItem>
                                  <Button type="primary" @click="qd('from')">确定</Button>
                                  <Button @click="qx('from')" style="margin-left: 8px">取消</Button>
                              </FormItem>                        
                        </i-Form>                   
                       </template>
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
          from:{
              name:'',
              password:''
          },
          yz:{
            name: [
                        { required: true, message: '请输入用户名', trigger: 'blur' }
                    ],
            password: [
                        { required: true, message: '请输入密码', trigger: 'blur' }
                    ],  
          }
        }
    },
    components:{
      
    },
    methods:{
        qd(name) {
                this.$refs[name].validate((valid) => {
                    if (valid) {
                        this.$Message.success('录入成功');
                    } else {
                        this.$Message.error('请输入！');
                    }
                })
            },
            qx(name) {
                this.$refs[name].resetFields();
            }
       }
}
</script>
<style scoped>

</style>