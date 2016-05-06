/**
 * 根据传入的${pk["javaName"]},加载质量判定等级信息
 * @param {Object} ${pk["javaName"]}
 */
<#assign idPreName = "${'${middelPath}'?replace('/','_')}">

function load${ClassName?cap_first}(${pk["javaName"]}){
	$("#${idPreName}_editForm").form("clear");
    var url = getAbsolutePath("/<#assign s = "${middelPath}"?split("/")>${s[0]}/load${ClassName?cap_first}.do?${pk["javaName"]}=" + ${pk["javaName"]});
    $.ajax({
        type: "POST",
        url: url,
        dataType: "json",
        success: function(data){
            if (data.success) {
            	var formdata = data.${ClassName?uncap_first};
                $("#${idPreName}_editForm").form("load", formdata);
                $("#${idPreName}_editForm input[name='createId.userId']").val(formdata["createId"]["userId"]);
                $("#${idPreName}_editForm input[name='createName']").val(formdata["createId"]["userName"]); 
                $("#${idPreName}_editForm input[name='modifyId.userId']").val(formdata["createId"]["userId"]);
                $("#${idPreName}_editForm input[name='modifyName']").val(formdata["modifyId"]["userName"]); 
            }
            else {
                $.messager.alert("错误", data.msg, "error");
            }
        }
    });
}
/**
 * 保存${modelName}
 * @param  null
 */
function save${ClassName?cap_first}(){
    var url = getAbsolutePath("/<#assign s = "${middelPath}"?split("/")>${s[0]}/save${ClassName?cap_first}.do");
    var fields = serializeObject($("#${"${middelPath}"?replace("/","_")}_editForm"));
    if ($("#${idPreName}_editForm").form("validate")) {
        $.ajax({
            type: "POST",
            url: url,
			data : fields,
            dataType: "json",
            success: function(data){
                if (data.success) {
                    showMessage("提示", data.msg);
                    closeCurrTabPanel();
                    query${ClassName?cap_first}();
                    //保存后，选中编辑的那条记录
                    var index = $("#${idPreName}_dataGrid").datagrid('getSelections');
                    var row = $("#${idPreName}_dataGrid").datagrid('getRowIndex',index[0]);
                    changedStates($("#${idPreName}_dataGrid"),row);
                }
                else {
                    $.messager.alert("错误", data.msg, "error");
                }
            }
        });
    }
}

$(document).ready(function(){
    var ${pk["javaName"]} = $("#${idPreName}_editForm input[name='${pk["javaName"]}']").val();
    if (${pk["javaName"]} != null && ${pk["javaName"]} != "" && ${pk["javaName"]} != "null") {
        load${ClassName?cap_first}(${pk["javaName"]});
    }
});
