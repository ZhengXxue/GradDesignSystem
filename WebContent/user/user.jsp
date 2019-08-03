<%@ page language="java" import="com.bean.Student ,com.dao.stuDao,java.util.*" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	Student s = (Student) request.getSession().getAttribute("stu");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生信息管理</title>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
var url;
	function saveStudent(){
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
	// function openStudentAddDialog(){
	// 	$("#dlg").dialog("open").dialog("setTitle","添加学生信息");
	// 	url="../stuAction?act=insert";
	// }
	
	function openStudentModifyDialog(number){
		$("#dlg").dialog("open").dialog("setTitle","编辑学生信息");
		url="../stuAction?act=update&number="+number+"";
	}
	function resetValue(){
	}
	
	function closeStudentDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="学生信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="Sname" width="30">姓名</th>
				<th field="Sno" width="30">学号</th>
				<th field="Spwd" width="30">密码</th>
				<th field="Smajor" width="30">专业</th>
				<th field="Sclass" width="30">年级</th>
				<th field="Semail" width="30">邮箱</th>
				<th field="Stel" width="30">电话</th>
				<th field="GPA" width="30">绩点</th>
			</tr>
		</thead>
<%
Student stu=stuDao.getStudent(s.getSno());
%>
				<tr>
				<td align="center"><%=stu.getSname() %></td> 
				<td align="center"><%=stu.getSno() %></td>
				<td align="center"><%=stu.getSpwd() %></td> 
				<td align="center"><%=stu.getSmajor() %></td> 
				<td align="center"><%=stu.getSclass() %></td> 
				<td align="center"><%=stu.getSemail() %></td> 
				<td align="center"><%=stu.getStel() %></td> 
				<td align="center"><%=stu.getGPA() %></td> 
		        </tr>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openStudentModifyDialog(<%=stu.getSno()%>)" onclick="return window.confirm('是否确定修改？')" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		</div>
	</div>
	<div id="dlg" class="easyui-dialog" style="width: 600px;height: 280px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>
					<td>姓名：</td>
					<td><input type="text" name="Sname" id="Sname" class="easyui-validatebox" required="true" value="<%=s.getSname()%>"/></td>
					<td></td>
					<td>学号：</td>
					<td><input type="text" name="Sno" id="Sno" class="easyui-validatebox" required="true" value="<%=s.getSno()%>"/></td>
				</tr>
				<tr>
				    <td>密码：</td>
					<td><input type="password" name="Spwd" id="Spwd" class="easyui-validatebox" required="true"/></td>
					<td></td>
					<td>专业：</td>
					<td><input type="text" name="Smajor" id="Smajor" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>年级：</td>
					<td><input type="text" name="Sclass" id="Sclass" class="easyui-validatebox" required="true"/></td>
					<td></td>
					<td>邮箱：</td>
					<td><input type="text" name="Semail" id="Semail" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>电话：</td>
					<td><input type="text" name="Stel" id="Stel" class="easyui-validatebox" required="true"/></td>
					<td></td>
					<td>绩点：</td>
					<td><input type="text" name="GPA" id="GPA" class="easyui-validatebox" required="true"/></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveStudent()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeStudentDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
<%
if(request.getSession().getAttribute("message")!=null){
	String message=(String)request.getSession().getAttribute("message");
%>
<script type="text/javascript">
alert("<%=message%>");
</script>
<%session.removeAttribute("message"); }%>
</html>