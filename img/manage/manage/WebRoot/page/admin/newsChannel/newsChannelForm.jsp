<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:include page="../../../inc.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		var button = $("#pic_upload_button"), interval;
		new AjaxUpload(button, {
			action : '${pageContext.request.contextPath}/fileUpload/fileUploadAction!doNotNeedSecurity_fileUpload.action',
			name : 'upload',
			onSubmit : function(file, ext) {
				if (!(ext && /^(jpg|jpeg|png|gif|bmp)$/.test(ext))) {
					$.messager.alert('提示', '您上传的图片格式不对，请重新选择！', 'error');
					return false;
				}
				$.messager.progress({
					text : '图片正在上传,请稍后....'
				});
			},
			onComplete : function(file, response) {
				$.messager.progress('close');
				var msg = $.parseJSON(response);
				if (msg.error == 0) {
					$('#pic').append('<div style="float:left;width:180px;"><img src="'+msg.url+'" width="150px" height="150px"/><div class="bb001" onclick="removeFront(this)"></div><input type="hidden" id="tagIcon" name="newsTag.tagIcon" value="'+msg.no_domain_url+'"/></div>');
					$("#pic_upload_button").prop('disabled', 'disabled');
				} else {
					$.messager.alert('提示', msg.message, 'error');
				}
			}
		});
	});

	function removeFront(pic) {
		$(pic).parent().remove();
		$("#pic_upload_button").prop('disabled', false);
	}
	
	
	function submitForm($dialog, $grid, $pjq)
	{
		if($('#tagIcon').val()==undefined){
			parent.$.messager.alert('提示', '请上传频道图标！', 'info');
			return false;
		}
		if ($('form').form('validate'))
		{
			$.ajax({
				url : '${pageContext.request.contextPath}/newsChannel/newsChannelAction!save.action',
				data : $('form').serialize(),
				dataType : 'json',
				success : function(result)
				{
					if (result.success)
					{
						$grid.datagrid('reload');
						$dialog.dialog('destroy');
						$pjq.messager.alert('提示', result.msg, 'info');
					} else
					{
						$pjq.messager.alert('提示', result.msg, 'error');
					}
				},
				beforeSend : function()
				{
					parent.$.messager.progress({
						text : '数据提交中....'
					});
				},
				complete : function()
				{
					parent.$.messager.progress('close');
				}
			});
		}
	};
</script>
</head>
  
  <body>
<form method="post" id="addNewstagForm">
	<fieldset>
				<legend>
					标签信息
				</legend>
	<table class="ta001">
		<tr>
			<th>
				标签名称
			</th>
			<td colspan="3">
				<input name="newsTag.tagName" class="easyui-validatebox"
					style="width: 500px;"
					data-options="required:true,validType:'customRequired'"
					maxlength="1000" />
			</td>
		</tr>
		<tr>
			<th>
				标签简介
			</th>
			<td colspan="3">
				<input name="newsTag.tagRemark" style="width: 500px;"
					data-options="required:true,validType:'customRequired'"
					maxlength="1000"></input>
			</td>
		</tr>
		<tr>
			<th>
				标签图标上传
			</th>
			<td colspan="3">
				<input type="button" id="pic_upload_button" value="上传图片">
			</td>
		</tr>
		<tr>
			<th>
				标签图标
			</th>
			<td colspan="3">
				<div id="pic"></div>
			</td>
		</tr>
	</table>
	</fieldset>
</form>
  </body>
</html>