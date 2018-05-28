<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
				var resourceId = $('#resourceId').val();
				if (resourceId > 0) {
					$.ajax({  
						url:'${pageContext.request.contextPath}/resource/resourceAction!doNotNeedSecurity_getById.action',
						data :{'id':resourceId},
						dataType:'json',
						success : function(result){  
							if (result.id != undefined) {
								$('form').form('load', {
									'resource.id' : result.id,
									'resource.name' : result.name,
									'resource.url' : result.url,
									'resource.type' : result.type,
									'resource.pid' : result.pid!=0?result.pid:'',
									'resource.iconCls' : result.iconCls,
									'resource.seq' : result.seq,
									'resource.target' : result.target,
									'resource.flag' : result.flag
								});
								$('#iconCls').attr('class', result.iconCls);//设置背景图标
							}
				          },
							beforeSend:function(){
								parent.$.messager.progress({
									text : '数据加载中....'
								});
							},
							complete:function(){
								parent.$.messager.progress('close');
							}  
					});
				}
			});
			
			function showIcons() {
				var dialog = parent.modalDialog({
					title : '浏览小图标',
					url : '${pageContext.request.contextPath}/css/icons.jsp',
					buttons : [ {
						text : '确定',
						handler : function() {
							dialog.find('iframe').get(0).contentWindow.selectIcon(
								dialog, $('#iconCls'));
						}
					} ]
				});
			};
			
			function submitForm($dialog, $grid, $pjq) {
					if ($('form').form('validate')) {
						$.ajax({
							url : '${pageContext.request.contextPath}/resource/resourceAction!update.action',
							data : $('form').serialize(),
							dataType : 'json',
							success : function(result) {
								if (result.success) {
									$grid.treegrid('reload');
									$dialog.dialog('destroy');
								//	$mainMenu.tree('reload');
									$pjq.messager.alert('提示', result.msg, 'info');
								} else {
									$pjq.messager.alert('提示', result.msg, 'error');
								}
							},
							beforeSend:function(){
								parent.$.messager.progress({
									text : '数据提交中....'
								});
							},
							complete:function(){
								parent.$.messager.progress('close');
							}
						});
					}
				};
			
		</script>
	</head>

	<body>
		<form method="post" class="form">
			<fieldset>
				<legend>
					菜单基本信息
				</legend>
				<table class="ta001">
					<tr>
						<th>
							资源名称
						</th>
						<td>
							<input name="resource.name" class="easyui-validatebox"
								data-options="required:true,validType:'customRequired'" />
							<input name="resource.id" type="hidden" id="resourceId" value="${param.id}">
						</td>
						<th>
							资源类型
						</th>
						<td>
							<select class="easyui-combobox" data-options="editable:false" name="resource.type" style="width: 150px;">
								<option value="菜单">菜单</option>
								<option value="功能">功能</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>
							上级资源
						</th>
						<td>
							<select id="pid" name="resource.pid" class="easyui-combotree" data-options="editable:false,idField:'id',textField:'text',parentField:'pid',url:'${pageContext.request.contextPath}/resource/resourceAction!doNotNeedSecurity_initMenuForAdd.action'" style="width: 150px;"></select>
						</td>
						<th>
							排序
						</th>
						<td>
							<input name="resource.seq" class="easyui-validatebox" value="100" data-options="required:true" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"></input>
						</td>
					</tr>
					<tr>
						<th>
							资源图标
						</th>
						<td>
							<input id="iconCls" name="resource.iconCls"
								style="padding-left: 18px; width: 134px;" />
							<img class="iconImg ext-icon-zoom" onclick="showIcons();"
								title="浏览图标" />
						</td>
						<th>
							系统
						</th>
						<td>
							<select class="easyui-combobox" data-options="editable:false" name="resource.flag" style="width: 150px;">
								<option value="0">WEB后台系统</option>
								<option value="1">校友会系统</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>
							资源路径
						</th>
						<td colspan="3">
							<textarea name="resource.url" cols="100" rows="5"></textarea>
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</body>
</html>
