<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>呈请刑事法律文书</title>
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery.js"></script>
 	<script type="text/javascript" src="js/jquery.validate.js"></script>
     <script type="text/javascript" src="js/validate-ex.js"></script>
      <script type="text/javascript" src="js/upload.js"></script>
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
      <script type="text/javascript">
      //页面加载完之后
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
		$.ajax({
	        url:"queryStaffName.do",
	        // 数据发送方式
	        type:"get",
	        // 接受数据格式
	        dataType:"json",
	        // 要传递的数据
	        success: succFunction1 //成功执行方法 
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
    	//设置select的默认选项
    	$("#caseRegisterId  option[value='${caseRegisterId}'] ").attr("selected",true);
	     
  };
  function succFunction1(result){
    	var resultList = eval(result);
    	$.each(resultList, function (index, item) {
    		 var Name = resultList[index].staffName;
			//添加到姓名选择框
    		 var nameSelect = document.getElementById("staffName");
    		 var nameOption = document.createElement("OPTION"); 
    		 nameOption.value = Name;
    		 nameOption.text = Name;
    		 nameSelect.options.add(nameOption); 
       });
    	 $("#staffName option[value='${staffName}'] ").attr("selected",true);
  };

      </script>
</head>
<body>
 <div class="head">	
 <div class="legalEformtitle"><span>呈请法律文书修改</span></div>
        </div>
        <div id="container">
          <div class="demo1">
                <form id="myform" action="geteditLD.do" method="get">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mytableedit">
                      <tr>
                    	    <td width="22%" align="right">编号：</td>
                    	    <td><input type="text" name="id" id="id" class="input-text lh30 input required" value=${id} readonly="readonly"/></td>
                    	</tr>
                     	<tr>
                            <td width="22%" align="right">案件登记表表id：</td>
                            <td>
                               <select id="caseRegisterId" name="caseRegisterId"></select>
                                <font size="2px" color="#C0C0C0">请选择对应的刑事案件登记表</font>
                            </td>
                        </tr>
                        <tr>
                            <td width="22%" align="right">内容：</td>
                            <td><textarea style="height: 150px;width: 490px;" name="content" id="content" class="input required">${content} </textarea>
                                <br />
                                <font size="2px" color="#C0C0C0">请在此输入呈请法律文书内容</font>
                            </td>
                        </tr>
                       <tr>
                            <td align="right">处理人姓名：</td>
                            <td>
                            	<select id="staffName" name="staffName"></select>
                                 <font size="2px" color="#C0C0C0">请填写处理人的姓名</font>
                             </td>
                        </tr>
                        <tr>
                            <td align="right">审核状态：</td>
                             <td><input type="text" name="state" id="state" class="input required" value=${state} readonly="readonly"/>
                             <font size="2px" color="#C0C0C0">审核状态无法被修改</font>
                             </td>
                        </tr>
                        <tr>
                            <td align="right">审核结果：</td>
                             <td><input type="text" name="result_state" id="result_state" class="input required" value=${result_state} readonly="readonly"/>
                              <font size="2px" color="#C0C0C0">审核结果无法被修改</font>
                              </td>
                        </tr>
                        <tr>
                            <td height="42">&nbsp;</td>
                            <td><input type="submit" class="btn" value="提 交" /> &nbsp; <input type="reset" class="btn" onclick="custom_close()" value="返回" /></td>
                        </tr>
                    </table>
                </form>

            </div>
    </div>

</body>

</html>
