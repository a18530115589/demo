//app.js 服务器端程序
//1:下载三个模块 
//  cors            完成跨域处理
//  express-session session对象
//  mysql           数据库驱动
//  express         web服务器
//下载命令在线  
//npm i cors express-session express  mysql
//2:将以上四个模块引入到当程序
const express=require("express");
const mysql=require("mysql");
const cors=require("cors");
const session=require("express-session");
//创建数据库连接池
var pool=mysql.createPool({
    host:"127.0.0.1",
    user:"root",
    password:"",
    port:3306,
    database:"ys",
    connectionLimit:15
});
//配置跨域模块
// 允许哪个程序跨域访问服务器
// 加手机啊3001 允许3001访问我
// 服务器4000
var server=express();
//跨域
server.use(cors({
    // 允许程序列表
    origin:["http://127.0.0.1:8080","http://localhost:8080"],
    credentials:true
}));
//配置session模块
server.use(session({
    secret:"128位字符串",//安全字符串
    resave:true,//请求时更新数据
    saveUninitialized:true//保存初始数据
 }));
// 配置项目静态目录
server.use(express.static("public"));
// 创建express对象绑定4000端口
server.listen(4000);
//判断是否已注册
server.get("/regs",(req,res)=>{
    var iphone=req.query.iphone;
    var upwd=req.query.upwd;
    var sql="SELECT * FROM ys_user WHERE iphone=? AND upwd=?";
    pool.query(sql,[iphone,upwd],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"电话已注册"});

        }else{
            res.send({code:-1,msg:"电话未注册"});
        }
    })
  });
//创建注册接口
 server.get("/reg",(req,res)=>{
    var iphone=req.query.iphone;
    var upwd=req.query.upwd;
    var uname="用户"+parseInt(Math.random()*9999999) ;
    console.log(iphone,upwd,uname);
    var sql=`INSERT INTO ys_user VALUES(null,'${uname}',md5(${upwd}),${iphone})`;
     pool.query(sql,(err,result)=>{
         if(err) throw err;
         console.log(result);
         if(result.affectedRows>0){
             res.send({code:1,msg:"注册成功"})
         }else{
             res.send({code:-1,msg:"注册失败"})
         }
     })
 });
 //登录接口
 server.get("/login",(req,res)=>{
    var iphone=req.query.iphone;
    var upwd=req.query.upwd;
    //console.log(md5(upwd));
    var sql="SELECT * FROM ys_user WHERE iphone=? AND upwd=md5(?)";
    pool.query(sql,[iphone,upwd],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
             req.session.uid=result[0].lid;
            res.send({code:1,msg:"登录成功"});
        }else{
            res.send({code:-1,msg:"登录失败"});
        }
    })
  });
  //查询用户信息
  server.get("/sename",(req,res)=>{
      var lid=req.session.uid;
      //console.log(lid)
      if(!lid){
        res.send({code:-1,msg:"请登录"});
        return;}
      var sql="SELECT uname from ys_user WHERE lid=?"
      pool.query(sql,[lid],(err,result)=>{
          if(err) throw err;
          console.log(res);
          res.send({code:1,msg:"登录成功",data:result});
      })
  })
  //修改用户名
  server.get("/upname",(req,res)=>{
    //console.log(req.session.uid);
    var uid=req.session.uid;
    //console.log(req.query.uname);
    var uname=req.query.uname;
    // 判断是否登录
     if(!uid){
         res.send({code:-1,msg:"请登录"});
         return;}
    var sql="UPDATE ys_user SET uname=? WHERE lid=?";
    pool.query(sql,[uname,uid],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"修改成功"});
        }else{
            res.send({code:-1,msg:"修改失败"});
        }
    })
  });
