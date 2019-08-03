<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="com.bean.*,com.dao.topicDao,java.util.*" pageEncoding="utf-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	Student stu = (Student) request.getSession().getAttribute("stu");
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
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <script type="text/javascript">
        $(function () {
            if (${top== null}){
                alert("你还没有选题，请先去选题吧！");
                location.href = "topic.jsp";
            }
        })
    </script>
</head>
<body style="margin: 5px;">
<div class="row text-center">
    <h4>我的选题</h4>
</div>
<table id="dg" title="选题信息" class="table" toolbar="#tb">
    <tr>
        <th width="30" style="text-align: center">课题老师</th>
        <th width="30" style="text-align: center">课题名称</th>
        <th width="30" style="text-align: center">课题类型</th>
        <th width="30" style="text-align: center">课题来源</th>
        <th width="30" style="text-align: center">开发工具</th>
        <th width="30" style="text-align: center">涉及内容</th>
        <th width="30" style="text-align: center">选题状态</th>
        <th width="30" style="text-align: center">操作</th>
    </tr>
    <c:forEach items="${top}" var="top">
        <tr>
            <td width="30" style="text-align: center">${top.teacher}</td>
            <td width="30" style="text-align: center">${top.name}</td>
            <td width="30" style="text-align: center">${top.type}</td>
            <td width="30" style="text-align: center">${top.source}</td>
            <td width="30" style="text-align: center">${top.tools}</td>
            <td width="30" style="text-align: center">${top.content}</td>
            <c:if test="${top.state.equals('拒绝')}">
                <td width="30" style="text-align: center">未通过</td>
                <td width="30" style="text-align: center">
                    <a href="../topicAction?act=uncheckStu&&Name=${top.name}&&Sno=${stu.sno}" style="text-decoration:none;" onclick="return window.confirm('是否确定取消选题？')">取消选题</a>
                </td>
            </c:if>
            <c:if test="${top.state.equals('通过')}">
                <td width="30" style="text-align: center">已通过</td>
                <td width="30" style="text-align: center">不可取消</td>
            </c:if>
        </tr>
    </c:forEach>
</table>
<div class="row text-right">
    <a href="../topicAction?act=look&&Sno=${stu.sno}" style="text-decoration:none;" onclick="return window.confirm('是否确刷新列表？')">刷新列表</a>
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