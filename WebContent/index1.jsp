<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<html>
	<head>
	<script type="text/javascript" src="js/jquery-3.1.1.js">
	</script>
	
	<script type="text/javascript">
	
		$(function(){//页面载入完成后调用
			//给id=showBtn的元素绑定一个function 
			$("#showBtn").click(function(){
				//发送ajax
				$.ajax({
					url:"demo1.do",
					type:"get",
					success:function(result){
						//result等价于xhr.responseText
						//result就是服务器返回内容
						//将result放到id=msg的span中
						$("#msg").html(result);
						
					}
				});
			});
			
		});
	</script>
	
	<script type="text/javascript">
		$(function(){
			//给输入框追加事件
			$("#username").blur(function(){
				//获取用户名
				var name = $("username").val();
				$("#username_msg").html("正在检测...");
				//发送ajax检测
				$.ajax({
					url:"check.do",
					type:"post",
					data:{"name":name},
					success:function(result){
						$("#username_msg").html(result);
					}
					
				});
			});
		});
	
	</script>
	
	
	<script type="text/javascript">
	//创建XMLHttpRequest
		function getXhr(){
			var xhr;
			if(window.XMLHttpRequest){
				xhr = new XMLHttpRequest();
			}else{//ie
				xhr = new ActiveXObject("Microsoft.XMLHTTP");
			}
			return xhr;
		}
	
	//发送HTTP请求
		function sendRequest(){
		var xhr = getXhr();//获取XMLHttpRequest对象
		xhr.open("GET","demo1.do",true);//创建一个HTTP请求 true:异步请求
		
		//注册一个回调函数,请求处理时自动调用
		xhr.onreadystatechange = function (){
			if(xhr.readyState==4){//4表示请求处理完毕
				//获取服务器返回信息
				var msg = xhr.responseText;
				//将消息放到msg里面
				document.getElementById("msg").innerHTML = msg;
			}
		}
		xhr.send(null);//发送HTTP请求
		
	}
	
	</script>	
	
	<script type="text/javascript">
		//检查用户名函数
		function checkname(){
			//获取请求参数
			var name = document.getElementById("username").value;
			//发送ajax请求
			
			var xhr = getXhr();//获取XHR对象
			xhr.open("POST","check.do");//创建请求
			xhr.setRequestHeader("content-type","application/x-www-form-urlencoded");//post请求需要给http协议设置请求头参数
			
			//注册回调函数
			xhr.onreadystatechange = function(){
				//请求处理完毕
				if(xhr.readyState==4 && xhr.status==200){
					var msg = xhr.responseText;
					document.getElementById("username_msg").innerHTML = msg;
				}
			}
			
			xhr.send("name="+name);//post请求在这里面传值
		}
	
	
	</script>
		
	</head>
	
	
	<body style="font-size:30px;">
		<a href="#" id="showBtn">查看上证指数</a>
		<span id="msg"></span>
		<hr/>
		<table>
			<tr>
				<td>新闻标题</td>
				<td>时间</td>
			</tr>
		
			<tr>
				<td>杨海龙:世界最年轻的亿万富豪</td>
				<td>2017-05-10</td>
			</tr>
		
			<tr>
				<td>特朗普会见杨海龙</td>
				<td>2017-06-17</td>
			</tr>
			
			<tr>
				<td>杨海龙应邀参见白宫年会</td>
				<td>2017-12-16</td>
			</tr>
		
		</table>
		<hr>
		<input type="text" id="username">
		<span id="username_msg"></span>
		
		
	</body>

</html>