//创建知识接口
server.get("/zhishi",(req,res)=>{
    var sql="SELECT * FROM ys_zhishi";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"知识列表",data:result});
    })
});
//创建知识详情接口
server.get("/zhishi2",(req,res)=>{
    var id=req.query.id
    //console.log(id);
    var sql="SELECT * FROM ys_zhishi WHERE id=?";
    pool.query(sql,[id],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"知识列表",data:result});
    })
});
//医生信息接口
server.get("/yisheng",(req,res)=>{
    var yid=req.query.yid;
    var sql="SELECT * FROM ys_ysxx WHERE yid=?";
    pool.query(sql,[yid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"医生信息",data:result});
        }else{
            res.send({code:-1,msg:"无此医生信息"})
        }
    })
});
//我的医生信息接口<--------需要创建数据库--------->
server.get("/myisheng",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:1,msg:"请登录"});
        return;
    }
    var yid=req.query.yid;
    var sql="SELECT * FROM ys_ysxx WHERE yid=?";
    pool.query(sql,[yid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"医生信息",data:result});
        }else{
            res.send({code:-1,msg:"无此医生信息"})
        }
    })
});
//查询家庭档案个人信息
server.get("/family",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var uname=req.query.uname;
    var sql="SELECT * FROM ys_family WHERE uid=? ";
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"相关信息",data:result});
        }else{
            res.send({code:-1,msg:"无信息，请添加"});
        }
    })
});
//向家庭档案添加个人信息
server.get("/infamily",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var xinxi=req.query;

    var sql="INSERT INTO ys_family SET ? ";
    pool.query(sql,[xinxi],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"添加成功"});
        }else{
            res.send({code:-1,msg:"添加失败"});
        }
    })
});
//查询处方接口
server.get("/chufang",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var sql="SELECT * FROM ys_chufang WHERE uid=?";
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"处方信息",data:result})
        }else{
            res.send({code:-1,msg:"无处方"})
        }    
    })
});
//添加处方接口
server.get("/inchufang",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var obj=req.query;
    var sql="INSERT INTO ys_chufang SET ? WHERE uid=?";
    pool.query(sql,[obj,uid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"添加成功"})
        }else{
            res.send({code:-1,msg:"添加失败"})
        }    
    })
});
// 查询医院信息
server.get("/yiyuan",(req,res)=>{
    var sql="SELECT * FROM ys_yiyuan";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"医院信息",data:result});
    })
});
//添加购买药品(添加订单号和是否购买过)
server.get("/inqingdan",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var uname=req.query.uname;
    var shuoming=req.query.shuoming;
    var pic=req.query.pic
    var count=req.query.count;
    var ml=req.query.ml;
    var yaoname=req.query.yaoname;
    var goumai=req.query.goumai
    var sql="INSERT INTO ys_qindan VALUES (null,?,?,?,?,?,?,?,?)";
    pool.query(sql,[uid,pic,shuoming,count,ml,yaoname,goumai,uname],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"添加成功"});
        }else{
            res.send({code:-1,msg:"添加失败"});
        }
    })
});
// 查询要支付的药品
server.get("/chufang",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var num=Math.random()*9999999999999;
    var sql="SELECT * FROM ys_qindan WHERE uid=? AND goumai=0";
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"订单号"+num,data:result,});
        }else{
            res.send({code:1,msg:"没有未支付的药"})
        }
    })
});
//更新购买过的药品
server.get("/upchufang",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var num=req.query.num;
    var sql="UPDATE ys_qindan SET num=? goumai=? WHERE num=null AND goumai=0 AND uid=?";
    pool.query(sql,[num,1,uid],(err,result)=>{
        if(result.affectedRows>0){
            res.send({code:1,msg:"支付成功"})
        }else{
            res.send({code:-1,msg:"支付失败"})
        }
    }) 
});
//添加病情1
server.get("/binqin",(req,res)=>{
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var obj=req.query;
    obj.push({"uid":uid});
    var sql="INSERT INTO ys_binqin SET ? ";
    pool.query(sql,[obj],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"添加成功",data:result})
        }else{
            res.send({code:-1,msg:"添加失败"})
        }    
    });
});
//选择患者信息（信息表需要增加uname字段）
server.get("/xzhz",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var uanme=req.query.uanme;
    var sql="UPDATE ys_binqin uname=? WHERE uid=? ANR uname<>null ";
    pool.query(sql,[uname,uid],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"添加成功"})
        }else{
            res.send({code:-1,msg:"添加失败"})
        }
    })
});

