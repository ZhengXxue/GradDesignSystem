<%@ page language="java" contentType="text/html; charset=utf-8" import="com.bean.*,java.sql.*,com.dao.*"
    pageEncoding="utf-8"%>
<%
	Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
%> 
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
<script type="text/javascript">
	var url;
	
	function saveXtxuanti(){
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
	
	function resetValue(){
	}
	
	function closeXtxuantiDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	function openXtxuantiModifyDialog(name,number,GPA){
		$("#dlg").dialog("open").dialog("setTitle","审核选题状态");
		url="../topicAction?act=check&Name="+name+"&Tno="+number+"&GPA="+GPA+"";
	}
</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="选题审批" class="easyui-datagrid" fitColumns="true"
	 pagination="true" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="Name" width="20">题目名称</th>
				<th field="Type" width="30" align="center">题目类型</th>
				<th field="Content" width="60" align="center">设计内容</th>
				<th field="Sno" width="20" align="center">选题学生姓名</th>
				<th field="Smajor" width="20" align="center">专业</th>
				<th field="GPA" width="10" align="center">绩点</th>
				<th field="State" width="20" align="center">选题状态</th>
				<th field="caozuo" width="30" align="center">操作</th>
			</tr>
		</thead>
<%
ResultSet rs=topicDao.getUncompletetopic(teacher.getTno());
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
				<td align="center">
				<a href="javascript:openXtxuantiModifyDialog('<%=rs.getString(1) %>',<%=teacher.getTno() %>,<%=rs.getString(6) %>)" class="easyui-linkbutton" iconCls="icon-add" plain="true">审核</a>
				</td>
		    </tr>
		    <%} %>
	</table>
	
	<div id="dlg" class="easyui-dialog" style="width: 300px;height: 140px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table>
				<tr>
					<td>审核：</td>
					<td><select class="easyui-combobox" id="State" name="State" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="通过">通过</option>
						<option value="拒绝">拒绝</option>
					</select></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveXtxuanti()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeXtxuantiDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
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