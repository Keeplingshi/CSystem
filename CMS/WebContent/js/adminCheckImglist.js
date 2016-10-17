/**
 * 
 */
//页面加载完毕的时候执行查询  刑事案件登记表和呈请文书
window.onload=function(){
	$.ajax({
        url:"queryCheckRecord.do?flag="+"false",
        // 数据发送方式
        type:"get",
        // 接受数据格式
        dataType:"json",
        // 要传递的数据
        beforeSend: LoadFunction, //加载执行方法
        error: erryFunction,  //错误执行方法  
        success: succFunction //成功执行方法 
	});/*data:param,  */
};


 function LoadFunction() {  
	 /* alert("加载中"); */  
	} 
function erryFunction(XMLHttpRequest, result, errorThrown,res) {  
 alert(XMLHttpRequest.status);   // 200    
  alert(res);
  alert(errorThrown);  
}  
//查询共有多少条记录
function succFunction1(result){
   	var num = Math.ceil(result/6);
   	num = (num <2)?1:num;
   	$("#Pagination2").paginationadmin4(num);  
	 var total = document.getElementById("allRecord");
	 total.innerText = result;
}
//查询搜查记录 成功之后调用的函数  queryCheckRecord
function succFunction(result){
	 $.ajax({
		   url:"queryFCheck.do",
	        // 数据发送方式
	        type:"post",
	        // 接受数据格式
	        dataType:"json",
	        // 要传递的数据
	        beforeSend: LoadFunction, //加载执行方法
	        error: erryFunction,  //错误执行方法  
	        success: succFunction1 //成功执行方法 
	 });
	var table = document.getElementById("table_4");//获取表格
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
          var ID = result_list[index].id;  
          var idcard = result_list[index].caseRegisterId;  
          var content = result_list[index].content; 
          var resultState = result_list[index].resultState;
          var state = result_list[index].state;  
         
    	var IDtd = document.createElement("td");
		var IDText = document.createTextNode(ID);
		IDtd.appendChild(IDText);
		
		var IDCardTd = document.createElement("td");
		var IDCardText = document.createTextNode(idcard);
		IDCardTd.appendChild(IDCardText);
	
		var contenttd = document.createElement("td");
		var smallContent = null;
		if(content.length>10){
			smallContent = content.substring(0,10)+"……";
		}else{
			smallContent = content;
		}
		var contentText = document.createTextNode(smallContent);
		contenttd.appendChild(contentText);
	
		var resultStatetd = document.createElement("td");
		var result_stateText;
		if(false==resultState){
			 result_stateText = document.createTextNode("未通过");
		}else{
			 result_stateText = document.createTextNode("已通过");
		}
		resultStatetd.appendChild(result_stateText);
		
		var statetd = document.createElement("td");
		var stateText;
		if(false==state){
			stateText = document.createTextNode("未审核");
		}else{
			stateText = document.createTextNode("已审核");
		}
		statetd.appendChild(stateText);
		
		var operationTd = document.createElement("td");
		var aAgreeElement = document.createElement("a");
		aAgreeElement.setAttribute("href", "adminhandlerCheckR.do?flag="+true+"&id="+idcard);
		var deleteText = document.createTextNode("同意   |");
		aAgreeElement.appendChild(deleteText);
		
		var aDisAgreeElement = document.createElement("a");
		aDisAgreeElement.setAttribute("href", "adminhandlerCheckR.do?flag="+false+"&id="+idcard);
		var editText = document.createTextNode("不同意 |");
		aDisAgreeElement.appendChild(editText);
		
		var detailElement = document.createElement("a");
		detailElement.setAttribute("href", "detailCheck.do?id="+idcard);
		detailElement.setAttribute("target", "_blank");
		var detailElementText = document.createTextNode("详情");
		detailElement.appendChild(detailElementText);
		
	operationTd.appendChild(aAgreeElement);
	operationTd.appendChild(aDisAgreeElement);
	operationTd.appendChild(detailElement);
		
		//③创建tr
		var trElement = document.createElement("tr");
		//④增加td到tr上
//		trElement.appendChild(IDtd);
		trElement.appendChild(IDCardTd);
		trElement.appendChild(contenttd);
		trElement.appendChild(resultStatetd);
		trElement.appendChild(statetd);
		trElement.appendChild(operationTd);
		//⑤tr添加到table
		var tableElement = document.getElementById("table_4");
		tableElement.appendChild(trElement);
		//删除
		aDisAgreeElement.onclick=function(){
			return delTr(aDisAgreeElement);
		};
		aAgreeElement.onclick=function(){
			return agree(aAgreeElement);
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
function delTr(aDisAgreeElement){
	var id = aDisAgreeElement.parentNode.parentNode.firstChild.firstChild.nodeValue;
	var flag = window.confirm("确定不同意"+id+"这个记录吗");
	if(!flag){
		//使网页链接失效
		return false;
	}else{
		//获取tr
	/*	var table = aDisAgreeElement.parentNode.parentNode.parentNode;
		var trElement = aDeleteElement.parentNode.parentNode;
		//删除
		table.removeChild(trElement);*/
		//使网页链接失效
		return true;
	}
};
//Case_Register search id  table3


//通过id查找法律文书  table4
function queryCheckRecord(){
	 var num = document.getElementById("querySelectQ").value;
	 var checkContent = document.getElementById("queryCRid").value;
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
		 if(checkContent != "未通过"&&checkContent !="已通过"){
			 alert("只能输入已通过/未通过");  
	    	 document.getElementById("postid").value = "";
	    	 return;//直接返回，不进行搜索
		 }
		 break;
	 case "3":
		 if(checkContent != "已审核"&& checkContent !="未审核"){
			 alert("只能输入已审核/未审核");  
	    	 document.getElementById("postid").value = "";
	    	 return;//直接返回，不进行搜索
		 }
		 break;
	 }
	var info = document.getElementById("querySelectQ").value;
	var a=document.getElementById("queryCRid").value;
	var url =null;
	if(info == "1"){
		url = "queryCheckRecord.do?flag="+"search&info=id&id="+a;
	}else if(info == "2"){
		url = "queryCheckRecord.do?flag="+"search&info=resultState&resultState="+a;
	}else if(info == "3"){
		url = "queryCheckRecord.do?flag="+"search&info=state&state="+a;
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
        success: succFunction //成功执行方法 
	});
}

