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
       		 onclick="$('#detailQTable').tableExport({type: 'excel', escape: 'false'});">
     </div>
     
       <div class="box_bottom pb5 pt5 pr10" style="border-top:1px solid #dadada;">
              <div class="search_bar_btn" style="text-align:right;">
                 <input type="button" value="返回" onclick="custom_close()" class="ext_btn">
              </div>
            </div>
     <div id="forms" class="mt10">
        <div class="box">
          <div class="box_border">
            <div class="box_top"><b class="pl15">拘留表详情查看</b></div>
              <form action="" class="jqtransform">
               <table class="form_table pt15 pb15" width="50%"  style="margin:0 auto" id="detailQTable">
                <tr>
                 <td class="td_right" width="40%">拘留表编号：</td>
                  <td id="id" width="60%">${id}</td>
                </tr>
                 <tr>
                 <td class="td_right" width="40%">案件编号：</td>
                  <td id="caseRegisterId" width="60%">${caseRegisterId}</td>
                </tr>
                <tr >
                  <td class="td_right">申请拘留时间：</td>
                  <td id="time">${time}</td>
                 </tr>
                 <tr>
                  <td class="td_right"width="20%">处理人姓名：</td>
                  <td id="handleName" width="10%">${handleName}</td>
                 </tr>
                 <tr>
                   <td class="td_right">犯罪嫌疑人姓名：</td>
                  <td id="chargeName">${chargeName}</td>
                 </tr>
                 <tr> 
                   <td class="td_right">申请拘留原因：</td>
                  <td id="reason">${reason}</td>
                 </tr>
                <tr>  
                   <td class="td_right">审核状态：</td>
                  <td id="state">${state}</td>
                </tr>
                <tr> 
                   <td class="td_right">审核结果：</td>
                  <td id="result_state">${result_state}</td>
                </tr>
                 
               </table>
               </form>
            </div> 
          </div>
        </div>
     </div>
  <!--   <script type="text/javascript">
   function GetQueryString(name)
   {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  decodeURI(r[2]); return null;
   }

   var id = GetQueryString("id");
   document.getElementById("id").innerText = id ;

   var idcard = GetQueryString("caseRegisterId");
   document.getElementById("caseRegisterId").innerText = idcard ;

   var content = GetQueryString("reason");
   document.getElementById("reason").innerText = content ;


   var name = GetQueryString("chargeName");
   document.getElementById("chargeName").innerText = name ;


   var askTime = GetQueryString("time");
   document.getElementById("time").innerText = askTime ;

   var askedName = GetQueryString("handleName");
   document.getElementById("handleName").innerText = askedName ;
   
   var state = GetQueryString("state");
   document.getElementById("state").innerText = state ;

   var result_state = GetQueryString("result_state");
   document.getElementById("result_state").innerText = result_state ;


   </script> -->
 </body>
 </html>
  