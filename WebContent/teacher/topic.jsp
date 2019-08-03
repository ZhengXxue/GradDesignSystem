<%@ page language="java"  contentType="text/html; charset=UTF-8" import="com.bean.Topic,com.dao.*,java.util.*" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="teacher" class="com.bean.Teacher" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>题目信息管理</title>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
var url;
	function saveTopic(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(){
				resetValue();
				$("#dlg").dialog("close");
				location.reload(true);
			}
		});
	}
	function openTopicAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加题目信息");
		url="../topicAction?act=insert";
	}
	function openTopicModifyDialog(name){
		$("#dlg").dialog("open").dialog("setTitle","编辑题目信息");
		url="../topicAction?act=update&name="+name+"";
	}
	function resetValue(){
	}
	function closeTopicDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="题目信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="Name" width="40" align="center">题目名称</th>
				<th field="Type" width="30" align="center">题目类型</th>
				<th field="Source" width="30" align="center">题目来源</th>
				<th field="Tools" width="30" align="center">主要开发工具</th>
				<th field="Content" width="60" align="center">设计内容</th>
				<th field="caozuo" width="30" align="center">操作</th>
			</tr>
		</thead>
<%
ArrayList<Topic> topics=topicDao.getAlltopic3(teacher.getTno());
for(int i=0;i<topics.size();i++){
	Topic topic=(Topic)topics.get(i);
%>
				<tr>
				<td align="center"><%=topic.getName() %></td>
				<td align="center"><%=topic.getType() %></td> 
				<td align="center"><%=topic.getSource() %></td> 
				<td align="center"><%=topic.getTools() %></td> 
				<td align="center"><%=topic.getContent() %></td> 
				<td align="center"><a href="javascript:openTopicModifyDialog('<%=topic.getName()%>')" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
				&emsp;<a href=<%="../topicAction?act=delete&Name="+topic.getName()%> class="easyui-linkbutton" iconCls="icon-cancel" plain="true">删除</a>
				</td>
		        </tr>
		        <%} %>
</table>
<div id="tb">
    <div>
		<a href="javascript:openTopicAddDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">添加</a>
    </div>
</div>
<div id="dlg" class="easyui-dialog" style="width: 600px;height: 280px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>
					<td>题目名称：</td>
					<td><input type="text" name="Name" id="Name" class="easyui-validatebox" required="true"/></td>
					<td></td>
					<td>题目类型：</td>
					<td><input type="text" name="Type" id="Type" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
				    <td>题目来源：</td>
					<td><input type="text" name="Source" id="Source" class="easyui-validatebox" required="true"/></td>
					<td></td>
					<td>主要开发工具：</td>
					<td><input type="text" name="Tools" id="Tools" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>设计内容：</td>
					<td><input type="text" name="Content" id="Content" class="easyui-validatebox" required="true"/></td>
					<td></td>
					<td>指导老师：</td>
					<td><input type="text" name="Tno" id="Tno" value=<%=teacher.getTno() %> class="easyui-validatebox" required="true"/></td>
					
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveTopic()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeTopicDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>