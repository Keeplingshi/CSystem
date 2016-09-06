<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>		

<!-- 增加联系笔记类型界面 -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/button.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addEditView.css" />
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/resources/layer/layer.js"></script>

<form id="linkNoteTypeAddFormId" modelAttribute="domain" action="${pageContext.request.contextPath}/admin/linkNoteType/save" method="post">
	<table>
		<tr>
			<td class="lesta-150">联系类型名称：</td>
			<td class="lestb">
				<input type="text" id="linkNoteTypename" name="name" class="input_text_a" placeholder="请输入联系笔记类型" style="ime-mode:disabled" onkeydown="if(event.keyCode==13)event.keyCode=9" onkeypress="if ((event.keyCode<48 || event.keyCode>57)) event.returnValue=false"/>
			</td>
		</tr>
	</table>
	<input id="saveButton" type="button" class="button button-highlight button-rounded button-small" style="margin-top:20px; margin-left: 140px;" value="确定"/>
</form>

<script>
	
	$("#saveButton").click(function(){
		
		var linkNoteTypenameVal=$("#linkNoteTypename").val();
		if(linkNoteTypenameVal==null||linkNoteTypenameVal==''){
			layer.tips('联系笔记类型不能为空', '#linkNoteTypename');
			return;
		}
		
		var form = $("#linkNoteTypeAddFormId");
		form.ajaxSubmit(function(result){
			if(result=='success'){

				parent.layer.msg("新增成功！", {
					offset: ['260px'],
					time: 1500//1.5s后自动关闭
				});
				//关闭当前新增页面页
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭    
			}else{
				layer.msg("新增失败！", {
					offset: ['260px'],
					time: 1500//1.5s后自动关闭
				});
			}
		});
		
	});

</script>
