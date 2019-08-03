<%@ page language="java"  contentType="text/html; charset=UTF-8"
 import="com.bean.Teacher ,com.dao.teacherDao,java.util.*" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>老师信息管理</title>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
var url;
	function saveTeacher(){
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
	function openTeacherAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加老师信息");
		url="../teacherAction?act=insert";
	}
	
	function openTeacherModifyDialog(number){
		$("#dlg").dialog("open").dialog("setTitle","编辑老师信息");
		url="../teacherAction?act=update&number="+number+"";
	}
	function resetValue(){
	}
	
	function closeTeacherDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="老师信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="Tname" width="30" align="center">姓名</th>
				<th field="Tno" width="30" align="center">教师工号</th>
				<th field="Tpwd" width="30" align="center">密码</th>
				<th field="Tpost" width="30" align="center">职称</th>
				<th field="Tintro" width="50" align="center">简介</th>
				<th field="caozuo" width="30" align="center">操作</th>
			</tr>
		</thead>
<%
ArrayList<Teacher> teachers=teacherDao.getAllteacher();
for(int i=0;i<teachers.size();i++){
	Teacher teacher=(Teacher)teachers.get(i);
%>
				<tr>
				<td align="center"><%=teacher.getTname() %></td> 
				<td align="center"><%=teacher.getTno() %></td>
				<td align="center"><%=teacher.getTpwd() %></td> 
				<td align="center"><%=teacher.getTpost() %></td> 
				<td align="center"><%=teacher.getTintro() %></td> 
				<td align="center"><a href="javascript:openTeacherModifyDialog(<%=teacher.getTno()%>)" onclick="return window.confirm('是否确定修改？')" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
				&emsp;<a href=<%="../teacherAction?act=delete&Tno="+teacher.getTno()%> onclick="return window.confirm('是否确定删除？')" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">删除</a>
				</td>
		        </tr>
		        <%} %>
	</table>
	<div id="tb">
		<div>
			<a href="javascript:openTeacherAddDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">添加</a>
		    <a href="../teacherAction?act=reset" class="easyui-linkbutton" iconCls="icon-edit" plain="true">重置密码</a>
		</div>
	</div>
	<div id="dlg" class="easyui-dialog" style="width: 600px;height: 280px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>
					<td>姓名：</td>
					<td><input type="text" name="Tname" id="Tname" class="easyui-validatebox" required="true"/></td>
					<td></td>
					<td>教师工号：</td>
					<td><input type="text" name="Tno" id="Tno" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
				    <td>密码：</td>
					<td><input type="password" name="Tpwd" id="Tpwd" class="easyui-validatebox" required="true"/></td>
					<td></td>
					<td>职称：</td>
					<td><input type="text" name="Tpost" id="Tpost" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<td>简介：</td>
					<td><input type="text" name="Tintro" id="Tintro" class="easyui-validatebox" required="true"/></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveTeacher()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeTeacherDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
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