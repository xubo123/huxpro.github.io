<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="authority" uri="/authority"%>
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
var grid;
$(function(){
	grid=$('#newsGrid').datagrid({
		url : '${pageContext.request.contextPath}/mobile/news/newsAction!dataGrid.action',
		fit : true,
		border : false,
		fitColumns : true,
		striped : true,
		rownumbers : true,
		pagination : true,
		idField : 'newsId',
		 columns:[[  
				{field:'newsId',checkbox : true}, 
			    {field:'title',title:'标题',width:150,align:'center'},
			    {field:'tagName',title:'频道',width:60,align:'center'},
	/* 		    {field:'type',title:'兴趣标签',width:80,align:'center'},
			    {field:'origin',title:'新闻来源',width:60,align:'center',
				    formatter: function(value,row,index){
							if(row.origin==1 || row.originP==1 || row.originWeb==1 || row.originWebP==1){
								return "总会";
							}else if(row.origin==2 || row.originP==2 || row.originWeb==2 || row.originWebP==2){
								return "地方";
							}
						}
			    },
			    {
                    width: '80',
                    title: '所属院系',
                    field: 'dept_name',
                    align: 'center',
                    formatter : function(value, row) {
                    	if(row.origin==1 || row.originP==1 || row.originWeb==1 || row.originWebP==1) {
                    		return row.dept_name;
                    	} else if(row.origin==2 || row.originP==2 || row.originWeb==2 || row.originWebP==2) {
                    		return "---";
                    	}
					}
                }, */
			    {field:'category',title:'栏目',width:80,align:'center',
			    	formatter: function(value,row,index){
			    		if(row.category==null || row.category==0){
			    			return "无";
			    		}else if(row.pCategory!=null && row.pCategory==0){
			    			return row.categoryName;
			    		}else if(row.pCategory!=null && row.pCategory!=0){
			    			return row.pCategoryName + " -- " + row.categoryName;
			    		}
					}
			    },
	/* 		    {field:'cityName',title:'所属城市',width:80,align:'center'},
			    {field:'topnews',title:'手机幻灯片',width:60,align:'center',
			    	formatter: function(value,row,index){
						if(value==100){
							return "√";
						}else{
							return "×";
						}
					}	
			    }, */
			    {field:'createTime',title:'时间',width:130,align:'center'},
			    {field:'operator',title:'操作',width:100,
			    		formatter: function(value,row,index){
							var content="";
							<authority:authority authorizationCode="查看新闻" role="${sessionScope.user.role}">
			    			content+='<a href="javascript:void(0)" onclick="viewNews('+row.newsId+')"><img class="iconImg ext-icon-note"/>查看</a>&nbsp;';
			    			</authority:authority>
			    			<authority:authority authorizationCode="编辑新闻" role="${sessionScope.user.role}">
			    			if(row.origin==2 || row.originP==2 || row.originWeb==2 || row.originWebP==2){
			    				content+='<a href="javascript:void(0)" onclick="convertNews('+row.newsId+')"><img class="iconImg ext-icon-note_edit"/>转总会</a>&nbsp;';
			    			}else{
			    				content+='<a href="javascript:void(0)" onclick="editNews('+row.newsId+')"><img class="iconImg ext-icon-note_edit"/>编辑</a>&nbsp;';
			    			}
			    			</authority:authority>
			    			return content;
					}}
			    ]],
				toolbar : '#newsToolbar',
			onBeforeLoad : function(param) {
				parent.$.messager.progress({
					text : '数据加载中....'
				});
			},
			onLoadSuccess : function(data) {
				$('.iconImg').attr('src', pixel_0);
				parent.$.messager.progress('close');

			}
		});
});

function searchNews(){
	  if ($('#searchNewsForm').form('validate')) {
		  $('#newsGrid').datagrid('load',serializeObject($('#searchNewsForm')));
	  }
}


function addNews() {
		var dialog = parent.modalDialog({
			width : 1000,
			height : 600,
			title : '新增',
			iconCls:'ext-icon-note_add',
			url : '${pageContext.request.contextPath}/page/admin/news/addNews.jsp',
			buttons : [ {
				text : '保存',
				iconCls : 'ext-icon-save',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			} ]
		});
	}
	
	
	function editNews(id) {
		var dialog = parent.modalDialog({
			width : 1000,
			height : 600,
			title : '编辑',
			iconCls:'ext-icon-note_add',
			url : '${pageContext.request.contextPath}/mobile/news/newsAction!doNotNeedSecurity_initNewsUpdate.action?id='+id,
			buttons : [ {
				text : '保存',
				iconCls : 'ext-icon-save',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			} ]
		});
	}
	
	/**--将地方新闻转为总会新闻--**/
	function convertNews(id){
		var dialog = parent.modalDialog({
			width : 1000,
			height : 600,
			title : '转为总会新闻',
			iconCls:'ext-icon-note_add',
			url : '${pageContext.request.contextPath}/mobile/news/newsAction!doNotNeedSecurity_initNewsUpdate.action?id='+id+"&convert=1",
			buttons : [ {
				text : '保存',
				iconCls : 'ext-icon-save',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			} ]
		});
	}




	function viewNews(id) {
		var dialog = parent.modalDialog({
			width : 1000,
			height : 600,
			title : '查看',
			iconCls:'ext-icon-note_add',
			url : '${pageContext.request.contextPath}/mobile/news/newsAction!getById.action?id=' + id
		});
	}



