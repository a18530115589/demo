import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
//import zhishi from "@/components/zhishi/zhishi.vue"

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    // {
    //   path:'/zhishi',
    //   id:"index",
    //   component:zhishi
    // }
    
  ]
})
