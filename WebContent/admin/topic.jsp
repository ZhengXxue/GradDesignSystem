<%@ page language="java"  contentType="text/html; charset=UTF-8"
 import="com.bean.Topic ,com.dao.*,java.util.*" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>题目信息管理</title>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="题目信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="Teacher" width="30" align="center">指导教师工号</th>
				<th field="Name" width="40" align="center">题目名称</th>
				<th field="Type" width="30" align="center">题目类型</th>
				<th field="Source" width="30" align="center">题目来源</th>
				<th field="Tools" width="30" align="center">主要开发工具</th>
				<th field="Content" width="70" align="center">设计内容</th>
				<th field="State" width="30" align="center">选题状态</th>
				<th field="Sno" width="30" align="center">选题学生学号</th>
				<th field="GPA" width="30" align="center">选题学生绩点</th>
			</tr>
		</thead>
<%
ArrayList<Topic> topics=(ArrayList<Topic>)session.getAttribute("topics");
for(int i=0;i<topics.size();i++){
	Topic topic=(Topic)topics.get(i);
%>
				<tr>
				<td align="center"><%=topic.getTeacher() %></td> 
				<td align="center"><%=topic.getName() %></td>
				<td align="center"><%=topic.getType() %></td> 
				<td align="center"><%=topic.getSource() %></td> 
				<td align="center"><%=topic.getTools() %></td> 
				<td align="center"><%=topic.getContent() %></td> 
				<td align="center"><%=topic.getState() %></td> 
				<td align="center"><%=topic.getSno() %></td> 
				<%if(topic.getSno()!=null){ %>
				<td align="center"><%=stuDao.getStudentGPA(topic.getSno())%></td> 
				<%} %>
		        </tr>
		        <%} %>
</table>
<div id="tb">
		<div>
			<a href="../topicAction?act=complete" class="easyui-linkbutton" iconCls="icon-ok" plain="true">完成数：<%=topicDao.completeTopicCount() %></a>
			<a href="../topicAction?act=uncomplete" class="easyui-linkbutton" iconCls="icon-no" plain="true">未完成数：<%=topicDao.uncompleteTopicCount() %></a>
		</div>
</div>
</body>
</html>