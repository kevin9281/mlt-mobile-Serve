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

//获取商品详细信息
//测试接口:http://127.0.0.1:3000/product/productDetails?pid=1
router.get("/productDetails",(req,res)=>{
	// 1:获取参数
	var pid = req.query.pid;
	// 2:创建正则 最少1个字 多了不限
	var reg = /^\d{1,}$/;
	// 3:如严重失败 输出错误
	if(!reg.test(pid)){
		res.send({code:-1,msg:"商品的编号格式有误!"});
		return; //函数停止运行
	}
	// 4:创建sql
	var sql = 'SELECT * FROM catproduct WHERE pid =?'
	// 5:发送sql
	pool.query(sql,[pid],(err,result)=>{
		if(err) throw err;
		res.send({code:1,data:result});
	})
	// 6:输出查询结果{code:1}
})

//功能 获取商品详细信息商品 名字 价格 完成购物车
//测试:http://127.0.0.1:3000/product/findProduct?pid=1
router.get("/findProduct",(req,res)=>{
	var pid = req.query.pid;
	var sql =' SELECT title,price FROM catproduct';
			sql+=' WHERE pid = ?';
	pool.query(sql,[pid],(err,result)=>{
		if(err) throw err;
		res.send({code:1,data:result});
	})
})

//功能 将商品添加至购物车
//http://127.0.0.1:3000/product/addcart?uid=1&pid=3&price=99
router.get("/addcart",(req,res)=>{
	var pid = parseInt(req.query.pid);
	var count = 1;
	var uid = parseInt(req.query.uid);
	var price = parseInt(req.query.price);
	var sql = "SELECT id FROM mlt_cart";
			sql+=" WHERE uid = ? AND pid = ?";
	pool.query(sql,[uid,pid],(err,result)=>{
		if(err) throw err;
		// res.send(result);
		if(result.length == 0) {
			var sql = ` INSERT INTO mlt_cart`;
					sql+=` VALUES(null,1,${price},${pid},${uid})`; //模板字符串 ` `
		} else {
			var sql = ` UPDATE mlt_cart`;
					sql+=` SET count=count+1 WHERE pid=${pid}`;
					sql+=` AND uid = ${uid}`;
		}
		pool.query(sql,(err,result)=>{
			if(err) throw err;
			if(result.affectedRows > 0) {  //affectedRows 影响的行数
				res.send({code:1,msg:"添加成功!"});
			} else {
				res.send({code:-1,msg:"添加失败!"});
			}
		})
	})
})


//功能 购物车列表
//http://127.0.0.1:3000/product/cartlist?uid=1
router.get("/cartlist",(req,res)=>{
	var uid = req.query.uid;
//多表查询 sql
	var sql = " SELECT m.id,m.count,m.price,";
			sql+=" m.uid,m.pid,c.title";
			sql+=" FROM mlt_cart m,catproduct c";
			sql+=" WHERE c.pid = m.pid";
			sql+=" AND m.uid = ?";
	pool.query(sql,[uid],(err,result)=>{
		if(err) throw err;
		res.send({code:1,data:result})
	})
});
//导出路由器
module.exports=router;