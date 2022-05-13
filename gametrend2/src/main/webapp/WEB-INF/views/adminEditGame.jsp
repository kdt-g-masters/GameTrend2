<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">    
    <link rel="stylesheet" href="/vendor/fonts/fontawesome/css/fontawesome-all.css">    
    <link rel="stylesheet" href="/vendor/datepicker/tempusdominus-bootstrap-4.css" />
<title>관리자 페이지</title>

<link rel="stylesheet" href="/css/admin.css">
<script>
	$(document).ready(function() {
		
	});
</script>
</head>
<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="/">
                	<img src="/images/logo_sm.png" width="10%">
                	Game Trend
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item">
                            <div id="custom-search" class="top-search-bar">
                                <input class="form-control" type="text" placeholder="Search..">
                            </div>
                        </li>
                        <li class="nav-item dropdown notification">
                            <a class="nav-link nav-icons" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-fw fa-bell"></i> <span class="indicator"></span></a>
                            <ul class="dropdown-menu dropdown-menu-right notification-dropdown">
                                <li>
                                    <div class="notification-title"> Notification</div>
                                    <div class="notification-list">
                                        <div class="list-group">
                                            <a href="#" class="list-group-item list-group-item-action active">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-2.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Jeremy Rakestraw</span>accepted your invitation to join the team.
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-3.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">John Abraham </span>is now following you
                                                        <div class="notification-date">2 days ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-4.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Monaan Pechi</span> is watching your main repository
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                            <a href="#" class="list-group-item list-group-item-action">
                                                <div class="notification-info">
                                                    <div class="notification-list-user-img"><img src="assets/images/avatar-5.jpg" alt="" class="user-avatar-md rounded-circle"></div>
                                                    <div class="notification-list-user-block"><span class="notification-list-user-name">Jessica Caruso</span>accepted your invitation to join the team.
                                                        <div class="notification-date">2 min ago</div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="list-footer"> <a href="#">View all notifications</a></div>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown connection">
                            <a class="nav-link" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-fw fa-th"></i> </a>
                            <ul class="dropdown-menu dropdown-menu-right connection-dropdown">
                                <li class="connection-list">
                                    <div class="row">
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="assets/images/github.png" alt="" > <span>Github</span></a>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="assets/images/dribbble.png" alt="" > <span>Dribbble</span></a>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="assets/images/dropbox.png" alt="" > <span>Dropbox</span></a>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="assets/images/bitbucket.png" alt=""> <span>Bitbucket</span></a>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="assets/images/mail_chimp.png" alt="" ><span>Mail chimp</span></a>
                                        </div>
                                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 ">
                                            <a href="#" class="connection-item"><img src="assets/images/slack.png" alt="" > <span>Slack</span></a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="conntection-footer"><a href="#">More</a></div>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/avatar-1.jpg" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name">John Abraham </h5>
                                    <span class="status"></span><span class="ml-2">Available</span>
                                </div>
                                <a class="dropdown-item" href="#"><i class="fas fa-user mr-2"></i>Account</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-cog mr-2"></i>Setting</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-power-off mr-2"></i>Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
        <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">Dashboard</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                메뉴
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link active" href="#"><i class="fa fa-fw fa-gamepad"></i>게임 목록<span class="badge badge-success">6</span></a>
                                <a class="nav-link" href="#"><i class="fa fa-fw fa-gift"></i>프로모션<span class="badge badge-success">6</span></a>
                                <a class="nav-link" href="#"><i class="fa fa-fw fa-clipboard-check"></i>리뷰 승인<span class="badge badge-success">6</span></a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        <div class="dashboard-wrapper">
            <div class="container-fluid dashboard-content">
                <div class="row">
                    <div class="col-xl-10">
                        <!-- ============================================================== -->
                        <!-- pageheader  -->
                        <!-- ============================================================== -->
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="page-header" id="top">
                                    <h2 class="pageheader-title">게임 데이터 수정</h2>
                                    <p class="pageheader-text">게임 데이터 수정</p>
                                    <div class="page-breadcrumb">
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">메뉴</a></li>
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">게임 목록</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">게임 데이터 수정</li>
                                            </ol>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end pageheader  -->
                        <!-- ============================================================== -->
                        
                        <!-- ============================================================== -->
                        <!-- basic form  -->
                        <!-- ============================================================== -->
                        <div class="row">
                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">편집</h5>
                                    <div class="card-body">
                                        <form action="updateGame" method="post" enctype="multipart/form-data">
                                        	<input id="inputText3" type="text" class="form-control" value="${ gameDTO.no }" name="no" readonly>
                                        	<label class="col-form-label">썸네일</label><br>
                                        	<img src="/images/thumbnail/${ gameDTO.thumbnail }"/>
                                        	<div class="custom-file mb-3">
                                                <input type="file" class="custom-file-input" id="customFile" value="${ gameDTO.thumbnail }" name="mfThumbnail">
                                                <label class="custom-file-label" for="customFile">이미지 파일 선택</label>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputText3" class="col-form-label">제목</label>
                                                <input id="inputText3" type="text" class="form-control" value="${ gameDTO.name }" name="name">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleFormControlTextarea1">설명</label>
                                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="explanation">${ gameDTO.explanation }</textarea>
                                            </div>
                                            <div class="form-group">
	                                            <label>플랫폼</label><br>
	                                            <label class="custom-control custom-radio custom-control-inline">
	                                                <input type="radio" name="platform" class="custom-control-input" value="pc" <c:if test="${gameDTO.platform eq 'pc'}">checked</c:if>><span class="custom-control-label">PC</span>
	                                            </label>
	                                            <label class="custom-control custom-radio custom-control-inline">
	                                                <input type="radio" name="platform" class="custom-control-input" value="PlayStation" <c:if test="${gameDTO.platform eq 'PlayStation'}">checked</c:if>><span class="custom-control-label">PlayStation</span>
	                                            </label>
	                                            <label class="custom-control custom-radio custom-control-inline">
	                                                <input type="radio" name="platform" class="custom-control-input" value="Xbox" <c:if test="${gameDTO.platform eq 'Xbox'}">checked</c:if>><span class="custom-control-label">Xbox</span>
	                                            </label>
	                                            <label class="custom-control custom-radio custom-control-inline">
	                                                <input type="radio" name="platform" class="custom-control-input" value="Switch" <c:if test="${gameDTO.platform eq 'Switch'}">checked</c:if>><span class="custom-control-label">Switch</span>
	                                            </label>                                           	
                                            </div>
		                                    <div class="form-group">
		                                    	<label>발매일</label><br>
		                                        <div class="input-group date" id="datetimepicker4" data-target-input="nearest">
		                                            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker4" name="releaseDate" value="${ gameDTO.releaseDate }"/>
		                                            <div class="input-group-append" data-target="#datetimepicker4" data-toggle="datetimepicker">
		                                                <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
		                                            </div>
		                                        </div>
		                                    </div>
                                            <div class="form-group">
                                                <label for="inputText3" class="col-form-label">트레일러 URL</label>
                                                <input id="inputText3" type="text" class="form-control" value="${ gameDTO.trailer }" name="trailer">
                                            </div>
                                            <img src="/images/screenshot/${ gameDTO.screenshot1 }"/>
                                            <div class="custom-file mb-3">                                            	
                                                <input type="file" class="custom-file-input" id="customFile" name="file1">
                                                <label class="custom-file-label" for="customFile">스크린샷 1</label>
                                            </div>
                                            <img src="/images/screenshot/${ gameDTO.screenshot2 }"/>
                                            <div class="custom-file mb-3">
                                                <input type="file" class="custom-file-input" id="customFile" name="file2">
                                                <label class="custom-file-label" for="customFile">스크린샷 2</label>
                                            </div>
                                            <img src="/images/screenshot/${ gameDTO.screenshot3 }"/>
                                            <div class="custom-file mb-3">
                                                <input type="file" class="custom-file-input" id="customFile" name="file3">
                                                <label class="custom-file-label" for="customFile">스크린샷 3</label>
                                            </div>
                                            <img src="/images/screenshot/${ gameDTO.screenshot4 }"/>
                                            <div class="custom-file mb-3">
                                                <input type="file" class="custom-file-input" id="customFile" name="file4">
                                                <label class="custom-file-label" for="customFile">스크린 샷 4</label>
                                            </div>
                                            <div class="form-group">
                                                <input type="submit" class="btn btn-primary float-right" value="수정" />
                                                <input type="reset" class="btn btn-outline-light float-right" value="취소" />
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ============================================================== -->
                        <!-- end basic form  -->
                        <!-- ============================================================== -->
                    </div>                   
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <div class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                            Copyright © 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                            <div class="text-md-right footer-links d-none d-sm-block">
                                <a href="javascript: void(0);">About</a>
                                <a href="javascript: void(0);">Support</a>
                                <a href="javascript: void(0);">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>        
        <!-- ============================================================== -->
        <!-- end wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <!-- jquery 3.3.1 -->
    <script src="/vendor/jquery/jquery-3.3.1.min.js"></script>
    <!-- bootstap bundle js -->
    <script src="/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- slimscroll js -->
    <script src="/vendor/slimscroll/jquery.slimscroll.js"></script>
    <!-- main js -->
    <script src="/js/admin-js.js"></script>
    <script src="/vendor/datepicker/moment.js"></script>
    <script src="/vendor/datepicker/tempusdominus-bootstrap-4.js"></script>
    <script src="/vendor/datepicker/datepicker.js"></script>    
</body>
</html>