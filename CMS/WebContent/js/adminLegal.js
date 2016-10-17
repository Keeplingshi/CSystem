/**
 * 
 */

//页面加载完毕的时候执行
window.onload=function(){
	$.ajax({
        url:"queryLawDocument.do?flag="+"false",
        // 数据发送方式
        type:"post",
        // 接受数据格式
        dataType:"json",
        // 要传递的数据
        beforeSend: LoadFunction, //加载执行方法
        error: erryFunction,  //错误执行方法  
        success: succFunction1 //成功执行方法 
	});/*data:param,  */
	
	 function LoadFunction() {  
			 /* alert("加载中");   */
      }  
      function erryFunction(XMLHttpRequest, result, errorThrown,res) {  
    	  alert(XMLHttpRequest.status);   // 200    
    	  alert(res);
    	  alert(errorThrown); 
      }  
      
      //查询共有多少条记录
      function succFunction(result){
         	var num = Math.ceil(result/6);
          	var n = (num<2)?1:num;
          	$("#Pagination2").adminpagination2(n); 
      	 var total = document.getElementById("allRecord");
      	 total.innerText = result;
      }
      
      function succFunction1(result) { 
    	  $.ajax({
		        url:"queryFLegal.do",
		        // 数据发送方式
		        type:"post",
		        // 接受数据格式
		        dataType:"json",
		        // 要传递的数据
		        beforeSend: LoadFunction, //加载执行方法
		        error: erryFunction,  //错误执行方法  
		        success: succFunction //成功执行方法 
			}); 	
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
    					var stateText;
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
    	    			return delTr(aDisAgreeElement);
    	    		};
    	     		aAgreeElement.onclick=function(){
    	     			return agree(aAgreeElement);//必须是return，否则不能把结果返回到agreeElement
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
	var flag = window.confirm("确定不同意："+id+"这个申请吗");
	if(!flag){
		//使网页链接失效
		return false;
	}else{
		//获取tr
		/*var table = aDisAgreeElement.parentNode.parentNode.parentNode;
		var trElement = aDisAgreeElement.parentNode.parentNode;
		//删除
		table.removeChild(trElement);*/
		//使网页链接失效
		return true;
	}
};

//通过id查找法律文书
function queryLD(){
	var a=document.getElementById("queryLDid").value;
	$.ajax({
        url:"queryLawDocument.do?flag="+"search&id="+a,
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


};