// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
//引入viewui组件
import ViewUI from 'view-design';
//引入viewui样式
import 'view-design/dist/styles/iview.css';
// 注册vue
Vue.use(ViewUI);
Vue.prototype.$ajax=axios
//import "./font/iconfont.css"
// 引入axios模块
// 配置保存session信息
// axios注册vue
import axios from "axios"
Vue.prototype.axios=axios
/* eslint-disable no-new */

new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>',
  render: h => h(App)
})
