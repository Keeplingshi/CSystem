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
        		 var Name = resultList[index].name;

        		 //添加到id选择框
        		 var idSelect = document.getElementById("idSelect");
        		 var idOption = document.createElement("OPTION"); 
        		 idOption.value = ID;
        		 idOption.text = ID;
        		 idSelect.options.add(idOption); 
				//添加到姓名选择框
        		 var nameSelect = document.getElementById("name");
        		 var nameOption = document.createElement("OPTION"); 
        		 nameOption.value = Name;
        		 nameOption.text = Name;
        		 nameSelect.options.add(nameOption); 
           });
      };
      </script>
</head>
<body>
 <div class="head">	
        </div>
        <div id="container">
          <div class="demo">
                <form id="myform" action="AddlegalInstrument.do" method="get">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="mytable">
                     	<tr>
                            <td width="22%" align="right">案件登记表表id：</td>
                            <td><select id="idSelect" name="idSelect"></select>
                                <p>请选择对应的刑事案件登记表</p></td>
                        </tr>
                        <tr>
                            <td width="22%" align="right">内容：</td>
                            <td><input type="text" name="content" id="content" class="input required" value="内容"/>
                                <p>输入法律呈请内容</p>
                            </td>
                        </tr>
                       <tr>
                            <td align="right">处理人姓名：</td>
                            <td><select id="name" name="name"></select>
                                <p>请填写处理人的姓名</p>
                             </td>
                        </tr>
                        <tr>
                            <td height="42">&nbsp;</td>
                            <td><input type="submit" class="btn" value="提 交" /> &nbsp; <input type="reset" class="btn" value="重 置" /></td>
                        </tr>
                    </table>
                </form>

            </div>
    </div>

</body>

</html>
