<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Chart JS Graph Examples | Gentelella Alela! by Colorlib</title>

<link href="<c:url value="/resources/vendors/bootstrap/dist/css/bootstrap.min.css"/>" rel="stylesheet"/>

<link href="<c:url value="/resources/vendors/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet"/>

<link href="<c:url value="/resources/vendors/nprogress/nprogress.css"/>" rel="stylesheet"/>

<link href="<c:url value="/resources/build/css/custom.min.css"/>" rel="stylesheet"/>
<meta name="robots" content="index, nofollow">
<script>(function(w,d){!function(e,t,r,a,s){e[r]=e[r]||{},e[r].executed=[],e.zaraz={deferred:[]};var n=t.getElementsByTagName("title")[0];e[r].c=t.cookie,n&&(e[r].t=t.getElementsByTagName("title")[0].text),e[r].w=e.screen.width,e[r].h=e.screen.height,e[r].j=e.innerHeight,e[r].e=e.innerWidth,e[r].l=e.location.href,e[r].r=t.referrer,e[r].k=e.screen.colorDepth,e[r].n=t.characterSet,e[r].o=(new Date).getTimezoneOffset(),//
e[s]=e[s]||[],e.zaraz._preTrack=[],e.zaraz.track=(t,r)=>e.zaraz._preTrack.push([t,r]),e[s].push({"zaraz.start":(new Date).getTime()});var i=t.getElementsByTagName(a)[0],o=t.createElement(a);o.defer=!0,o.src="/cdn-cgi/zaraz/s.js?"+new URLSearchParams(e[r]).toString(),i.parentNode.insertBefore(o,i)}(w,d,"zarazData","script","dataLayer");})(window,document);</script></head>
<body class="nav-md">
<div class="container body">
<div class="main_container">
<div class="col-md-3 left_col">
<div class="left_col scroll-view">
<div class="navbar nav_title" style="border: 0;">
<a href="" class="site_title"><i class="fa fa-paw"></i> <span>Fitness Together</span></a>
</div>
<div class="clearfix"></div>

<div class="profile clearfix">
<div class="profile_pic">
<img src="<c:url value="/resources/build/images/premium-icon-admin-3093042.png" />" alt="..." class="img-circle profile_img">
</div>
<div class="profile_info">
<span>Welcome,</span>
<h2>admin</h2>
</div>
</div>

<br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                  <ul class="nav side-menu">
                  <li class="nav-item">
                  <a class="nav-link" href="<c:url value="/fnt/Main.do"/>"><i class="fa fa-home"></i> Home</a>
                  </li>
                  <li class="nav-item">
                  <a class="nav-link" href="<c:url value="/fnt/Statics.do"/>"><i class="fa fa-bar-chart-o"></i> 통계 </a>                  
                  </li>
                  <li class="nav-item">
                  <a class="nav-link" href="<c:url value="/fnt/Board.do"/>"><i class="fa fa-edit"></i> 게시판관리</a>                   
                  </li>
                  <li class="nav-item">
                  <a class="nav-link" href="<c:url value="/fnt/MemberAdmin.do"/>"><i class="fa fa-desktop"></i> 회원관리</a>                  
                  </li>
                
                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->



<div class="sidebar-footer hidden-small">
              <a style="width:230px;" data-toggle="tooltip" data-placement="top" title="Logout" href="<c:url value="/fnt/Logout.do"/>">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>

</div>
</div>

<div class="top_nav">
<div class="nav_menu">
<div class="nav toggle">
<a id="menu_toggle"><i class="fa fa-bars"></i></a>
</div>
<nav class="nav navbar-nav">
</nav>
</div>
</div>


      


<div class="right_col" role="main">
<div class="">
<div class="page-title">
<div class="title_left">
<h3> </small></h3>
</div>
<div class="title_right">
<div class="col-md-5 col-sm-5   form-group pull-right top_search">
<div class="input-group">

