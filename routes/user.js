//用户路由器
const express=require('express');
//引入mysql连接模块，..表示上一级目录,哪一个模块要操作sql就引用连接模块
const pool=require('../pool.js');
//创建空路由器
var router=express.Router();

//往路由器中添加路由
//one:logining start
//http://127.0.0.1:3000/user/login?uname=dingding&upwd=123456
router.get('/login',(req,res)=>{
	var uname = req.query.uname, 
			upwd = req.query.upwd;
	var sql =" SELECT id FROM login";
			sql +=" WHERE uname = ? AND upwd = md5(?)";
pool.query(sql,[uname,upwd],(err,result)=>{
	if(err) throw err;
	if(result.length == 0) {
		res.send({code:-1,msg:"用户名或者密码错误"});
	}else{
		var id = result[0].id;
		req.session.uid = id;
		// console.log(req.session.uid);
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




//导出路由器
module.exports=router;