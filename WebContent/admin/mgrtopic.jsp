<%@ page language="java"  contentType="text/html; charset=UTF-8"
import="com.bean.* ,com.dao.*,java.util.*" pageEncoding="utf-8"%>
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
<script src="../layDate-v5.0.9/laydate/laydate.js"></script>
<script type="text/javascript">
var url;
	function saveManager(){
		$("#fm,#fm1").form("submit",{
			url:url,
			onSubmit:function(){
				return $(this).form("validate");
			},
			success:function(){
				resetValue();
				$("#dlg,#dlg2").dialog("close");
				location.reload(true);
			}
		});
	}
	function openManagerDialog(number){
		$("#dlg2").dialog("open").dialog("setTitle","设置是否发布");
		url="../mgrAction?act=check&ID="+number+"";
	}
	
	function openManagerModifyDialog(number){
		$("#dlg").dialog("open").dialog("setTitle","设置选题时间");
		lay('#version').html('-v'+ laydate.v);

		//执行一个laydate实例
		laydate.render({
		  elem: '#TimeStart', //开始时间
		  type:'datetime'
		});
		laydate.render({
		  elem: '#TimeEnd', //结束时间
		  type:'datetime'  
		});
		url="../mgrAction?act=updatetime&ID="+number+"";
	}
	function resetValue(){
	}
	
	function closeManagerDialog(){
		$("#dlg,#dlg2").dialog("close");
		resetValue();
	}
	
</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="题目管理信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="ID" width="30" align="center">编号</th>
				<th field="GradYear" width="30" align="center">年级</th>
				<th field="StuNum" width="30" align="center">学生人数</th>
				<th field="TimeStart" width="30" align="center">选题开始时间</th>
				<th field="TimeEnd" width="30" align="center">选题结束时间</th>
				<th field="IsPublished" width="30" align="center">是否发布</th>
				<th field="caozuo" width="40" align="center">操作</th>
			</tr>
		</thead>
<%
ArrayList<Manager> managers=mgrDao.getAllmanager();
for(int i=0;i<managers.size();i++){
	Manager manager=(Manager)managers.get(i);
	mgrDao.setStuCount(manager.getGradYear());
%>
				<tr>
				<td align="center"><%=manager.getID() %></td> 
				<td align="center"><%=manager.getGradYear() %></td>
				<td align="center"><%=manager.getStuNum() %></td> 
				<td align="center"><%=manager.getTimeStart() %></td> 
				<td align="center"><%=manager.getTimeEnd() %></td>
				<td align="center"><%=manager.getIsPublished() %></td> 
				<td align="center"><a href="javascript:openManagerModifyDialog(<%=manager.getID()%>)" class="easyui-linkbutton" iconCls="icon-edit" plain="true">设置选题时间</a>
				&emsp;<a href="javascript:openManagerDialog(<%=manager.getID()%>)" class="easyui-linkbutton" iconCls="icon-edit" plain="true">设置发布</a>
				</td>
		        </tr>
		        <%} %>
	</table>
	<div id="tb">
		<div>
			<a class="easyui-linkbutton" iconCls="icon-sum" plain="true">当前题目总数：<%=topicDao.getTopicCount() %></a>
		</div>
	</div>
	<div id="dlg" class="easyui-dialog" style="width: 600px;height: 280px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>
					<td>选题开始时间：</td>
					<td><input type="text" name="TimeStart" id="TimeStart" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
				    <td>选题结束时间：</td>
					<td><input type="text" name="TimeEnd" id="TimeEnd" class="easyui-validatebox" required="true"/></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:saveManager()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeManagerDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
	
	<div id="dlg2" class="easyui-dialog" style="width: 600px;height: 280px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm1" method="post">
			<table cellspacing="5px;">
				<tr>
					<td>是否发布：</td>
					<td><select class="easyui-combobox" id="IsPublished" name="IsPublished" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="已发布">已发布</option>
						<option value="未发布">未发布</option>
					</select></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveManager()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeManagerDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>    