</div>
</div>
</div>
</div>
<div class="clearfix"></div>
<div class="row">
<div class="col-md-6 col-sm-6  ">
<div class="x_panel">
<div class="x_title">
<h2>Line graph<small>Sessions</small></h2>
<ul class="nav navbar-right panel_toolbox">
<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
</li>
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
<a class="dropdown-item" href="#">Settings 1</a>
<a class="dropdown-item" href="#">Settings 2</a>
</div>
</li>
<li><a class="close-link"><i class="fa fa-close"></i></a>
</li>
</ul>
<div class="clearfix"></div>
</div>
<div class="x_content">
<canvas id="lineChart"></canvas>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6  ">
<div class="x_panel">
<div class="x_title">
<h2>Bar graph <small>Sessions</small></h2>
<ul class="nav navbar-right panel_toolbox">
<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
</li>
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
<a class="dropdown-item" href="#">Settings 1</a>
<a class="dropdown-item" href="#">Settings 2</a>
</div>
</li>
<li><a class="close-link"><i class="fa fa-close"></i></a>
</li>
</ul>
<div class="clearfix"></div>
</div>
<div class="x_content">
<canvas id="mybarChart"></canvas>
</div>
</div>
</div>
</div>
<div class="clearfix"></div>
<div class="row">
<div class="col-md-6 col-sm-6  ">
<div class="x_panel">
<div class="x_title">
<h2>Radar <small>Sessions</small></h2>
<ul class="nav navbar-right panel_toolbox">
<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
</li>
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
<a class="dropdown-item" href="#">Settings 1</a>
<a class="dropdown-item" href="#">Settings 2</a>
</div>
</li>
<li><a class="close-link"><i class="fa fa-close"></i></a>
</li>
</ul>
<div class="clearfix"></div>
</div>
<div class="x_content">
<canvas id="canvasRadar"></canvas>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6  ">
<div class="x_panel">
<div class="x_title">
<h2>Donut Graph <small>Sessions</small></h2>
<ul class="nav navbar-right panel_toolbox">
<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
</li>
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
<a class="dropdown-item" href="#">Settings 1</a>
<a class="dropdown-item" href="#">Settings 2</a>
</div>
</li>
<li><a class="close-link"><i class="fa fa-close"></i></a>
</li>
</ul>
<div class="clearfix"></div>
</div>
<div class="x_content">
<canvas id="canvasDoughnut"></canvas>
</div>
</div>
</div>
</div>
<div class="clearfix"></div>
<div class="row">
<div class="col-md-6 col-sm-6  ">
<div class="x_panel">
<div class="x_title">
<h2>Pie Graph Chart <small>Sessions</small></h2>
<ul class="nav navbar-right panel_toolbox">
<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
</li>
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
<a class="dropdown-item" href="#">Settings 1</a>
<a class="dropdown-item" href="#">Settings 2</a>
</div>
</li>
<li><a class="close-link"><i class="fa fa-close"></i></a>
</li>
</ul>
<div class="clearfix"></div>
</div>
<div class="x_content">
<canvas id="pieChart"></canvas>
</div>
</div>
</div>
<div class="col-md-6 col-sm-6  ">
<div class="x_panel">
<div class="x_title">
<h2>Pie Area Graph <small>Sessions</small></h2>
<ul class="nav navbar-right panel_toolbox">
<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
</li>
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
<a class="dropdown-item" href="#">Settings 1</a>
<a class="dropdown-item" href="#">Settings 2</a>
</div>
</li>
<li><a class="close-link"><i class="fa fa-close"></i></a>
</li>
</ul>
<div class="clearfix"></div>
</div>
<div class="x_content">
<canvas id="polarArea"></canvas>
</div>
</div>
</div>
</div>
</div>
</div>


<footer>
<div class="pull-right">
Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
</div>
<div class="clearfix"></div>
</footer>

</div>
</div>

<script src="<c:url value="/resources/vendors/jquery/dist/jquery.min.js"/> "/></script>

<script src="<c:url value="/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"/> "/></script>

<script src="<c:url value="/resources/vendors/fastclick/lib/fastclick.js"/> "/></script>

<script src="<c:url value="/resources/vendors/nprogress/nprogress.js"/> "/></script>

<script src="<c:url value="/resources/vendors/Chart.js/dist/Chart.min.js"/> "/></script>

<script src="<c:url value="/resources/build/js/custom.min.js"/> "/></script>
<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v64f9daad31f64f81be21cbef6184a5e31634941392597" integrity="sha512-gV/bogrUTVP2N3IzTDKzgP0Js1gg4fbwtYB6ftgLbKQu/V8yH2+lrKCfKHelh4SO3DPzKj4/glTO+tNJGDnb0A==" data-cf-beacon='{"rayId":"6bdfd2d08ecd618e","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2021.12.0","si":100}' crossorigin="anonymous"></script>
</body>
</html>
