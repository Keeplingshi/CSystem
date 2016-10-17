<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/pagination2.css" />
<script type="text/javascript" src="js/adminLegal.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.adminpagination2.js"></script>
<!-- <script type="text/javascript">
$(document).ready(function() {
	$("#Pagination2").adminpagination2("15"); 
});
</script> -->
<script language="javascript">
function queryLD(){
	 var num = document.getElementById("querySelect1").value;
	 var checkContent = document.getElementById("queryLDid").value;
	 if   (checkContent==""){
	     alert("内容不能为空");
	     return;//直接返回，不进行搜索
	     };  
	 switch(num){
	 case "1":
		 var n = Number(checkContent);
		 if(isNaN(n)){
			 alert("请输入数字");
		     document.getElementById("postid").value = "";
		     return;//直接返回，不进行搜索
		 }
		 break;
	 case "2":
		 break;
	 case "3":
		 if(checkContent != "未通过"&&checkContent !="已通过"){
			 alert("只能输入通过/未通过");  
	    	 document.getElementById("postid").value = "";
	    	 return;//直接返回，不进行搜索
		 }
		 break;
	 }
	var info = document.getElementById("querySelect1").value;
	var a=document.getElementById("queryLDid").value;
	if(info == "1"){
		url = "queryLawDocument.do?flag="+"search&info=id&id="+a;
	}else if(info == "2"){
		url = "queryLawDocument.do?flag="+"search&info=staffName&staffName="+a;
	}else if(info == "3"){
		url = "queryLawDocument.do?flag="+"search&info=resultState&resultState="+a;
	}
	$.ajax({
        url:url,
        // 数据发送方式
        type:"get",
        // 接受数据格式
        dataType:"json",
        // 要传递的数据
        beforeSend: LoadFunction, //加载执行方法
        error: erryFunction,  //错误执行方法  
        success: succFunction1 //成功执行方法 
	});
}
function succFunction1(result) { 
	 var table = document.getElementById("table_2");//获取表格
		if(table==null ||table==""){
			alert("获取表格为空");
		}else{
			var rows = table.rows.length ;//获取表格的行数
			for(var i=rows-1;i>0;i--){
				table.deleteRow(i);
			}
		}
		var result_list = eval(result);
	     $.each(result_list, function (index, item) {  
	         //循环获取数据    
	          var id = result_list[index].id;  
	          var caseRegisterId = result_list[index].caseRegisterId;  
	          var content = result_list[index].content; 
	          var staffName = result_list[index].staffName;  
	          var result_state = result_list[index].result_state;
	          var state = result_list[index].state;  
	        
	          var result_statetd = document.createElement("td");
				var result_stateText;
				if(false==result_state){
					 result_stateText = document.createTextNode("未通过");
				}else{
					 result_stateText = document.createTextNode("已通过");
				}
				result_statetd.appendChild(result_stateText);
				 
				var statetd = document.createElement("td");
				var stateText=null;
				if(false==state){
					stateText = document.createTextNode("未审核");
				}else{
					stateText = document.createTextNode("已审核");
				}
				statetd.appendChild(stateText);
				
	    	var idtd = document.createElement("td");
			var idText = document.createTextNode(id);
			idtd.appendChild(idText);
			
			var caseRegisterIdTd = document.createElement("td");
			var caseRegisterIdTdText = document.createTextNode(caseRegisterId);
			caseRegisterIdTd.appendChild(caseRegisterIdTdText);
		
			var contenttd = document.createElement("td");
			var smallContent = null;
			if(content.length>10){
				smallContent = content.substring(0,10)+"……";
			}else{
				smallContent = content;
			}
			var contentText = document.createTextNode(smallContent);
			contenttd.appendChild(contentText);
			
			var staffNametd = document.createElement("td");
			var staffNameText = document.createTextNode(staffName);
			staffNametd.appendChild(staffNameText);
			
			  var statetd = document.createElement("td");
				statetd.appendChild(stateText);
				
				var detailElement = document.createElement("a");
				detailElement.setAttribute("href", "detailLG.do?id="+id);
	    		detailElement.setAttribute("target", "_blank");
	    		var detailText = document.createTextNode("详情 |");
	    		detailElement.appendChild(detailText);
	    		
			var operationTd = document.createElement("td");
			var aAgreeElement = document.createElement("a");
			aAgreeElement.setAttribute("href", "adminhandlerLD.do?flag="+true+"&id="+id);
			var deleteText = document.createTextNode("同意   ");
			aAgreeElement.appendChild(deleteText);
			
			var aDisAgreeElement = document.createElement("a");
			aDisAgreeElement.setAttribute("href", "adminhandlerLD.do?flag="+false+"&id="+id);
			var editText = document.createTextNode("不同意");
			aDisAgreeElement.appendChild(editText);
		
		operationTd.appendChild(detailElement);
		operationTd.appendChild(aAgreeElement);
		operationTd.appendChild(aDisAgreeElement);
			
			//③创建tr
			var trElement = document.createElement("tr");
			//④增加td到tr上
			trElement.appendChild(idtd);
    				trElement.appendChild(caseRegisterIdTd);
    				trElement.appendChild(staffNametd);
    				trElement.appendChild(contenttd);
    				trElement.appendChild(statetd);
    				trElement.appendChild(result_statetd);
    				trElement.appendChild(operationTd);
			
			
			//⑤tr添加到table
			var tableElement = document.getElementById("table_2");
			tableElement.appendChild(trElement);
			//删除
   		aDisAgreeElement.onclick=function(){
   			 delTr(aDisAgreeElement);
   		};
   		aAgreeElement.onclick=function(){
			 agree(aAgreeElement);
		};
     });  
}   

