window.onload=function(){

	$.ajax({
        url:"queryStaff.do?flag="+"",
        // 数据发送方式
        type:"post",
        // 接受数据格式
        dataType:"json",
        // 要传递的数据
        beforeSend: LoadFunction, //加载执行方法
        error: erryFunction,  //错误执行方法  
        success: succFunction //成功执行方法 
	});
};
 function LoadFunction() {  
	/* alert("加载中"); */  
	} 
 
//查询共有多少条记录
 function succFunction1(result){
  	var num = Math.ceil(result/6);
  	num = (num < 2)?1:num;
  	$("#Pagination").paginationstaff(num);  
 	 var total = document.getElementById("allRecord");
 	 total.innerText = result;
 }
 
 //查询法律文书成功调用的函数
 function succFunction(result) { 
	 $.ajax({
		   url:"queryAllStaff.do",
	        // 数据发送方式
	        type:"post",
	        // 接受数据格式
	        dataType:"json",
	        // 要传递的数据
	        beforeSend: LoadFunction, //加载执行方法
	        error: erryFunction,  //错误执行方法  
	        success: succFunction1 //成功执行方法 
	 });
	 var table = document.getElementById("list_table");//获取表格
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
	          var Id = result_list[index].id;  
	          var Idcard = result_list[index].idcard;  
	          var StaffName = result_list[index].staffName; 
	          var LoginName = result_list[index].loginName;  
	          var LoginPwd = result_list[index].loginPwd;  
	          var Identify = result_list[index].identify;
	          
	      	var checkBoxtd=document.createElement("input");
	      	checkBoxtd.setAttribute("id",Id);
	      	checkBoxtd.setAttribute("name","ch");
			checkBoxtd.setAttribute("type","checkbox");
			
			var tdTd = document.createElement("td");
	      	tdTd.setAttribute("class","td_center");
	      	tdTd.appendChild(checkBoxtd);
			
	    	var idtd = document.createElement("td");
			var idText = document.createTextNode(Id);
			idtd.appendChild(idText);
			
			var Idcardtd = document.createElement("td");
			var IdcardText = document.createTextNode(Idcard);
			Idcardtd.appendChild(IdcardText);
			
			var staffNametd = document.createElement("td");
			var staffNameText = document.createTextNode(StaffName);
			staffNametd.appendChild(staffNameText);
			
			var LoginNametd = document.createElement("td");
			var LoginNameText = document.createTextNode(LoginName);
			LoginNametd.appendChild(LoginNameText);
			
			var LoginPwdtd = document.createElement("td");
			var LoginPwdText = document.createTextNode(LoginPwd);
			LoginPwdtd.appendChild(LoginPwdText);
			
			var IdentifyTd = document.createElement("td");
			var IdentifyText = document.createTextNode(Identify);
			IdentifyTd.appendChild(IdentifyText);
			
			//③创建tr
			var trElement = document.createElement("tr");
			//④增加td到tr上
			trElement.appendChild(tdTd);
			trElement.appendChild(idtd);
			trElement.appendChild(Idcardtd);
			trElement.appendChild(staffNametd);
			trElement.appendChild(LoginNametd);
			trElement.appendChild(LoginPwdtd);
			trElement.appendChild(IdentifyTd);

				var operationTd = document.createElement("td");
					var aDeleteElement = document.createElement("a");
					aDeleteElement.setAttribute("href", "doDelStaff.do?id="+Id);
					var deleteText = document.createTextNode("删除   |   ");
					aDeleteElement.appendChild(deleteText);
					
					var aEditElement = document.createElement("a");
					aEditElement.setAttribute("href", "editStaff.do?id="+Id);
					aEditElement.setAttribute("target", "_blank");
					var editText = document.createTextNode("修改");
					aEditElement.appendChild(editText);
					
			operationTd.appendChild(aDeleteElement);
			operationTd.appendChild(aEditElement);
			trElement.appendChild(operationTd);
			
			aDeleteElement.onclick=function(){
				return delTr(aDeleteElement);
			};
			//⑤tr添加到table
			var tableElement = document.getElementById("list_table");
			tableElement.appendChild(trElement);
			//删除
			
	     });  
	}   
 function erryFunction(XMLHttpRequest, result, errorThrown,res) {  
	  alert(XMLHttpRequest.status);   // 200    
	   alert(res);
	   alert(errorThrown); 
	 } 
 
 function queryStaff(){
	 var info = document.getElementById("queryStaff").value;
	 switch(info){
	 case "1":
		 var checkContent = document.getElementById("staffID").value;
		 if   (checkContent==""){
		     alert("内容不能为空");
		     return;//直接返回，不进行搜索
		     };  
		 var n = Number(checkContent);
		 if(isNaN(n)){
			 alert("请输入数字");
		     document.getElementById("staffID").value = "";
		     return;//直接返回，不进行搜索
		 }
		 break;
	 case "2":
		 var checkContent = document.getElementById("name").value;
		 if   (checkContent==""){
		     alert("内容不能为空");
		     return;//直接返回，不进行搜索
		     };  
		 break;
	 case "3":
		 var checkContent = document.getElementById("idcard").value;
		 if   (checkContent==""){
		     alert("内容不能为空");
		     };
		 break;
	 case "4":
		 var checkContent = document.getElementById("loginname").value;
		 if   (checkContent==""){
		     alert("内容不能为空");
		     return;//直接返回，不进行搜索
		     };  
		 break;
	
	 }
	 
	 
		var info = document.getElementById("queryStaff").value;
		if(info == "1"){
			var a=document.getElementById("staffID").value;
			url = "queryStaff.do?flag="+"search&info=staffID&staffID="+a;
		}else if(info == "2"){
			var a=document.getElementById("name").value;
			url = "queryStaff.do?flag="+"search&info=staffName&staffName="+a;
		}else if(info == "3"){
			var a=document.getElementById("idcard").value;
			url = "queryStaff.do?flag="+"search&info=idcard&idcard="+a;
		}else if(info == "4"){
			var a=document.getElementById("loginname").value;
			url = "queryStaff.do?flag="+"search&info=loginname&loginname="+a;
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
 
 function addS(){
	 var info = document.getElementById("queryStaff").value;
		$.ajax({
	        url:"AddStaff.do",
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
 $(document).ready(function(){
		//刑事案件登记表的添加
		  $("#add").click(function(){
		 	 $(".box1").fadeIn(200);
		 });
		  $("#sub").click(function(){
		 	 $(".box1").fadeOut(200);
		 });
 });
 //实现全选
 function checkAll(e){    //全选函数
	    var aa = document.getElementsByName("ch"); 
	 for(var i=0;i<aa.length;i++){
	     aa[i].checked = true;
	    
	 }
	}
 
 //实现取消全选
 function DischeckAll(e){    //全选函数
	    var aa = document.getElementsByName("ch"); 
	 for(var i=0;i<aa.length;i++){
	     aa[i].checked = false;
	    
	 }
	}
 function deleteSelect(){
	   var aa = document.getElementsByName("ch"); 
		 for(var i=0;i<aa.length;i++){
		     if(aa[i].checked == true){//如果这个被选中
		    	 var id = aa[i].id;
		    	 $.ajax({ 
		 			type: "POST", 
		 			dataType: "text", 
		 			url:"doDelStaff.do?id="+id,//提交到一般处理程序请求数据 
		 			success: function() {
		 				 $.ajax({
		 					   url:"queryStaff.do",
		 				        // 数据发送方式
		 				        type:"post",
		 				        // 接受数据格式
		 				        dataType:"json",
		 				        // 要传递的数据
		 				        beforeSend: LoadFunction, //加载执行方法
		 				        error: erryFunction,  //错误执行方法  
		 				        success: succFunction //成功执行方法 
		 				 });
		 			}
		 	 });
		     }
		    
		 }
	
 }
