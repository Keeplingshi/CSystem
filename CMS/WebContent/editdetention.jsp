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
     <script type="text/javascript" src="js/validate-ex.js"></script>
      <script type="text/javascript" src="js/upload.js"></script>
          <script type="text/javascript">
          window.onload=function(){
      		$.ajax({
                  url:"queryCRID_Name.do",
                  // 数据发送方式
                  type:"get",
                  // 接受数据格式
                  dataType:"json",
                  // 要传递的数据
                  success: succFunction //成功执行方法 
          	});/*data:param,  */
      	};
          	function succFunction(result){
              	var resultList = eval(result);
              		
              	$.each(resultList, function (index, item) {
              		 var ID = resultList[index].id;

              		 //添加到id选择框
              		 var idSelect = document.getElementById("caseRegisterId");
              		 var idOption = document.createElement("OPTION"); 
              		 idOption.value = ID;
              		 idOption.text = ID;
              		 idSelect.options.add(idOption); 
                 });
              	$("#caseRegisterId  option[value='${caseRegisterId}'] ").attr("selected",true);
            };
      </script>
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
               <div class="box_top"><b class="pl15" style="text-align:center;">搜查表修改</b></div>
                <form id="myform" action="geteditDetention.do" method="get">
                <table class="form_table pt15 pb15" width="50%" style="margin:0 auto;">
                <tr>
                 		<td width="22%" align="right">编号：</td>
                        <td><input type="text" name="id" id="id" class="input-text lh30 input required" value="${id}" readonly="readonly"/></td>
                </tr>
                <tr >
                  <td width="22%" align="right">案件登记表表id：</td>
                            <td><select id="caseRegisterId" name="caseRegisterId" class="input-text lh30 required"></select>
                                <p>请选择对应的刑事案件登记表</p></td>
                 </tr>
                   <tr >
                  <td width="22%" align="right">拘留原因：</td>
                  <td><textarea style="height: 150px;width: 490px;" name="reason" id="content" class="input-text lh30 input required">${reason}</textarea>
                   	<p>请输入拘留内容</p>
                  </td>
                 </tr>
                   <tr>
                 <td class="td_right">拘留时间：</td>
                  <td ><input type="text" name="time" class="input-text lh30 input required" value="${time}"/></td>
                 </tr>
                   <tr>
                 <td class="td_right">处理人姓名：</td>
                  <td ><input type="text" name="handleName" class="input-text lh30 input required" value="${handleName}"/></td>
                 </tr>
                   <tr>
                 <td class="td_right">犯罪嫌疑人姓名：</td>
                  <td ><input type="text" name="chargeName" class="input-text lh30 input required" value="${chargeName}"/></td>
                 </tr>
                 <tr>
                 <td class="td_right">审核状态：</td>
                  <td ><input type="text" name="state" class="input-text lh30 input required" value="${state}"/></td>
                 </tr>
                  <tr>
                 <td class="td_right">审核结果：</td>
                  <td ><input type="text" name="result_state" class="input-text lh30 input required" value="${result_state}"/></td>
                 </tr>
                 
                 <tr>
                            <td height="42">&nbsp;</td>
                            <td><input type="submit" class="btn" value="提 交" /> &nbsp; </td>
                        </tr>
               </table>
               </form> 

            </div>
    </div>

</body>

</html>