function agree(aAgreeElement){
	var id = aAgreeElement.parentNode.parentNode.firstChild.firstChild.nodeValue;
	var flag = window.confirm("确定要同意"+id+"这个记录吗");
	if(!flag){
		//使网页链接失效
		return false;
	}else{
		//获取tr
		var table = aAgreeElement.parentNode.parentNode.parentNode;
		var trElement = aAgreeElement.parentNode.parentNode;
		//删除
		table.removeChild(trElement);
		//使网页链接失效
		return true;
	}
};
</script> 
<script language="javascript">
	$(function(){	
		//导航切换
		$(".imglist li").click(function(){
			$(".imglist li.selected").removeClass("selected");
			$(this).addClass("selected");
		});
	});
	 function LoadFunction() {  
		 /* alert("加载中");   */
  }  
  function erryFunction(XMLHttpRequest, result, errorThrown,res) {  
	  alert(XMLHttpRequest.status);   // 200    
	  alert(res);
	  alert(errorThrown); 
  }  

function delTr(aDisAgreeElement){
	var id = aDisAgreeElement.parentNode.parentNode.firstChild.firstChild.nodeValue;
	var flag = window.confirm("确定不同意："+id+"这个申请吗");
	if(!flag){
		//使网页链接失效
		return false;
	}else{
		//获取tr
	/* 	var table = aDisAgreeElement.parentNode.parentNode.parentNode;
		var trElement = aDisAgreeElement.parentNode.parentNode;
		//删除
		table.removeChild(trElement); */
		//使网页链接失效
		return true;
	}
};
</script>
</head>

<body>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
		    <li><a href="AdminLegalImgtable.jsp">刑事呈请法律文书记录</a></li>
	    </ul>
    </div>
	    
	<div class="tools">
	        <div class="search-box" style="padding-top:20px;position: relative; z-index: 5;float:right;">
                 <div class="input-box"> 
                  	<select id="querySelect1">
                      	    	<option value="1">根据id查找</option>
                      	    	<option value="2">根据处理人查找</option>
                      	    	<option value="3">根据处理状态 查找</option>
                      	    </select>
                     <input name="queryLDid" type="text" class="inp-metro" id="queryLDid" placeholder="请输入查找id" maxlength="26" autocomplete="off" style="color: rgb(51, 51, 51);"/>
                     <input type="button" id="queryLD" onclick="queryLD()"value="搜索"/>
                 </div>
            </div>
	   </div>
	   
    <div class="formtitle"><span>呈请法律文书登记</span></div>
    
    <div class="toolsli">
     <table class="imgtable" id="table_2">
		    <thead>
			    <tr>
				    <th>案件登记表表id</th>
				    <th>案件登记表id</th>
				     <th>处理人姓名</th>
				    <th>内容</th>
				    <th>审核状态</th>
				    <th>审核结果</th>
				    <th>操作</th>
			    </tr>
		    </thead>
    		<tbody>
    		</tbody>
      </table>
    </div>
    
     <div class="pagin">
	    	 <div class="message">全部数据共
	    		<i id="allRecord" class="blue"></i>条记录，当前显示第&nbsp;&nbsp;
		        <i id="nowPage" class="blue">1&nbsp;&nbsp;</i>页
		    </div>
	 </div>
		  <div class="pages2">
	        <div id="Pagination2"></div>
	        <div class="searchPage">
	        <!--   <span class="page-go">跳转<input type="text"/>页 <a href="javascript:;" class="page-btn">GO</a></span> -->
	         
	        </div>
 		</div>
    

    
    </div>
    
    
<script type="text/javascript">
	$('.imgtable tbody tr:odd').addClass('odd');
</script>
    
</body>

</html>
