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
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <!-- ============================================================== -->
                    <!-- pageheader  -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="page-header">
                                <h2 class="pageheader-title">리뷰 승인</h2>
                                <p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">메뉴</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">리뷰 승인</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end pageheader  -->
                    <!-- ============================================================== -->
                    <div class="ecommerce-widget">                 
                    	<div class="row">
                            <!-- ============================================================== -->
                      
                            <!-- ============================================================== -->
	                        <!-- image cards  -->
	                        <!-- ============================================================== -->
	                        <div class="row">
	                        	<c:forEach items="${ reviewList }" var="dto">	                            
		                            <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12 col-lg-6 col-md-6 col-sm-12 col-12">
		                                <div class="card">
			                                <div class="card-header">
		                                        ${ dto.reviewDTO.member_id }
		                                    </div>
		                                    <img class="img-fluid mx-auto" src="/images/review/logo.png" alt="Card image cap" width="300">
		                                    <div class="card-body">
		                                        <h3 class="card-title">${ dto.gameDTO.name }</h3>
		                                        <p class="card-text">${ dto.reviewDTO.contents }</p>
		                                        <p class="text-muted">${ dto.reviewDTO.date }</p>
		                                    </div>
		                                    <div class="card-footer p-0 text-center d-flex justify-content-center">
		                                        <div class="card-footer-item card-footer-item-bordered">
		                                            <a href="#" class="card-link" data-toggle="modal" data-target="#exampleModal">비승인</a>
		                                        </div>
		                                        <div class="card-footer-item card-footer-item-bordered">
		                                            <a href="/updateReviewAppr?no=${ dto.reviewDTO.no }" class="card-link">승인</a>
		                                        </div>
		                                    </div>	                                    
		                                </div>
		                            </div>
	                                <!-- Modal -->
	                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	                                    <div class="modal-dialog" role="document">
	                                        <div class="modal-content">
	                                            <div class="modal-header">
	                                                <h5 class="modal-title" id="exampleModalLabel">사유 입력</h5>
	                                                <a href="#" class="close" data-dismiss="modal" aria-label="Close">
	                                                    <span aria-hidden="true">&times;</span>
	                                                </a>
	                                            </div>
	                                            <form action="/updateReviewDisappr">
	                                            <div class="modal-body">
	                                                <p>비승인 사유를 입력해주세요.</p>
		                                            <div class="form-group">
		                                                <label for="inputText3" class="col-form-label">#</label>
		                                                <input id="inputText3" type="text" class="form-control" value="${ dto.reviewDTO.no }" name="no">
		                                            </div>                                               
		                                            <div class="form-group">
		                                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="disapprRsn"></textarea>
		                                            </div>                                                
	                                            </div>
	                                            <div class="modal-footer">
	                                                <a href="#" class="btn btn-secondary" data-dismiss="modal">취소</a>
	                                                <input type="submit" class="btn btn-primary" value="등록">
	                                            </div>
	                                            </form>
	                                        </div>
	                                    </div>
	                                </div>		                            
	                           	</c:forEach>	                           	                           	                            
	                        </div>
	                        <!-- ============================================================== -->
	                        <!-- end image cards  -->
	                        <!-- ============================================================== -->     
                                                        
                        </div>                                    
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <div class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                             Copyright © 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
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
    <script>
		$(document).ready(function() {
			$('#navReviewAppr').addClass('active');						
		}); // ready end
		
	</script>
</body>
</html>