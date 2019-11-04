<template>
  <div id="app">
    
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  
}
body{
margin:0;
}
 .mint-searchbar-inner{border-radius: 30px;}
 .mint-searchbar{background: #00c8aa;
    }
 .mint-swipe-indicators{
    position: absolute;
    bottom: 20px;
    left: 50%;
    -webkit-transform: translateX(-50%);
    transform: translateX(-50%);
    }
    .mint-button-text{
    font-family: '思源黑体 Bold', '思源黑体';
    font-weight: 700;
    font-style: normal;
    font-size: 18px;
    color:#333333;
    }

    .mintui-back:before{
    color:#333333;
    font-size:20px;
    font-weight:800;
    }
    .mint-header {
    background:#fff;
    }
</style>
