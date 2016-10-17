/**
 * 
 */
//页面加载完毕的时候执行查询  刑事案件登记表和呈请文书
window.onload=function(){
	$.ajax({
        url:"queryArrest.do?flag="+"false",
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
 	$("#Pagination2").paginationadmin6(num);  
	 var total = document.getElementById("allRecord");
	 total.innerText = result;
}
//查询搜查记录 成功之后调用的函数  queryCheckRecord
function succFunction(result){
	 $.ajax({
		   url:"queryFArrest.do",
	        // 数据发送方式
	        type:"post",
	        // 接受数据格式
	        dataType:"json",
	        // 要传递的数据
	        beforeSend: LoadFunction, //加载执行方法
	        error: erryFunction,  //错误执行方法  
	        success: succFunction1 //成功执行方法 
	 });
	var table = document.getElementById("table_6");//获取表格
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
	          var handleName = result_list[index].handleName;  
	          var chargeName = result_list[index].chargeName;  
	          var reason = result_list[index].reason;  
	          var time = result_list[index].time; 
	          var state = result_list[index].state;  
	          var result_state = result_list[index].resultState;
	      
	    	var idtd = document.createElement("td");
			var idText = document.createTextNode(id);
			idtd.appendChild(idText);
			
			var caseRegisterIdTd = document.createElement("td");
			var caseRegisterIdTdText = document.createTextNode(caseRegisterId);
			caseRegisterIdTd.appendChild(caseRegisterIdTdText);
			
			var chargeNameTd = document.createElement("td");
			var chargeNameTdText = document.createTextNode(chargeName);
			chargeNameTd.appendChild(chargeNameTdText);
			
			var reasonTd = document.createElement("td");
			var smallContent = null;
			if(reason.length>10){
				smallContent = reason.substring(0,10)+"……";
			}else{
				smallContent = reason;
			}
			var contentText = document.createTextNode(smallContent);
			reasonTd.appendChild(contentText);
			
			var timeTd = document.createElement("td");
			var timeTdText = document.createTextNode(time);
			timeTd.appendChild(timeTdText);
			
			var handleNameTd = document.createElement("td");
			var handleNameTdText = document.createTextNode(handleName);
			handleNameTd.appendChild(handleNameTdText);
		
			var result_statetd = document.createElement("td");
			var result_stateText;
			if(false==result_state){
				 result_stateText = document.createTextNode("未通过");
			}else{
				 result_stateText = document.createTextNode("已通过");
			}
			result_statetd.appendChild(result_stateText);
	
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
			aAgreeElement.setAttribute("href", "adminhandlerArrest.do?flag="+true+"&id="+caseRegisterId);
			var deleteText = document.createTextNode("同意  | ");
			aAgreeElement.appendChild(deleteText);
			
			var aDisAgreeElement = document.createElement("a");
			aDisAgreeElement.setAttribute("href", "adminhandlerArrest.do?flag="+false+"&id="+caseRegisterId);
			var editText = document.createTextNode("不同意 |");
			aDisAgreeElement.appendChild(editText);
			
			var detailElement = document.createElement("a");
			detailElement.setAttribute("href", "detailArrest.do?id="+caseRegisterId);
			detailElement.setAttribute("target", "_blank");
			var detailElementText = document.createTextNode("详情");
			detailElement.appendChild(detailElementText);
			
		operationTd.appendChild(aAgreeElement);
		operationTd.appendChild(aDisAgreeElement);
		operationTd.appendChild(detailElement);
		
			//③创建tr
			var trElement = document.createElement("tr");
			//④增加td到tr上
			/*trElement.appendChild(idtd);*/
			trElement.appendChild(caseRegisterIdTd);
			trElement.appendChild(chargeNameTd);
			trElement.appendChild(timeTd);
			trElement.appendChild(reasonTd);
			trElement.appendChild(handleNameTd);
			trElement.appendChild(statetd);
			trElement.appendChild(result_statetd);
			trElement.appendChild(operationTd);
         
		
	
		//⑤tr添加到table
		var tableElement = document.getElementById("table_6");
		tableElement.appendChild(trElement);
		//删除
		aAgreeElement.onclick=function(){
			return agree(aAgreeElement);
		};
		aDisAgreeElement.onclick=function(){
			return delATr(aDisAgreeElement);
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
function delTr(aDeleteElement){
	var id = aDeleteElement.parentNode.parentNode.firstChild.firstChild.nodeValue;
	var flag = window.confirm("确定要不同意"+id+"这个记录吗");
	if(!flag){
		//使网页链接失效
		return false;
	}else{
		//获取tr
	/*	var table = aDeleteElement.parentNode.parentNode.parentNode;
		var trElement = aDeleteElement.parentNode.parentNode;
		//删除
		table.removeChild(trElement);*/
		//使网页链接失效
		return true;
	}
};
function delATr(aDeleteElement){
	var id = aDeleteElement.parentNode.parentNode.firstChild.firstChild.nodeValue;
	var flag = window.confirm("确定不同意"+id+"这个记录吗");
	if(!flag){
		//使网页链接失效
		return false;
	}else{
		//获取tr
		var table = aDeleteElement.parentNode.parentNode.parentNode;
		var trElement = aDeleteElement.parentNode.parentNode;
		//删除
		table.removeChild(trElement);
		//使网页链接失效
		return true;
	}
};
//Case_Register search id  table5

//通过id查找法律文书  table6
function queryArrestecord(){
	var num = document.getElementById("querySelectA").value;
	 var checkContent = document.getElementById("postidA").value;
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
	 case "3":
		 if(checkContent != "已审核"&& checkContent !="未审核"){
			 alert("只能输入已审核/未审核");  
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
	 case "5":
		 var   reg   =   /^(\d{4})-(\d{2})-(\d{2})$/;      
	     var   arr   =   reg.exec(checkContent);      
	     if   (checkContent==""){
		     alert("内容不能为空");
		     return;//直接返回，不进行搜索
		     };      
	     if   (!reg.test(checkContent)&&RegExp.$2<=12&&RegExp.$3<=31){           
	    	 alert("日期格式不正确，请输入YYYY-mm-dd");  
	    	 document.getElementById("postid").value = "";
	    	 return;//直接返回，不进行搜索
	      }      
		 break;
	 case "4":
		 break;
	
	 }
	 
	var info = document.getElementById("querySelectA").value;
	var a=document.getElementById("postidA").value;
	var url =null;
	if(info == "1"){
		url = "queryArrest.do?flag="+"search&info=id&id="+a;
	}else if(info == "2"){
		url = "queryArrest.do?flag="+"search&info=resultState&resultState="+a;
	}else if(info == "3"){
		url = "queryArrest.do?flag="+"search&info=state&state="+a;
	}
	else if(info == "4"){
		url = "queryArrest.do?flag="+"search&info=handlePerson&handlePerson="+a;
	}
	else if(info == "5"){
		url = "queryArrest.do?flag="+"search&info=time&time="+a;
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
