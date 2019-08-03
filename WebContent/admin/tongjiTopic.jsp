<%@ page language="java"  contentType="text/html; charset=UTF-8"
 import="com.bean.Topic ,com.dao.*,java.util.*" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>统计查询</title>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="每类题目总个数" class="easyui-datagrid" fitColumns="true"
	 pagination="true" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="Type" width="30" align="center">题目类型</th>
				<th field="count" width="30" align="center">总个数</th>
			</tr>
		</thead>
<%
ArrayList<Topic> array=(ArrayList<Topic>)topicDao.tongjiTopic();
for(int i=0;i<array.size();i++){
	Topic a=(Topic)array.get(i);
%>
				<tr>
				<td align="center"><%=a.getName() %></td> 
				<td align="center"><%=a.getCount()%></td>
		        </tr>
		        <%} %>
</table>
<div id="tb">
</div>
</body>
</html>