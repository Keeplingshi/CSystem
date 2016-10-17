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
                 <td class="td_right" width="20%">案件编号：</td>
                  <td id="id" width="10%">${id}</td>
                  
                  <td class="td_right"width="20%">身份证号：</td>
                  <td id="idcard" width="10%">${idcard}</td>
                  
                  <td class="td_right"width="20%">报案人姓名：</td>
                  <td id="name"width="20%">${name}</td>
                  
                  
                </tr>
                <tr >
                
                  <td class="td_right">嫌疑人出生日期：</td>
                  <td id="birthday">${birthday}</td>
                  
                  <td class="td_right">犯案时间：</td>
                  <td id="day">${day}</td>
                  
                  <td class="td_right">犯案地点：</td>
                  <td id="workPalce">${workPlace}</td>
                  
                 </tr>
                 <tr>
                  <td class="td_right">嫌疑人出生地点：</td>
                  <td id="birthPalce">${birthPalce}</td>
                  
                   <td class="td_right">嫌疑人学历：</td>
                  <td id="degree_education">${degree_education}</td>
                  
                   <td class="td_right">民族：</td>
                  <td id="nation">${nation}</td>
                 </tr>
                 <tr>
                   <td class="td_right">嫌疑人性别：</td>
                  <td id="sex">${sex}</td>
                  
                   <td class="td_right">政治面貌：</td>
                  <td id="politics_status">${politics_status}</td>
                  
                   <td class="td_right">是否是惯犯：</td>
                  <td id="is_CriminalRecord">${is_CriminalRecord}</td>
                 </tr>
                 <tr>
                    <td class="td_right">涉嫌罪名：</td>
                  <td id="charge">${charge}</td>
                  
                   <td class="td_right">主犯：</td>
                  <td id="charge_next">${charge_main}</td>
                  
                   <td class="td_right">从犯：</td>
                  <td id="charge_main">${charge_next}</td>
                </tr>
                <tr>
   				  <td class="td_right">籍贯：</td>
                  <td id="native_palace">${native_palace}</td>
                  
                   <td class="td_right">控诉人联系方式：</td>
                  <td id="Sue_phone">${Sue_phone}</td>
                  
                   <td class="td_right">犯罪嫌疑人家庭联系方式：</td>
                  <td id="charge_familyPhone">${charge_familyPhone}</td>
                 </tr>
                 
               </table>
               </form>
            </div> 
          </div>
        </div>
     </div>
 </body>
 </html>
  