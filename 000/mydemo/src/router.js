import Vue from 'vue'
import Router from 'vue-router'


import father from './components/renwu/father.vue'
import ajax from './components/renwu/ajax.vue'
import from from './components/renwu/from.vue'
import list from './components/renwu/list.vue'
Vue.use(Router)
export default new Router({
  //http://127.0.0.1:3001/#/Exam02
  //path:组件路径 components组件名
  routes: [
    {path:'/list',component:list},
    {path:'/from',component:from},
    {path:'/ajax',component:ajax},
    {path:'/father',component:father},
  ]
})
