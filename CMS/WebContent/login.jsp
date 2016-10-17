 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		
		<title>刑事案件管理系统---登录</title>
		<!--使用  -->
		<link href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	
		<!--用百度开放平台的的cdn公共库中的bootstrap环境-->
			<!-- Bootstrap 核心 CSS 文件 -->
		<link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
		
			<!-- 在bootstrap.min.js 之前引入 -->
		<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
			<!-- Bootstrap 核心 JavaScript 文件 -->
		<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		
		<!--jquery.validate-->
		 <script type="text/javascript" src="js/jquery.validate.min.js" ></script>
		<link href="./css/style.css" rel="stylesheet" type="text/css"/> 
		<script type="text/javascript" src="js/loginCheck.js" ></script>
		<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>  <!--使用的搜狐接口查询iP -->
		 <script type="text/ecmascript" src="js/md5.js"></script>
		<script type="text/javascript">
		/**
		 * 获取本地IP地址
		 */
		function getLocalIPAddress()
		{
		    var obj = null;
		    var rslt = "127.0.0.1";
		    try
		    {
		        obj = new ActiveXObject("rcbdyctl.Setting");
		        if (!isNull(obj.GetIPAddress))
		        {
		            rslt = obj.GetIPAddress;            
		        }
		        obj = null;
		    }
		    catch(e)
		    {
		        //异常发生
		    }
		     
		    return rslt;
		}
			//将登录名处的密码通过md5加密
		    function md(){
		 		 var pw = document.getElementById("password").value;
		 		 var pw1 = md5(pw);
		 		 document.getElementById("passwordMD5").value = pw1;
		 	 }
		  
		</script>
		  <%
			String userName="";
			String passWord="";
			String info = "";
			String trueadmin = "";
			String staffDomain = "";
			//获取当前站点的所有cookies
			if(request!=null){
				
				Cookie[] cookies = request.getCookies();
				for(Cookie cookie:cookies){
					if("useName".equals(cookie.getName())){
						userName = cookie.getValue();
					}else if("pwd".equals(cookie.getName())){
						passWord = cookie.getValue();
					}
				}
				info = (String)request.getAttribute("info");/* 是否被登录提示消息 */
				 trueadmin = (String)request.getAttribute("trueadmin");/* 是否是管理员  */
				 staffDomain = (String)request.getAttribute("staffDomain");/* 员工信息 */
			}
		%>	
	</head>
	<body style="background: url(images/background.png) no-repeat;background-size: cover;" >
	<div class="container"> 
		<div class="form row">
			<form action="doLogin.do" class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form"  method="post">
				<h3 class="form-title">CMS</h3>
				<div class="col-sm-9 col-md-9">
					<div class="form-group">
						<i class="fa fa-user fa-lg"></i>
						<input class="form-control" type="text" placeholder="Username" name="username" id="username" value="<%=userName%>" autofocus="autofocus" maxlength="20" />
					</div>
					<div class="form-group">
							<i class="fa fa-lock fa-lg"></i>
							<input class="form-control" type="password" placeholder="Password" value="<%=passWord%>" autofocus="autofocus" name="password"  id="password"  onchange="javascript:md()"/>
							<input class="form-control" type="hidden" name="passwordMD5"  id="passwordMD5"/>
					</div>
						<label id="la">
							<input type="radio" name="rRadio" value="0" checked="checked"/> 上级
							<input type="radio" name="rRadio" value="1"/> 民警
							<input type="radio" name="rRadio" value="2"/> 管理员
						</label>
					<div class="form-group">
						<label class="checkbox">
							<input id="check" value="y" type="checkbox" name="remember" value="1"/> 记住我
						</label>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-success pull-right" onclick="javascript:md()" value="登录" name="Login"/>   
					</div>
				</div>
			</form>
		</div>

		</div>
	<div class="tip2">
    	<div class="tiptop2"><span>提示信息</span><a></a></div> 
       <div class="tipinfo2">
	      <!--   <span><img src="images/ticon.png" /></span> -->
	        <div class="tipright2">
		        <p><%=info %></p>
	        </div>
        </div>
        <div class="tipbtn2">
	        <input name="" type="button"  class="sure2" value="确定" />
        </div>
    </div>

	<script type="text/javascript">
		var temp ="<%=info%>";//错误标志
		var trueadmin = "<%=trueadmin%>";//成功标志
		var staffDomain = "<%=staffDomain%>";//员工登录名
		var ip = returnCitySN["cip"];/*  ','+returnCitySN["cname"]*/
		var localIP = getLocalIPAddress();
		if(temp != "null"){
				 $(".tip2").fadeIn(200);
				 $(".tiptop2 a").click(function(){
				 	 $(".tip2").fadeOut(200);
				 });
				 $(".sure2").click(function(){
					  	$(".tip2").fadeOut(100);
					  	if(temp == "用户在其他地方登录，现重新登录."||temp == "用户已在本机登录."){
					  		window.location.href="index.jsp?ip="+ip+"&localIP="+localIP+"&staffDomain="+staffDomain;
					  	}else 	if(temp == "用户在其他地方登录，现重新登录~"||temp == "用户已在本机登录~"){
					  		window.location.href="AdminIndex.jsp?ip="+ip+"&localIP="+localIP+"&staffDomain="+staffDomain;
						}else if(temp == "用户在其他地方登录，现重新登录" ||temp == "用户已在本机登录"){
							window.location.href="admin.jsp?ip="+ip+"&localIP="+localIP+"&staffDomain="+staffDomain;
						}
					});
			}
		if(trueadmin!=null){
			if(trueadmin == "trueadmin"){
		  		window.location.href="admin.jsp?ip="+ip+"&localIP="+localIP+"&staffDomain="+staffDomain;
		  	}else 	if(trueadmin == "trueshangji"){
		  		window.location.href="AdminIndex.jsp?ip="+ip+"&localIP="+localIP+"&staffDomain="+staffDomain;
			}else if(trueadmin == "trueminjing"){
				window.location.href="index.jsp?ip="+ip+"&localIP="+localIP+"&staffDomain="+staffDomain;
			}
		}
	</script>

	</body>
</html>
