<%@ page language="java" contentType="text/html; charset=utf-8" import="com.dao.stuDao,java.sql.*"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>人员信息管理</title>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="学生选题状态信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="Sname" width="20" align="center">学生姓名</th>
				<th field="Sno" width="20" align="center">学号</th>
				<th field="Smajor" width="20" align="center">专业</th>
				<th field="Sclass" width="20" align="center">年级</th>
				<th field="GPA" width="10" align="center">绩点</th>
				<th field="Name" width="30" align="center">题目名称</th>
				<th field="Type" width="20" align="center">题目类型</th>
				<th field="Tname" width="20" align="center">指导老师</th>
				<th field="State" width="20" align="center">选题状态</th>
			</tr>
		</thead>
<%
ResultSet rs=stuDao.getAllstuSelect();
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
				<td align="center"><%=rs.getString(8) %></td> 
				<td align="center"><%=rs.getString(9) %></td> 
		    </tr>
		    <%} %>
	</table>
</body>
</html>