<%@ page import="com.example.vet.config.auth.PrincipalDetails" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
    String username = (String) principalDetails.getUsername();
    Integer userpk = principalDetails.getID();
    String name = principalDetails.getName();
    // Integer userPK = (Integer) request.getAttribute("userPK");
    // String username = (String) request.getAttribute("username");
    String role = (String) request.getAttribute("role");
    boolean isAdmin = request.isUserInRole("ROLE_ADMIN");
    boolean isMaster = request.isUserInRole("ROLE_MASTER");
    boolean isNurse = request.isUserInRole("ROLE_NURSE");
    boolean isInfo = request.isUserInRole("ROLE_INFO");
    boolean isUser = request.isUserInRole("ROLE_USER");
    boolean isOk = false;
    if(isAdmin){
        isOk = true;
    }
    else if(isMaster){
        isOk = true;
    }
    else if(isNurse){
        isOk = true;
    }
    else if(isInfo){
        isOk = true;
    }
    else if(isUser){
        isOk = true;
    }

%>
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
            <a href="/" class="nav-link">Home</a>
        </li>
    </ul>
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
            </a>
        </li>
        <!-- Notifications Dropdown Menu -->
        <li class="nav-item dropdown">
            <a class="nav-link" data-toggle="dropdown" href="#">
                <span><%=name%> 님</span>
            </a>
            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <span class="dropdown-item dropdown-header">메뉴</span>
                <div class="dropdown-divider"></div>
                <a href="/myPageIn" class="dropdown-item">
                    <i class="fas fa-users mr-2"></i> 내정보 수정
                </a>
                <div class="dropdown-divider"></div>
                <a href="/logout" class="dropdown-item dropdown-footer">로그아웃</a>
            </div>
        </li>
    </ul>
</nav>
<!-- /.navbar -->
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="" class="brand-link">
        <img src="/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">동물생심</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="/" class="d-block"><%=name%>님 환영합니다</a>
            </div>
        </div>
        <%
            if(isUser) {
        %>
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="true">
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
                            <a href="/introMap" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>병원 위치안내</p>
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
                            <a href="/notice" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>전체 조회</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- 메뉴 끝-->
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
        <%
        } else if (isNurse || isInfo) {
        %>
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="true">
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
                        <%
                            if (isInfo) {
                        %>
                        <li class="nav-item">
                            <a href="/" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>데스크 마이페이지</p>
                            </a>
                        </li>
                        <%
                        } else {
                        %>
                        <!-- 하위메뉴 시작 -->
                        <li class="nav-item">
                            <a href="/" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>간호사 마이페이지</p>
                            </a>
                        </li>
                        <%
                            }
                        %>
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
                            <a href="/introMap" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>병원 위치안내</p>
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
                            <a href="/notice" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>전체 조회</p>
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
                            <a href="/booking/bookingRegister" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>진료 예약 등록</p>
                            </a>
                        </li>
                    </ul>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/booking/bookingList" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>진료 예약 조회</p>
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
                            <a href="CustomerDB/TotalDataList" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>고객-동물 전체 데이터 조회</p>
                            </a>
                        </li>
                        <!-- 하위메뉴 시작 -->
                        <li class="nav-item">
                            <a href="/CustomerDB/TotalCustomerList" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>고객 데이터</p>
                            </a>
                        </li>
                        <!-- 하위메뉴 시작 -->
                        <li class="nav-item">
                            <a href="/diag/diagList" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>진료기록 조회</p>
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
                        <!-- 하위메뉴 시작 -->
                        <li class="nav-item">
                            <a href="/pages/esignbox/esignDetail.jsp" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>기안서 조회</p>
                            </a>
                        </li>
                        <!-- 하위메뉴 시작 -->
                        <li class="nav-item">
                            <a href="/eSign/docsBox" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>문서보관함</p>
                            </a>
                        </li>
                        <!-- 하위메뉴 시작 -->
                        <li class="nav-item">
                            <a href="/eSign/cancelledDocs" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>취소보관함</p>
                            </a>
                        </li>
                        <!-- 하위메뉴 시작 -->
                        <li class="nav-item">
                            <a href="/eSign/progressDocs" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>진행중인 문서</p>
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
                            <a href="/reservespot/dailyReserve" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>일일 에약 현황</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- 메뉴 끝-->
            </ul>
        </nav>
        <%
        } else if (isMaster || isAdmin) {
        %>
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="true">
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
                        <!-- 하위메뉴 시작 -->
                        <li class="nav-item">
                            <a href="/" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>관리자 마이페이지</p>
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
                            <a href="/introMap" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>병원 위치안내</p>
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
                            <a href="/notice" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>전체 조회</p>
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
                            <a href="/booking/bookingRegister" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>진료 예약 등록</p>
                            </a>
                        </li>
                    </ul>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="/booking/bookingList" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>진료 예약 조회</p>
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
                            <a href="CustomerDB/TotalDataList" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>고객-동물 전체 데이터 조회</p>
                            </a>
                        </li>
                        <!-- 하위메뉴 시작 -->
                        <li class="nav-item">
                            <a href="/CustomerDB/TotalCustomerList" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>고객 데이터</p>
                            </a>
                        </li>
                        <!-- 하위메뉴 시작 -->
                        <li class="nav-item">
                                <a href="/diag/diagList" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>진료기록 조회</p>
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
                        <!-- 하위메뉴 시작 -->
                        <li class="nav-item">
                            <a href="/pages/esignbox/esignDetail.jsp" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>기안서 조회</p>
                            </a>
                        </li>
                        <!-- 하위메뉴 시작 -->
                        <li class="nav-item">
                            <a href="/eSign/docsBox" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>문서보관함</p>
                            </a>
                        </li>
                        <!-- 하위메뉴 시작 -->
                        <li class="nav-item">
                            <a href="/eSign/cancelledDocs" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>취소보관함</p>
                            </a>
                        </li>
                        <!-- 하위메뉴 시작 -->
                        <li class="nav-item">
                            <a href="/eSign/progressDocs" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>진행중인 문서</p>
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
                            <a href="/reservespot/dailyReserve" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>일일 에약 현황</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- 메뉴 끝-->
                <!-- 메뉴13 시작 -->
                <li class="nav-item">
                    <a href="/employeeList" class="nav-link">
                        <p>
                            사원관리
                        </p>
                    </a>
                </li>
                <!-- 메뉴 끝-->
            </ul>
        </nav>
        <%
            }
        %>
    </div>
    <!-- /.sidebar -->
</aside>
<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->