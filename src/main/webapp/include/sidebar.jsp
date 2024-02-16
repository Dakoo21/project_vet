<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


    <div class="preloader flex-column justify-content-center align-items-center">
        <img class="animation__shake" src="/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
    </div>
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="index3.html" class="nav-link">Home</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link">Contact</a>
            </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <!-- Navbar Search -->
            <li class="nav-item">
                <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                    <i class="fas fa-search"></i>
                </a>
                <div class="navbar-search-block">
                    <form class="form-inline">
                        <div class="input-group input-group-sm">
                            <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
                            <div class="input-group-append">
                                <button class="btn btn-navbar" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </li>

            <!-- Messages Dropdown Menu -->
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="far fa-comments"></i>
                    <span class="badge badge-danger navbar-badge">3</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    Brad Diesel
                                    <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                                </h3>
                                <p class="text-sm">Call me whenever you can...</p>
                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    John Pierce
                                    <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                                </h3>
                                <p class="text-sm">I got your message bro</p>
                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    Nora Silvester
                                    <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                                </h3>
                                <p class="text-sm">The subject goes here</p>
                                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
                </div>
            </li>
            <!-- Notifications Dropdown Menu -->
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="far fa-bell"></i>
                    <span class="badge badge-warning navbar-badge">15</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <span class="dropdown-item dropdown-header">15 Notifications</span>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-envelope mr-2"></i> 4 new messages
                        <span class="float-right text-muted text-sm">3 mins</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-users mr-2"></i> 8 friend requests
                        <span class="float-right text-muted text-sm">12 hours</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-file mr-2"></i> 3 new reports
                        <span class="float-right text-muted text-sm">2 days</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                    <i class="fas fa-expand-arrows-alt"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-widget="control-sidebar" data-controlsidebar-slide="true" href="#" role="button">
                    <i class="fas fa-th-large"></i>
                </a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="index3.html" class="brand-link">
            <img src="/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
            <span class="brand-text font-weight-light">AdminLTE 3</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                    <a href="#" class="d-block">Alexander Pierce</a>
                </div>
            </div>

            <!-- SidebarSearch Form -->
            <div class="form-inline">
                <div class="input-group" data-widget="sidebar-search">
                    <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-sidebar">
                            <i class="fas fa-search fa-fw"></i>
                        </button>
                    </div>
                </div>
            </div>
    <!-- Sidebar Menu -->
    <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="true">
            <!-- 메뉴1 시작 -->
            <li class="nav-item menu-open">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-copy"></i>
                    <p>
                        디폴트
                        <i class="fas fa-angle-left right"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link active">
                            <i class="far fa-circle nav-icon"></i>
                            <p>디폴트페이지</p>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 메뉴 끝-->
            <!-- 메뉴2 시작 -->
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-copy"></i>
                    <p>
                        마이페이지
                        <i class="fas fa-angle-left right"></i>
                    </p>
                </a>
                <!-- 하위메뉴 시작 -->
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="/pages/mypage/employee.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>사원 마이페이지</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->
                    <li class="nav-item">
                        <a href="/pages/mypage/nurse.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>간호사 마이페이지</p>
                        </a>
                    </li>
                    <!-- 하위메뉴 시작 -->
                    <li class="nav-item">
                        <a href="/pages/mypage/nurse2.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>간호사 마이페이지2</p>
                        </a>
                    </li>
                <!-- 하위메뉴 시작 -->
                    <li class="nav-item">
                        <a href="/pages/mypage/admin.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>관리자 마이페이지</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/mypage/customer.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>고객 마이페이지</p>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 메뉴 끝-->
            <!-- 메뉴3 시작 -->
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-copy"></i>
                    <p>
                        병원안내
                        <i class="fas fa-angle-left right"></i>
                    </p>
                </a>
                <!-- 하위메뉴 시작 -->
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>병원 위치안내</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>병원 이벤트 캘린더</p>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 메뉴 끝-->
            <!-- 메뉴4 시작 -->
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-copy"></i>
                    <p>
                        입양신청 게시판
                        <i class="fas fa-angle-left right"></i>
                    </p>
                </a>
                <!-- 하위메뉴 시작 -->
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="/pages/adopt/adoptDoc.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>입양 신청서 작성</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/adopt/AdoptList.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>유기동물 조회</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>상세글 등록</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/adopt/AdoptRegister.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>상세글 조회</p>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 메뉴 끝-->
            <!-- 메뉴5 시작 -->
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-copy"></i>
                    <p>
                        공지사항 게시판
                        <i class="fas fa-angle-left right"></i>
                    </p>
                </a>
                <!-- 하위메뉴 시작 -->
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="/pages/notice/noticeList.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>전체 조회</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/notice/noticeDetail.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>상세페이지</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>공지글 작성</p>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 메뉴 끝-->
            <!-- 메뉴6 시작 -->
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-copy"></i>
                    <p>
                        Q&A
                        <i class="fas fa-angle-left right"></i>
                    </p>
                </a>
                <!-- 하위메뉴 시작 -->
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>Q&A전체조회</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>Q&A상세페이지</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>Q작성</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>A작성</p>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 메뉴 끝-->
            <!-- 메뉴7 시작 -->
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-copy"></i>
                    <p>
                        진료 예약
                        <i class="fas fa-angle-left right"></i>
                    </p>
                </a>
                <!-- 하위메뉴 시작 -->
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>진료 예약 조회 게시판(사원)</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>진료 예약 상세조회(사원)</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>진료 예약 작성(사원)</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>진료 예약 조회 게시판(고객)</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>진료 예약 신청(고객)</p>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 메뉴 끝-->
            <!-- 메뉴8 시작 -->
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-copy"></i>
                    <p>
                        데이터관리(고객-동물)
                        <i class="fas fa-angle-left right"></i>
                    </p>
                </a>
                <!-- 하위메뉴 시작 -->
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="/pages/customerDB/TotalDataList.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>고객-동물 전체 데이터 조회</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/customerDB/TotalDataRegister.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>고객-동물 DB등록</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/customerDB/TotalDataDetail.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>고객-동물 상세페이지</p>
                        </a>
                    </li>
                    <!-- 하위메뉴 시작 -->
                    <li class="nav-item">
                        <a href="/pages/customerDB/TotalCustomerList.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>고객 데이터</p>
                        </a>
                    </li>
                    <!-- 하위메뉴 시작 -->
                    <li class="nav-item">
                        <a href="/pages/customerDB/MedicalChart.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>진료기록 등록</p>
                        </a>
                    </li>
                <!-- 하위메뉴 시작 -->
                    <li class="nav-item">
                        <a href="/pages/customerDB/MedicalLog.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>진료기록 조회</p>
                        </a>
                    </li>
                    <!-- 하위메뉴 시작 -->
                    <li class="nav-item">
                        <a href="/pages/medlog/medlogList.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>진료기록 조회2</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>진료기록 상세페이지</p>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 메뉴 끝-->
            <!-- 메뉴9 시작 -->
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-copy"></i>
                    <p>
                        결제
                        <i class="fas fa-angle-left right"></i>
                    </p>
                </a>
                <!-- 하위메뉴 시작 -->
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="/pages/payment/payment.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>결제페이지</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/payment/payment2.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>결제페이지2</p>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 메뉴 끝-->
            <!-- 메뉴10 시작 -->
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-copy"></i>
                    <p>
                        전자결재
                        <i class="fas fa-angle-left right"></i>
                    </p>
                </a>
                <!-- 하위메뉴 시작 -->
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="/pages/esignbox/esignInsert.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>기안서 작성</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>기안서 조회</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>문서보관함</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>임시보관함</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>취소보관함</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>지출결의서</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/default/default.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>진행중인 문서</p>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 메뉴 끝-->
            <!-- 메뉴11 시작 -->
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-copy"></i>
                    <p>
                        재고관리
                        <i class="fas fa-angle-left right"></i>
                    </p>
                </a>
                <!-- 하위메뉴 시작 -->
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="/pages/stock/stockDetail.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>재고조회 리스트</p>
                        </a>
                    </li>
                <!-- 하위메뉴 시작 -->
                    <li class="nav-item">
                        <a href="/pages/stock/stockInsert.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>재고조회 상세페이지</p>
                        </a>
                    </li>
                    <!-- 하위메뉴 시작 -->
                    <li class="nav-item">
                        <a href="/pages/stock/stockInsert.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>재고 추가</p>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 메뉴 끝-->
            <!-- 메뉴12 시작 -->
            <li class="nav-item">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-copy"></i>
                    <p>
                        시설 예약
                        <i class="fas fa-angle-left right"></i>
                    </p>
                </a>
                <!-- 하위메뉴 시작 -->
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="/pages/reservespot/dailyReserve.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>일일 에약 현황</p>
                        </a>
                    </li>

                <!-- 하위메뉴 시작 -->

                    <li class="nav-item">
                        <a href="/pages/reservespot/allReserve.jsp" class="nav-link">
                            <i class="far fa-circle nav-icon"></i>
                            <p>에약 현황 조회</p>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 메뉴 끝-->

        </ul>
    </nav>
    <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
    </aside>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->

<%--<script>--%>
<%--    $.widget.bridge('uibutton', $.ui.button)--%>
<%--</script>--%>
<%--<li class="nav-item">--%>
<%--    <a href="#" class="nav-link">--%>
<%--        <i class="nav-icon fas fa-copy"></i>--%>
<%--        <p>--%>
<%--            디폴트--%>
<%--            <i class="fas fa-angle-left right"></i>--%>
<%--            <span class="badge badge-info right">6</span>--%>
<%--        </p>--%>
<%--    </a>--%>
<%--    <ul class="nav nav-treeview">--%>
<%--        <li class="nav-item">--%>
<%--            <a href="/pages/default/default.jsp" class="nav-link">--%>
<%--                <i class="far fa-circle nav-icon"></i>--%>
<%--                <p>디폴트페이지</p>--%>
<%--            </a>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--</li>--%>