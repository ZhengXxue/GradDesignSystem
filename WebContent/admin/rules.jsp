<%@ page language="java"  contentType="text/html; charset=UTF-8"
import="com.bean.Manager ,com.dao.*,java.util.*" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>规则信息</title>
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
var url;
	function saveRules(){
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
	function openRulesModifyDialog(year){
		$("#dlg").dialog("open").dialog("setTitle","修改选题规则");
		url="../mgrAction?act=rules&year="+year+"";
	}
	function resetValue(){
	}
	
	function closeRulesDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="选题规则" class="easyui-datagrid" fitColumns="true"
	 pagination="true" fit="true" toolbar="#tb">
		<thead>
			<tr>
			    <th field="year" width="30" align="center">年级</th>
				<th field="num" width="30" align="center">每位老师指导学生数量上限</th>
				<th field="number" width="30" align="center">优秀学生占比</th>
				<th field="caozuo" width="30" align="center">操作</th>
			</tr>
		</thead>
<%
ArrayList<Manager> rules=mgrDao.getRules();
for(int i=0;i<rules.size();i++){
	Manager rule=(Manager)rules.get(i);
%>
				<tr>
				<td align="center"><%=rule.getGradYear() %></td> 
				<td align="center"><%=rule.getMaxnum() %></td> 
				<td align="center"><%=rule.getRadio()%></td>
				<td align="center"><a href="javascript:openRulesModifyDialog('<%=rule.getGradYear() %>')" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		        </tr>
		        <%} %>
</table>
<div id="tb">
</div>
<div id="dlg" class="easyui-dialog" style="width: 600px;height: 280px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table cellspacing="5px;">
				<tr>
				    <td>每位老师指导学生数量上限：</td>
					<td><input type="text" name="Maxnum" id="Maxnum" class="easyui-validatebox" required="true"/></td>
					<td></td>
				</tr>
				<tr>
					<td>优秀学生占比：</td>
					<td><input type="text" name="radio" id="radio" class="easyui-validatebox" required="true"/></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveRules()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeRulesDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>