function removeNews(){
	
	var rows = $("#newsGrid").datagrid('getChecked');
	var ids = [];
	if (rows.length > 0) {
		$.messager.confirm('确认', '确定删除吗？', function(r) {
			if (r) {
				for ( var i = 0; i < rows.length; i++) {
					ids.push(rows[i].newsId);
				}
				$.ajax({
					url : '${pageContext.request.contextPath}/mobile/news/newsAction!delete.action',
					data : {
						ids : ids.join(',')
					},
					dataType : 'json',
					success : function(data) {
						if(data.success){
							$("#newsGrid").datagrid('reload');
							$("#newsGrid").datagrid('unselectAll');
							$.messager.alert('提示',data.msg,'info');
						}
						else{
							$.messager.alert('错误', data.msg, 'error');
						}
					},
					beforeSend:function(){
						$.messager.progress({
							text : '数据提交中....'
						});
					},
					complete:function(){
						$.messager.progress('close');
					}
				});
			}
		});
	} else {
		 $.messager.alert('提示', '请选择要删除的记录！', 'error');
	}
}

function setMobTypeList(isRmv,pageType){
	var rows = $("#newsGrid").datagrid('getChecked');
	var str1="";
	var str2="";
		
	if(isRmv){
		str1="设置";		
	}else{
		str1="取消";
	}
	if(pageType==1) {
		str2="手机";
	} else if(pageType==2) {
		str2="网页";
	}
	
	var tmpAlert = "确定要"+str1+"所选记录为"+str2+"幻灯片新闻吗?";
	var ids = [];
	if (rows.length > 0) {
		$.messager.confirm('确认', tmpAlert, function(r) {
			if (r) {
				for ( var i = 0; i < rows.length; i++) {
					ids.push(rows[i].newsId);
				}
				$.ajax({
					url : '${pageContext.request.contextPath}/mobile/news/newsAction!setMobTypeList.action',
					data : {
						ids : ids.join(','),
						isRmv : isRmv,
						pageType : pageType
					},
					dataType : 'json',
					success : function(data) {
						if(data.success){
							$("#newsGrid").datagrid('reload');
							$("#newsGrid").datagrid('unselectAll');
							$.messager.alert('提示',data.msg,'info');
						}
						else{
							$.messager.alert('错误', data.msg, 'error');
						}
					},
					beforeSend:function(){
						$.messager.progress({
							text : '数据提交中....'
						});
					},
					complete:function(){
						$.messager.progress('close');
					}
				});
			}
		});
	} else {
		 $.messager.alert('提示', '请选择要设置的记录！', 'error');
	}
}

function sendList(){
	  var rows = $("#newsGrid").datagrid('getChecked');
		var ids = [];
/**		if (rows.length > 0) {**/
			parent.$.messager.confirm('确认', '确定批量发送吗？', function(r) {
				if (r) {
					for ( var i = 0; i < rows.length; i++) {
						ids.push(rows[i].newsId);
					}
					if(ids.length>10){
						parent.$.messager.alert('提示', '每批消息不能超过10条！', 'error');
					}else{
						$.ajax({
							url : '${pageContext.request.contextPath}/mobile/news/newsAction!sendList.action',
							data : {
								ids : ids.join(',')
							},
							dataType : 'json',
							success : function(data) {
								if(data.success){
									$("#newsGrid").datagrid('reload');
									$("#newsGrid").datagrid('unselectAll');
									parent.$.messager.alert('提示',data.msg,'info');
								}
								else{
									parent.$.messager.alert('错误', data.msg, 'error');
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
				}
			});
	/**	} else {
			 parent.$.messager.alert('提示', '请选择要批量发送的记录！', 'error');
		}**/
}
</script>
</head>
  
  <body>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div id="newsToolbar" style="display: none;">
		<table>
			<tr>
				<td>
					<form id="searchNewsForm">
						<table>
							<tr>
								<th>
									标题
								</th>
								<td>
									<div class="datagrid-btn-separator"></div>
								</td>
								<td>
									<input name="news.title" style="width: 150px;" />
								</td>
								<td>
									<a href="javascript:void(0);" class="easyui-linkbutton"
										data-options="iconCls:'icon-search',plain:true"
										onclick="searchNews();">查询</a>
								</td>
							</tr>
							
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td>
					<table>
						<tr>
							<td>
							<authority:authority authorizationCode="新增新闻" role="${sessionScope.user.role}">
								<a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'ext-icon-note_add',plain:true"
									onclick="addNews();">新增</a>
							</authority:authority>
							</td>
							<td>
							<authority:authority authorizationCode="删除新闻" role="${sessionScope.user.role}">
								<a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'ext-icon-note_delete',plain:true"
									onclick="removeNews();">删除</a>
							</authority:authority>
							</td>
							<td>
							<authority:authority authorizationCode="发送新闻" role="${sessionScope.user.role}">
								<a href="javascript:void(0);" class="easyui-linkbutton"
									data-options="iconCls:'icon-redo',plain:true"
									onclick="sendList();">发送</a>
							</authority:authority>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div data-options="region:'center',fit:true,border:false">
		<table id="newsGrid"></table>
	</div>
</div>
  </body>
</html>