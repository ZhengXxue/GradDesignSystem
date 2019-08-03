<%@ page language="java" contentType="text/html; charset=utf-8" import="com.bean.*,java.sql.*,com.dao.*"
    pageEncoding="utf-8"%>
<jsp:useBean id="teacher" class="com.bean.Teacher" scope="session"/>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>选题信息</title>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="已过选题" class="easyui-datagrid" fitColumns="true"
	 pagination="true" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="Name" width="20">题目名称</th>
				<th field="Type" width="30" align="center">题目类型</th>
				<th field="Content" width="60" align="center">设计内容</th>
				<th field="Sno" width="20" align="center">学号</th>
				<th field="Smajor" width="20" align="center">专业</th>
				<th field="GPA" width="10" align="center">绩点</th>
				<th field="State" width="20" align="center">选题状态</th>
			</tr>
		</thead>
<%
ResultSet rs=topicDao.getCompletetopic(teacher.getTno());
while(rs.next()){
%>
		    <tr>
				<td align="center"><%=rs.getString(1) %></td> 
				<td align="center"><%=rs.getString(2) %></td>
				<td align="center"><%=rs.getString(3) %></td> 
				<td align="center"><%=rs.getString(4) %></td> 
				<td align="center"><%=rs.getString(5) %></td> 
				<td align="center"><%=rs.getString(6) %></td> 
				<td align="center"><%=rs.getString(7) %></td> 
		    </tr>
		    <%} %>
	</table>
</body>
</html>