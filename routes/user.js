//用户路由器
const express=require('express');
//引入mysql连接模块，..表示上一级目录,哪一个模块要操作sql就引用连接模块
const pool=require('../pool.js');
//创建空路由器
var router=express.Router();

//往路由器中添加路由
//one:logining start
//http://127.0.0.1:3000/user/login?uname=dingding&upwd=123456
//1:参数 2:sql 3:json
router.get('/login',(req,res)=>{
	var uname = req.query.uname, 
			upwd = req.query.upwd;
	var sql =" SELECT id FROM login";
			sql +=" WHERE uname = ? AND upwd = md5(?)";
pool.query(sql,[uname,upwd],(err,result)=>{
	if(err) throw err;
	if(result.length == 0) {
		res.send({code:-1,msg:"用户名或者密码错误"});
	}else{//如果登录成功将用户id 保存到session中
		//将用户数据保存在session中
		var id = result[0].id;  //保存当前用户id
		req.session.uid = id;   //当前id保存到session中 然后一直保存在服务器
		//console.log(req.session.uid);
		res.send({code:1,msg:"登录成功!"});
		}
	});
})
//logining end

//reg start

router.post('/Registered',(req,res)=>{
	var obj = req.body;
//如果为空 注册失败 return阻止程序往后进行
	var $uname = obj.uname,
			$upwd = obj.upwd,
			$uemail = obj.uemail;
	if (!$uname ) { res.send({ code:401,msg:"uname required"}); return};
	if (!$upwd ) { res.send({ code:401,msg:"upwd required"}); return};
	if (!$uemail ) { res.send({ code:401,msg:"email required"}); return};
//把用户信息插入数据库
	var sql ='INSERT INTO login VALUES'
			sql+='(NULL,?,md5(?),?)';
pool.query(sql,[$uname,$upwd,$uemail],(err,result)=>{
	if (err) throw err;
//判断affectedRows是否大于0(是否插入成功)
	if (result.affectedRows > 0) { 
		res.send ({ code:200,msg:'reg succeed!'})
		} else {
		res.send ({ code:404,msg:'reg fail!'})
		}
	});
});
//reg end

//检测用户名是否被注册
//result 返回的数组 如果数组长度大于0就证明已经注册过了
//json
router.post("/checkUname",(req,res)=>{
	var $uname = req.body.uname;    //获取uname
	var sql="SELECT * FROM login WHERE uname =?";
	pool.query(sql,[$uname],(err,result)=>{
			if(err) throw err;
			if(result.length > 0){
					res.send({ok:0,msg:"该用户名已被注册"})
			}else{
					res.send({ok:1,msg:"恭喜该用户名可以使用"})
		}
	})
}); 

//验证是否登录
//http://127.0.0.1:3000/user/islogin?id=1
router.get("/islogin",(req,res)=>{
	console.log(req.session.uid);
	if(req.session.uid === undefined){
		res.send({ok:0,uid:toString(req.session.uid)})
	} else {
		var uid = req.session.uid;
		var sql ="SELECT uname FROM login WHERE id = ?";
		pool.query(sql,[uid],(err,result)=>{
			if(err) throw err;
			if(result.length > 0 ) {
				res.send({ok:1,uname:result[0].uname,uid:uid})
			} else {
				res.send({ok:0})
			}
		})
	}
})


//退出登录 注销
router.get("/signout",(req,res)=>{
	req.session.uid = undefined;
	res.send({code:1});
})

//导出路由器
module.exports=router;