<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"//:"+request.getServerName()+":"+request.getServerPort()+"/"+path+"/";
%>
<jsp:useBean id="stu" class="com.bean.Student" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>毕业设计选题管理系统</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="css/matrix-style.css" />
    <link rel="stylesheet" href="css/matrix-media.css" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <!--Header-part-->
    <div id="header">
      <h1>毕业设计选题管理系统</h1>
    </div>
    <!--close-Header-part--> 

    <!--top-Header-menu-->
    <div id="user-nav" class="navbar navbar-inverse">
        <ul class="nav">
            <li  class="dropdown" id="profile-messages" >
                <a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle">
                    <i class="icon icon-user"></i>&nbsp;
                    <span class="text">欢迎你，<%=stu.getSname() %></span>&nbsp;
                    <b class="caret"></b>
                </a>
            </li>
			<li class=""><a title="" href="login.jsp"><i class="icon icon-share-alt"></i> <span class="text">&nbsp;退出系统</span></a></li>
        </ul>
    </div>
    <!--close-top-Header-menu-->

    <!--sidebar-menu-->
    <div id="sidebar" style="OVERFLOW-Y: auto; OVERFLOW-X:hidden;">
        <ul>
            <li class="submenu active">
                <a class="menu_a" link="index.html"><i class="icon icon-home"></i> <span>欢迎登陆</span></a> 
            </li>
            <li class="submenu"> 
                <a href="#">
                    <i class="icon icon-table"></i> 
                    <span>个人信息</span> 
                    <span class="label label-important">1</span>
                </a>
                <ul>
                	<li><a class="menu_a" link="user/user.jsp"><i class="icon icon-caret-right"></i>个人信息</a></li>
                </ul>
            </li>
            <li class="submenu"> 
                <a href="#">
                    <i class="icon icon-table"></i> 
                    <span>课题信息</span> 
                    <span class="label label-important">1</span>
                </a>
                <ul>
                	<li><a class="menu_a" link="user/topic.jsp"><i class="icon icon-caret-right"></i>课题信息</a></li>
                </ul>
            </li>
            <li class="submenu"> 
                <a href="#">
                    <i class="icon icon-table"></i> 
                    <span>选题信息</span> 
                    <span class="label label-important">1</span>
                </a>
                <ul>
                	<li><a class="menu_a" link="user/mytopic.jsp"><i class="icon icon-caret-right"></i>我的选课</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!--sidebar-menu-->

    <!--main-container-part-->
    <div id="content">
        <iframe src="index.html" id="iframe-main" frameborder='0' style="width:100%;"></iframe>
    </div>
    <!--end-main-container-part-->

    <script src="js/excanvas.min.js"></script> 
    <script src="js/jquery.min.js"></script> 
    <script src="js/jquery.ui.custom.js"></script> 
    <script src="js/bootstrap.min.js"></script> 
    <script src="js/nicescroll/jquery.nicescroll.min.js"></script> 
    <script src="js/matrix.js"></script> 


    <script type="text/javascript">

    //初始化相关元素高度
    function init(){
        $("body").height($(window).height()-80);
        $("#iframe-main").height($(window).height()-90);
        $("#sidebar").height($(window).height()-50);
    }

    $(function(){
        init();
        $(window).resize(function(){
            init();
        });
    });

    // This function is called from the pop-up menus to transfer to
    // a different page. Ignore if the value returned is a null string:
    function goPage (newURL) {
        // if url is empty, skip the menu dividers and reset the menu selection to default
        if (newURL != "") {
            // if url is "-", it is this page -- reset the menu:
            if (newURL == "-" ) {
                resetMenu();            
            } 
            // else, send page to designated URL            
            else {  
                document.location.href = newURL;
            }
        }
    }

    // resets the menu selection upon entry to this page:
    function resetMenu() {
        document.gomenu.selector.selectedIndex = 2;
    }

    // uniform使用示例：
    // $.uniform.update($(this).attr("checked", true));
    </script>
</body>
</html>