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
                  <template>
                     <div>
                       <from @getPerson="xxx"></from>
                       <Table :columns="historyColumns" :data="historyData"></Table>
                       <Page :total="dataCount" :page-size="pageSize"  @on-change="changepage"></Page>
                     </div>                 
                  </template>
                </Card>
            </Content>
        </Layout>
    </div>
</template>
<script>
import from from './from2.vue'
   var testData = {
        "histories": [
            {
                "name": "嘻嘻嘻",
                "password": "41123",
                "time": "2019-11-2 18:11"
            },
        ]
    }
export default {
    data(){
        return {
               ajaxHistoryData:[],
                // 初始化信息总条数
                dataCount:1,
                // 每页显示多少条
                pageSize:5,
                historyColumns: [
                    {
                        title: '用户名',
                        key: 'name'
                    },
                    {
                        title: '密码',
                        key: 'password'
                    },
                    {
                        title: '时间',
                        key: 'time'
                    }

                ],
                historyData: []
        }
    },
       methods:{
           xxx(person) {
           testData.histories.push(JSON.parse(JSON.stringify(person)))
           this.asd()
             },
            // 获取历史记录信息
            asd(){
                // 保存取到的所有数据
                this.ajaxHistoryData = testData.histories
                this.dataCount = testData.histories.length;
                // 初始化显示，小于每页显示条数，全显，大于每页显示条数，取前每页条数显示
                if(testData.histories.length < this.pageSize){
                    this.historyData = this.ajaxHistoryData;
                }else{
                    this.historyData = this.ajaxHistoryData.slice(0,this.pageSize);
                }
            },
            changepage(index){
                var _start = ( index - 1 ) * this.pageSize;
                var _end = index * this.pageSize;
                this.historyData = this.ajaxHistoryData.slice(_start,_end);
            }
        },
        created(){
             this.asd();
            
        },
        components:{
            from
        },
    }
</script>
<style scoped>

</style>