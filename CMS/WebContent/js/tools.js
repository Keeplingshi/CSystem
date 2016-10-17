/**
 * 
 */
//页面加载完毕的时候执行查询  刑事案件登记表和呈请文书
window.onload=function(){
	$.ajax({
        url:"queryDetention.do?flag="+"",
        // 数据发送方式
        type:"get",
        // 接受数据格式
        dataType:"json",
        // 要传递的数据
        beforeSend: LoadFunction, //加载执行方法
        error: erryFunction,  //错误执行方法  
        success: succFunction1 //成功执行方法 
	});/*data:param,  */
};
//查询共有多少条记录
function succFunction(result){
   	var num = Math.ceil(result/6);
   	num = (num < 2)?1:num;
   $("#Pagination").pagination5(num);
	 var total = document.getElementById("allRecord");
	 total.innerText = result;
}

 function LoadFunction() {  
	 /* alert("加载中"); */  
	} 
 
 //查询询问笔录 成功调用的函数 queryQRecord
 function succFunction1(result) { 
	 $.ajax({
		   url:"queryAllDetention.do",
	        // 数据发送方式
	        type:"post",
	        // 接受数据格式
	        dataType:"json",
	        // 要传递的数据
	        beforeSend: LoadFunction, //加载执行方法
	        error: erryFunction,  //错误执行方法  
	        success: succFunction //成功执行方法 
	 });
	 var table = document.getElementById("table_5");//获取表格
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
	       
			var operationTd = document.createElement("td");
			//当管理员没有审批或者审核结果是没有通过
			if(result_state == false||state == false){
				var aDeleteElement = document.createElement("a");
				aDeleteElement.setAttribute("href", "deletDetention.do?id="+caseRegisterId);
				var deleteText = document.createTextNode("删除  | ");
				aDeleteElement.appendChild(deleteText);
				
				var aEditElement = document.createElement("a");
				aEditElement.setAttribute("href", "editDetention.do?id="+caseRegisterId);
				aEditElement.setAttribute("target", "_blank");
				var editText = document.createTextNode(" 修改 |");
				aEditElement.appendChild(editText);
	
			operationTd.appendChild(aDeleteElement);
			operationTd.appendChild(aEditElement);
			
			aDeleteElement.onclick=function(){
				return delTr(aDeleteElement);
			};
		}
			var detailElement = document.createElement("a");
			detailElement.setAttribute("href", "detailDetention.do?id="+caseRegisterId);
			detailElement.setAttribute("target", "_blank");
			var detailElementText = document.createTextNode("详情");
			detailElement.appendChild(detailElementText);
			
			operationTd.appendChild(detailElement);
			trElement.appendChild(operationTd);
			
			//⑤tr添加到table
			var tableElement = document.getElementById("table_5");
			tableElement.appendChild(trElement);
			//删除
	     });  
	}   

 
function erryFunction(XMLHttpRequest, result, errorThrown,res) {  
 alert(XMLHttpRequest.status);   // 200    
  alert(res);
  alert(errorThrown);  
}  

function delTr(aDeleteElement){
	var id = aDeleteElement.parentNode.parentNode.firstChild.firstChild.nodeValue;
	var flag = window.confirm("确定要删除"+id+"这个记录吗");
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

//通过id查询刑事案件登记表
function queryD(){
	 var num = document.getElementById("querySelectD").value;
	 var checkContent = document.getElementById("postid").value;
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
	 
	var info = document.getElementById("querySelectD").value;
	var a=document.getElementById("postid").value;
	var url =null;
	if(info == "1"){
		url = "queryDetention.do?flag="+"search&info=id&id="+a;
	}else if(info == "2"){
		url = "queryDetention.do?flag="+"search&info=resultState&resultState="+a;
	}else if(info == "3"){
		url = "queryDetention.do?flag="+"search&info=state&state="+a;
	}
	else if(info == "4"){
		url = "queryDetention.do?flag="+"search&info=handlePerson&handlePerson="+a;
	}
	else if(info == "5"){
		url = "queryDetention.do?flag="+"search&info=time&time="+a;
	}
	$.ajax({
        url:url,
        // 数据发送方式
        type:"post",
        // 接受数据格式
        dataType:"json",
        // 要传递的数据
        beforeSend: LoadFunction, //加载执行方法
        error: erryFunction,  //错误执行方法  
        success: succFunction1 //成功执行方法 
	});
}

$(document).ready(function(){
	//询问笔录登记表的添加
	  $(".clickaddD").click(function(){
	 	 $(".tip").fadeIn(200);
	 });
	  $(".tiptop a").click(function(){
	 	 $(".tip").fadeOut(200);
	 });
	  $(".sure").click(function(){
	 	 $(".tip").fadeOut(100);
	 	 window.location="detention.jsp";
	});
	  $(".cancel").click(function(){
	  	$(".tip").fadeOut(100);
	});
});/**
 * 
 */