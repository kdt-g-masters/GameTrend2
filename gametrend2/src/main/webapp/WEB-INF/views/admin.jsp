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
                                <h2 class="pageheader-title">게임 목록</h2>
                                <p class="pageheader-text">Nulla euismod urna eros, sit amet scelerisque torton lectus vel mauris facilisis faucibus at enim quis massa lobortis rutrum.</p>
                                <div class="page-breadcrumb">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="#" class="breadcrumb-link">메뉴</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">게임 목록</li>
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

                                          <!-- 게임목록 추가  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-12 col-lg-12 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">게임 추가</h5>
                                    <div class="card-body p-0">
                                        <div class="table-responsive datePickerVisible">
                                            <table class="table">
                                                <thead class="bg-light">
                                                    <tr class="border-0">
                                                        <th class="border-0">이미지</th>
                                                        <th class="border-0">이름</th>
                                                        <th class="border-0">설명</th>                                                        
                                                        <th class="border-0">플랫폼</th>
                                                        <th class="border-0">발매일</th>                                                      
                                                    </tr>
                                                </thead>
                                                <form action="addGame" method="post" enctype="multipart/form-data">
	                                                <tbody>
	                                                    <tr>
	                                                        <td>
	                                                            <div class="m-r-10">
		                                                            <div class="custom-file mb-3">
	                                                					<input type="file" class="custom-file-input" id="customFile" name="image">
	                                                					<label class="custom-file-label" for="customFile">thumbnail</label>
	                                            					</div>
	                                                            </div>
	                                                        </td>
	                                                        <td>
	                                                        	<div class="form-group">
					                                                <input id="inputText3" type="text" class="form-control" name="name">
					                                            </div>
	                                                        </td>
	                                                        <td>
	                                                        	<div class="form-group">				                                                
					                                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="1" name="explanation"></textarea>
					                                            </div>
	                                                        </td>
	                                                        <td>
	                                                        	<div class="form-group">
					                                                <select class="form-control" id="input-select" name="platform">
					                                                    <option>PC</option>
					                                                    <option>PlayStation</option>
					                                                    <option>Xbox</option>
					                                                    <option>Switch</option>
					                                                </select>
					                                            </div>
	                                                        </td>
	                                                        <td>
							                                    <div class="form-group">
							                                        <div class="input-group date" id="datetimepicker4" data-target-input="nearest">
							                                            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker4" name="releaseDate"/>
							                                            <div class="input-group-append" data-target="#datetimepicker4" data-toggle="datetimepicker">
							                                                <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
							                                            </div>
							                                        </div>
							                                    </div>
	                                                        </td>                                                       
	                                                    </tr>                                                    
	                                                    <tr>
	                                                        <td colspan="9"><input type="submit" class="btn btn-outline-light float-right" value="추가" /></td>
	                                                    </tr>
	                                                </tbody>
                                                </form>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end recent orders  -->
                            
                        </div>                       
                        <div class="row">
                            <!-- ============================================================== -->
                      
                            <!-- ============================================================== -->

                                          <!-- 게임목록  -->
                            <!-- ============================================================== -->
                            <div class="col-xl-12 col-lg-12 col-md-6 col-sm-12 col-12">
                                <div class="card">
                                    <h5 class="card-header">최근 추가된 게임 목록</h5>
                                    <div class="card-body p-0">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead class="bg-light">
                                                    <tr class="border-0">
                                                        <th class="border-0">#</th>
                                                        <th class="border-0">이미지</th>
                                                        <th class="border-0">이름</th>
                                                        <th class="border-0">설명</th>
                                                        <th class="border-0">플랫폼</th>
                                                        <th class="border-0">발매일</th>
                                                        <th class="border-0">수정</th>
                                                        <th class="border-0">삭제</th>                                                      
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                	<c:forEach items="${ gameList }" var="dto">
	                                                	<tr>	
	                                                        <td>${ dto.no }</td>
	                                                        <td>
	                                                            <div class="m-r-10"><img src="/images/thumbnail/${ dto.thumbnail }" alt="thumbnail" class="rounded" width="45"></div>
	                                                        </td>
	                                                        <td>${ dto.name }</td>
	                                                        <td>${ dto.explanation }</td>
	                                                        <td>${ dto.platform }</td>
	                                                        <td>${ dto.releaseDate }</td>
	                                                        <td><a href="/updateGame?no=${ dto.no }"><i class="fas fa-edit"></i></a></td>
	                                                        <td><a href="/deleteGame?no=${ dto.no }"><i class="fas fa-trash"></i></a></td>                                                       
	                                                    </tr>
                                                	</c:forEach>                                                                                               
                                                    <tr>
                                                        <td colspan="9"><a href="#" class="btn btn-outline-light float-right">더보기</a></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end recent orders  -->
                            
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
			$('#navGameList').addClass('active');
		}); // ready end		
	</script>
</body>
</html>