<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
   <link rel="stylesheet" href="css/common.css"/>
   <link rel="stylesheet" href="css/main.css"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js" ></script>
   	<script type="text/javascript" src="js/loginCheck.js" ></script>
       <script language="JavaScript" src="js/jquery.base64.js"></script><!-- md5加密 -->
     <script type="text/ecmascript" src="js/md5.js"></script><!--md5加密  -->
     
     <!-- <script type="text/javascript" src="js/validate-ex.js"></script> -->
          <script type="text/javascript" src="js/xingshi.js"></script><!--用来验证身份证号的  -->
  <script language="javascript">
// 这个脚本是 ie6和ie7 通用的脚本
function custom_close(){
if 
(confirm("您确定要关闭本页吗？")){
window.opener=null;
window.open('','_self');
window.close();
}
else{}
}
</script> 
</head>
<body>
 <div class="head">	
        </div>
        <div id="container">
        <div class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
              <div class="search_bar_btn" style="text-align:right;">
                 <input type="button" value="返回" onclick="custom_close()" class="ext_btn" />
              </div>
            </div>
             <div class="demo">
            <div class="box_top"><b class="pl15" style="text-align:center;">员工信息修改</b></div>
                <form id="myform1" action="doEditStaff.do" method="post">
                <table class="form_table pt15 pb15" width="50%" style="margin:0 auto;">
                <tr>
                 		<td width="22%" align="right">员工编号：</td>
                        <td><input type="text" name="id" id="id" class="input-text lh30 input " value="${id}" readonly="readonly"/></td>
                </tr>
                <tr >
                  <td width="22%" align="right">员工身份证号：</td>
                             <td><input type="text" name="idcard" id="idcard" class="input-text lh30 input required" value="${idcard}" onchange="javascript:scCardStaff()" /></td>
                 </tr>
                 <tr >
                  <td width="22%" align="right">员工身份：</td>
                             <td><input type="text" name="identify" id="identify" class="input-text lh30 input " value="${identify}" /></td>
                 </tr>
                   <tr >
                  <td width="22%" align="right">员工姓名：</td>
                  <td><input type="text" name="name" id="name" class="input-text lh30 input required" value="${name}" /></td>
                 </tr>
                 <tr>
                 <td class="td_right">登录名：</td>
                  <td ><input type="text" id="loginName" name="loginName" class="input-text lh30 input required" value="${loginName}" onchange="javascript:judgeNameStaff()"/></td>
                 </tr>
                  <tr>
                 <td class="td_right">加密的登录密码：</td>
                  <td ><input type="text" name="pwd" id="pwd" class="input-text lh30 input required" value="${pwd}"/>
                  <input class="form-control" type="hidden" name="password1"  id="password1"/>
                  </td>
                 </tr>
                 
                 <tr>
                            <td height="42">&nbsp;</td>
                            <td><input type="submit" class="btn" value="提 交" onclick="javascript:md()"/> &nbsp; </td>
                        </tr><!--  -->
               </table>
               </form> 

            </div>
        
    </div>
<script type="text/javascript">
    function md(){
		 var pw = document.getElementById("pwd").value;
		 if(pw!=null){
			 var pw1 = md5(pw);
			 var l = pw1.length ;
			 if(l != 32){
				 document.getElementById("password1").value = pw1;
			 }else{
				 document.getElementById("password1").value = pw; 
			}
		}else{
			alert("所填写的密码为空");
		}
		 
	 }
      </script>
</body>

</html>
