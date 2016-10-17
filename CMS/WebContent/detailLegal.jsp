 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!doctype html>
 <html lang="zh-CN">
 <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
   <link rel="stylesheet" href="css/main.css">
   <link href="css/style.css" rel="stylesheet" type="text/css" />
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
  <div class="legalEformtitle"><span>呈请法律文书详情</span></div>
     
        <div class="box_bottom pb5 pt5 pr10" >
              <div class="search_bar_btn" style="text-align:right;">
              <input type="button" name="button" class="btn1 btn82 btn_export" value="导出"
       		 onclick="$('#detailLegal').tableExport({type: 'excel', escape: 'false'});">
                 <input type="button" value="返回" onclick="custom_close()" class="btn1 btn82 btn_export">
              </div>
            </div> 
  <div class="container">
  
      <div class="demo1">
                <form id="myform" action="">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mytableedit" id="detailLegal">
                      <tr>
                    	    <td width="22%" align="right">编号：</td>
                    	    <td id="id">${id}</td>
                    	</tr>
                     	<tr>
                            <td width="22%" align="right">案件登记表表id：</td>
                            <td id="caseRegisterId">${caseRegisterId}
                            </td>
                        </tr>
                        <tr>
                            <td width="22%" align="right">内容：</td>
                            <td id="content">${content}
                            </td>
                        </tr>
                       <tr>
                            <td align="right">处理人姓名：</td>
                            <td id="staffName">${staffName}
                             </td>
                        </tr>
                        <tr>
                            <td align="right">审核状态：</td>
                             <td id="state">${state}
                             </td>
                        </tr>
                        <tr>
                            <td align="right">审核结果：</td>
                             <td id="result_state">${result_state}
                              </td>
                        </tr>
                    </table>
                </form>

            </div>
          </div>
    <!-- <script type="text/javascript">
   function GetQueryString(name)
   {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if(r!=null)return  decodeURI(r[2]); return null;
   }
   var id = GetQueryString("id");
   document.getElementById("id").innerText = id ;

   var caseRegisterId = GetQueryString("caseRegisterId");
   document.getElementById("caseRegisterId").innerText = caseRegisterId ;

   var content = GetQueryString("content");
   document.getElementById("content").innerText = content ;


   var staffName = GetQueryString("staffName");
   document.getElementById("staffName").innerText = staffName ;


   var state = GetQueryString("state");
   document.getElementById("state").innerText = state ;

   var result_state = GetQueryString("result_state");
   document.getElementById("result_state").innerText = result_state ;

   </script> -->
 </body>
 </html>
  