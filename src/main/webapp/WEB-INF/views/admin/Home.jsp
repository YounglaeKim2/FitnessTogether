<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<!DOCTYPE html>
	<html lang="en">
  	<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/favicon.ico" type="image/ico" />

    <title> 관리자페이지 </title>

    <!-- Bootstrap -->
    <link href="<c:url value="/resources/vendors/bootstrap/dist/css/bootstrap.min.css"/>" rel="stylesheet"/>
    <!-- Font Awesome -->
    <link href="<c:url value="/resources/vendors/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet"/>
    <!-- NProgress -->
    <link href="<c:url value="/resources/vendors/nprogress/nprogress.css"/>" rel="stylesheet"/>
    <!-- iCheck -->
    <link href="<c:url value="/resources/vendors/iCheck/skins/flat/green.css"/>" rel="stylesheet"/>
	
    <!-- bootstrap-progressbar -->
    <link href="<c:url value="/resources/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"/>" rel="stylesheet"/>
    <!-- JQVMap -->
    <link href="<c:url value="/resources/vendors/jqvmap/dist/jqvmap.min.css"/>" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="<c:url value="/resources/vendors/bootstrap-daterangepicker/daterangepicker.css"/>" rel="stylesheet"/>

    <!-- Custom Theme Style -->
    <link href="<c:url value="/resources/build/css/custom.min.css"/>" rel="stylesheet"/>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="" class="site_title"><i class="fa fa-paw"></i> <span>Fitness Together</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
              <img src="<c:url value="/resources/build/images/premium-icon-admin-3093042.png" />" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>admin</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

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

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a style="width:230px;" data-toggle="tooltip" data-placement="top" title="Logout" href="<c:url value="/fnt/Logout.do"/>">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>
              <nav class="nav navbar-nav">
           	  </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="container" style="inline-block;" >
          <div class="tile_count">
            <div class="col-md-3 tile_stats_count  ">
              <span class="count_top"><i class="fa fa-user"></i> 총 방문자 수 </span>
              <div class="count">2500</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>4%</i> 지난 주</span>
            </div>
            <div class="col-md-3  tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i> 오늘의 방문자 수 </span>
              <div class="count">123</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i>지난 주</span>
            </div>
             <div class="col-md-3  tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i> 총 게시물 수 </span>
              <div class="count">300</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>9% </i>지난 주</span>
            </div>
             <div class="col-md-3 tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i> 회원 수 </span>
              <div class="count">500</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>6% </i>지난 주</span>
            </div>
        
          </div>
        </div>
          <!-- /top tiles -->

        

          <br />

         


          <div class="row">
            <div class="col-md-4 col-sm-4 ">
              <div class="x_panel tile fixed_height_400">
                <div class="x_title">
                  <h2>Recent Activities <small>Sessions</small></h2>
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
                  <div class="dashboard-widget-content">

                    <ul class="list-unstyled timeline widget">
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a>Who Needs Sundance When You’ve Got&nbsp;Crowdfunding?</a>
                                          </h2>
                            <div class="byline">
                              <span>13 hours ago</span> by <a>Jane Smith</a>
                            </div>
                            <p class="excerpt">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and… <a>Read&nbsp;More</a>
                            </p>
                          </div>
                        </div>
                      </li>
                     
                        
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a>Who Needs Sundance When You’ve Got&nbsp;Crowdfunding?</a>
                                          </h2>
                            <div class="byline">
                              <span>13 hours ago</span> by <a>Jane Smith</a>
                            </div>
                            <p class="excerpt">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and… <a>Read&nbsp;More</a>
                            </p>
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a>Who Needs Sundance When You’ve Got&nbsp;Crowdfunding?</a>
                                          </h2>
                            <div class="byline">
                              <span>13 hours ago</span> by <a>Jane Smith</a>
                            </div>
                            <p class="excerpt">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and… <a>Read&nbsp;More</a>
                            </p>
                          </div>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>


            <div class="col-md-8 col-sm-8 ">



             
              <div class="row">


                <!-- Start to do list -->
                <div class="col-md-6 col-sm-6 ">
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>To Do List <small>Sample tasks</small></h2>
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

                      <div class="">
                        <ul class="to_do">
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Schedule meeting with new client </p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Create email address for new intern</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Have IT fix the network printer</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Copy backups to offsite location</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Food truck fixie locavors mcsweeney</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Food truck fixie locavors mcsweeney</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Create email address for new intern</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Have IT fix the network printer</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Copy backups to offsite location</p>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- End to do list -->
                
                <!-- start of weather widget -->
                <div class="col-md-6 col-sm-6 ">
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>Daily active users <small>Sessions</small></h2>
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
                      <div class="row">
                        <div class="col-sm-12">
                          <div class="temperature"><b>Monday</b>, 07:30 AM
                            <span>F</span>
                            <span><b>C</b></span>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-sm-4">
                          <div class="weather-icon">
                            <canvas height="84" width="84" id="partly-cloudy-day"></canvas>
                          </div>
                        </div>
                        <div class="col-sm-8">
                          <div class="weather-text">
                            <h2>Texas <br><i>Partly Cloudy Day</i></h2>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-12">
                        <div class="weather-text pull-right">
                          <h3 class="degrees">23</h3>
                        </div>
                      </div>

                      <div class="clearfix"></div>

                      <div class="row weather-days">
                        <div class="col-sm-2">
                          <div class="daily-weather">
                            <h2 class="day">Mon</h2>
                            <h3 class="degrees">25</h3>
                            <canvas id="clear-day" width="32" height="32"></canvas>
                            <h5>15 <i>km/h</i></h5>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <div class="daily-weather">
                            <h2 class="day">Tue</h2>
                            <h3 class="degrees">25</h3>
                            <canvas height="32" width="32" id="rain"></canvas>
                            <h5>12 <i>km/h</i></h5>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <div class="daily-weather">
                            <h2 class="day">Wed</h2>
                            <h3 class="degrees">27</h3>
                            <canvas height="32" width="32" id="snow"></canvas>
                            <h5>14 <i>km/h</i></h5>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <div class="daily-weather">
                            <h2 class="day">Thu</h2>
                            <h3 class="degrees">28</h3>
                            <canvas height="32" width="32" id="sleet"></canvas>
                            <h5>15 <i>km/h</i></h5>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <div class="daily-weather">
                            <h2 class="day">Fri</h2>
                            <h3 class="degrees">28</h3>
                            <canvas height="32" width="32" id="wind"></canvas>
                            <h5>11 <i>km/h</i></h5>
                          </div>
                        </div>
                        <div class="col-sm-2">
                          <div class="daily-weather">
                            <h2 class="day">Sat</h2>
                            <h3 class="degrees">26</h3>
                            <canvas height="32" width="32" id="cloudy"></canvas>
                            <h5>10 <i>km/h</i></h5>
                          </div>
                        </div>
                        <div class="clearfix"></div>
                      </div>
                    </div>
                  </div>

                </div>
                <!-- end of weather widget -->
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="<c:url value="/resources/vendors/jquery/dist/jquery.min.js"/>"/></script>
    <!-- Bootstrap -->
    <script src="<c:url value="/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"/>"/></script>
    <!-- FastClick -->
    <script src="<c:url value="/resources/vendors/fastclick/lib/fastclick.js"/>"/></script>
    <!-- NProgress -->
    <script src="<c:url value="/resources/vendors/nprogress/nprogress.js"/>"/></script>
    <!-- Chart.js -->
    <script src="<c:url value="/resources/vendors/Chart.js/dist/Chart.min.js"/>"/></script>
    <!-- gauge.js -->
    <script src="<c:url value="/resources/vendors/gauge.js/dist/gauge.min.js"/>"/></script>
    <!-- bootstrap-progressbar -->
    <script src="<c:url value="/resources/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"/>"/></script>
    <!-- iCheck -->
    <script src="<c:url value="/resources/vendors/iCheck/icheck.min.js"/>"/></script>
    <!-- Skycons -->
    <script src="<c:url value="/resources/vendors/skycons/skycons.js"/>"/></script>
    <!-- Flot -->
    <script src="<c:url value="/resources/vendors/Flot/jquery.flot.js"/>"/></script>
    <script src="<c:url value="/resources/vendors/Flot/jquery.flot.pie.js"/>"/></script>
    <script src="<c:url value="/resources/vendors/Flot/jquery.flot.time.js"/>"/></script>
    <script src="<c:url value="/resources/vendors/Flot/jquery.flot.stack.js"/>"/></script>
    <script src="<c:url value="/resources/vendors/Flot/jquery.flot.resize.js"/>"/></script>
    <!-- Flot plugins -->
    <script src="<c:url value="/resources/vendors/flot.orderbars/js/jquery.flot.orderBars.js"/>"/></script>
    <script src="<c:url value="/resources/vendors/flot-spline/js/jquery.flot.spline.min.js"/>"/></script>
    <script src="<c:url value="/resources/vendors/flot.curvedlines/curvedLines.js"/>"/></script>
    <!-- DateJS -->
    <script src="<c:url value="/resources/vendors/DateJS/build/date.js"/>"/></script>
    <!-- JQVMap -->
    <script src="<c:url value="/resources/vendors/jqvmap/dist/jquery.vmap.js"/>"/></script>
    <script src="<c:url value="/resources/vendors/jqvmap/dist/maps/jquery.vmap.world.js"/>"/></script>
    <script src="<c:url value="/resources/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"/>"/></script>
    <!-- bootstrap-daterangepicker -->
    <script src="<c:url value="/resources./vendors/moment/min/moment.min.js"/>"/></script>
    <script src="<c:url value="/resources/vendors/bootstrap-daterangepicker/daterangepicker.js"/>"/></script>

    <!-- Custom Theme Scripts -->
    <script src="<c:url value="/resources/build/js/custom.min.js"/>"/></script>
	
  </body>
</html>
