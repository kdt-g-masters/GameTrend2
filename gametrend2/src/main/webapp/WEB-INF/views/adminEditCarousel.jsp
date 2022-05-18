<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">    
    <link rel="stylesheet" href="/vendor/fonts/fontawesome/css/fontawesome-all.css">    
<title>관리자 페이지</title>

<link rel="stylesheet" href="/css/admin.css">
</head>
<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
		<!-- navbar & sidebar -->
		<%@ include file="adminNav.jsp" %>
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
                                    <h2 class="pageheader-title">메인 이미지 수정</h2>
                                    <p class="pageheader-text">메인 이미지 수정</p>
                                    <div class="page-breadcrumb">
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">메뉴</a></li>
                                                <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">메인 이미지</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">메인 이미지 수정</li>
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
                                        <form action="updateMainimg" method="post" enctype="multipart/form-data">
                                        	<div class="form-group">
                                                <label for="inputText3" class="col-form-label">#</label>
                                                <input id="inputText3" type="text" class="form-control" value="${ carouselDTO.no }" name="no" readonly>
                                            </div>                                                                                    
                                        	<label class="col-form-label">메인 이미지</label><br>
                                        	<img src="/images/carousel/${ carouselDTO.image }" width="700"/>
                                        	<div class="custom-file mb-3">
                                                <input type="file" class="custom-file-input" id="customFile" value="${ carouselDTO.image }" name="multipartFile">
                                                <label class="custom-file-label" for="customFile">이미지 파일 선택</label>
                                            </div>                                            
                                            <div class="form-group">
                                                <label for="inputText3" class="col-form-label">게임 이름</label>
                                                <input id="inputText3" type="text" class="form-control" value="${ carouselDTO.title }" name="title">
                                            </div>
                                            <div class="form-group">
                                                <label for="inputText3" class="col-form-label">설명</label>
                                                <input id="inputText3" type="text" class="form-control" value="${ carouselDTO.subtitle }" name="subtitle">
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
    <script>
		$(document).ready(function() {
			$('#navCarousel').addClass('active');
		}); // ready end		
	</script>
</body>
</html>