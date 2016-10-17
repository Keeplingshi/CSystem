 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!doctype html>
 <html lang="zh-CN">
 <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
   <link rel="stylesheet" href="css/common.css">
   <link rel="stylesheet" href="css/main.css">
   <script language="JavaScript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js" ></script>
    <script language="JavaScript" src="js/jquery.base64.js"></script>
    <script language="JavaScript" src="js/tableExport.js"></script>
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
   <title>Document</title>
 </head>
 <body>
  <div class="container">

     <div id="button" class="mt10">
       <input type="button" name="button" class="btn btn82 btn_export" value="导出"
       		 onclick="$('#detailTable').tableExport({type: 'excel', escape: 'false'});">
     </div>
     
       <div class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
              <div class="search_bar_btn" style="text-align:right;">
                 <input type="button" value="返回" onclick="custom_close()" class="ext_btn">
              </div>
            </div>
     <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">刑事案件登记表详情查看</b></div>
              <form action="" class="jqtransform">
               <table class="form_table pt15 pb15" width="100%" id="detailTable">
                 <tr>
                 		<td width="22%" align="right">员工编号：</td>
                        <td>${id}</td>
                </tr>
                <tr >
                  <td width="22%" align="right">员工身份证号：</td>
                             <td>${idcard}</td>
                 </tr>
                 <tr >
                  <td width="22%" align="right">员工身份：</td>
                             <td>${identify}</td>
                 </tr>
                   <tr >
                  <td width="22%" align="right">员工姓名：</td>
                  <td>${name}</td>
                 </tr>
                 <tr>
                 <td class="td_right">登录名：</td>
                  <td >${loginName}</td>
                 </tr>
                  <tr>
                 <td class="td_right">登录密码：</td>
                  <td >${pwd}</td>
                 </tr>
                 
               </table>
               </form>
            </div> 
          </div>
        </div>
     </div>
 <!--    <script type="text/javascript">
   function GetQueryString(name)
   {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  decodeURI(r[2]); return null;
   }
   var id = GetQueryString("CRid");
   document.getElementById("id").innerText = id ;

   var idcard = GetQueryString("IDCard");
   document.getElementById("idcard").innerText = idcard ;

   var name = GetQueryString("user");
   document.getElementById("name").innerText = name ;


   var birthday = GetQueryString("birthday");
   document.getElementById("birthday").innerText = birthday ;


   var day = GetQueryString("day");
   document.getElementById("day").innerText = day ;

   var workPalce = GetQueryString("workPalce");
   document.getElementById("workPalce").innerText = workPalce ;

   var birthPalce = GetQueryString("birthPalce");
   document.getElementById("birthPalce").innerText = birthPalce ;

   var degree_education = GetQueryString("degree_education");
   if(degree_education == "1"){
	   degree_education ="博士";
	}else if(degree_education == "2"){
	   degree_education ="硕士";
	}else if(degree_education == "3"){
	   degree_education ="本科";
	}else if(degree_education == "4"){
	   degree_education ="其他";
	}
   document.getElementById("degree_education").innerText = degree_education ;

   var nation = GetQueryString("nation");
   document.getElementById("nation").innerText = nation ;

   var sex = GetQueryString("sex");
   document.getElementById("sex").innerText = sex ;

   var politics_status = GetQueryString("politics_status");
   document.getElementById("politics_status").innerText = politics_status ;

   var is_CriminalRecord = GetQueryString("is_CriminalRecord");
   document.getElementById("is_CriminalRecord").innerText = is_CriminalRecord ;

   var charge = GetQueryString("charge");
   document.getElementById("charge").innerText = charge ;

   var charge_next = GetQueryString("charge_next");
   document.getElementById("charge_next").innerText = charge_next ;

   var charge_main = GetQueryString("charge_main");
   document.getElementById("charge_main").innerText = charge_main ;
   
   var native_palace = GetQueryString("native_palace");
   document.getElementById("native_palace").innerText = native_palace ;

   var Sue_phone = GetQueryString("Sue_phone");
   document.getElementById("Sue_phone").innerText = Sue_phone ;

   var charge_familyPhone = GetQueryString("charge_familyPhone");
   document.getElementById("charge_familyPhone").innerText = charge_familyPhone ;
   </script> --> 
 </body>
 </html>
  