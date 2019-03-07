//导入路由器以及中间件
const express=require('express');
const userRouter=require('./routes/user.js');
const proRouter=require('./routes/product.js');
const bodyParser=require('body-parser');
//加载跨域访问的模块 引入跨域模块 
const cors=require("cors"); 
const session=require("express-session");
//创建服务器
var app = express();
app.listen(3000,function () {
	console.log('服务器创建成功!');
});
//使用 body-parser 针对post请求处理请求参数
//配置对特殊 json是否是自动转换 不转换
app.use(bodyParser.urlencoded({extended:false}));
//托管静态文件到public目录下
app.use(express.static('public'));
//配置跨域访问的模块 配置允许哪个程序跨域访问 脚手架
//origin:允许跨域访问的域名列表
//credentials:跨域访问要保存session的id true有这个值 就可以存住
app.use(cors({
	origin:["http://127.0.0.1:8080","http://localhost:8080"],
	credentials:true
}));
//配置express-session
app.use(session({
  secret:"128位随机字符",  //安全字符串
  resave:false, //每次请求是否都需要刷新更新数据
  saveUninitialized:true, //初始化时是否保存数据
  cookie:{
    maxAge:1000 * 60 * 60 * 8 //依靠cookie保存8小时
  }
}));


//把用户路由器引用并挂载到/user下
app.use('/user',userRouter);
app.use('/product',proRouter);

//服务器目录
//mlt-mobile_server
//   public
//   pool.js
//   db.sql
//   app.js 