//用户路由器
const express=require('express');
//引入mysql连接模块，..表示上一级目录,哪一个模块要操作sql就引用连接模块
const pool=require('../pool.js');
//创建空路由器
var router=express.Router();

//往路由器中添加路由
//首页加载分页显示
router.get("/homelist",(req,res)=>{
	var pid = req.query.pid;
	if(!pid){pid = 1}
	pool.query('SELECT * FROM home LIMIT 0,5',[pid],(err,result)=>{
	/* 	SELECT * FROM 表名称 LIMIT M,N 
			select * from home limit 0,10*/
		if(err) throw err;
		if(result.length >0 ) {
			res.send({code:1,data:result})
		}
	})
// 测试接口:http://127.0.0.1:3000/product/homelist?pid=1
})

//首页轮播图
router.get("/imageList",(req,res)=>{
	var list = [
		{id:1,img_url:'http://127.0.0.1:3000/head/big1.jpg'},
		{id:2,img_url:'http://127.0.0.1:3000/head/big5.jpg'},
		{id:3,img_url:'http://127.0.0.1:3000/head/big6.jpg'},
		{id:4,img_url:'http://127.0.0.1:3000/head/big4.jpg'}
	];
	res.send(list);
// 测试接口:http://127.0.0.1:3000/product/imageList
});

//Category 页面商品 分页 查询
router.get('/categoryPro',(req,res)=>{
	var obj = req.query;
	var pno = obj.pno;
	var pageSize = obj.pageSize;
	if (!pno ) { pno = 1}
	if (!pageSize ) { pageSize = 1}
	var sql =' SELECT * FROM Category_product LIMIT ?,?';
	var offset = ( pno-1 ) * pageSize;
	var ps = parseInt ( pageSize );
	pool.query (sql,[offset,ps],(err,result)=>{
		if(err) throw err;
		res.send ({ code:1,data:result });
	})
//测试接口:http://127.0.0.1:3000/product/categoryPro?pno=1&pageSize=10
});





//导出路由器
module.exports=router;