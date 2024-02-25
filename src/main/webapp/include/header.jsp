<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--------------------------------------------------------------------------------------------------------------------------------------------------------------%>
<%
    String username = (String) request.getAttribute("username");
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
<%--------------------------------------------------------------------------------------------------------------------------------------------------------------%>
<%
    if(isUser) {
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
                    <a href="/pages/guide/introMap.jsp" class="nav-link">
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
                <!-- 하위메뉴 시작 -->
                <li class="nav-item">
                    <a href="/pages/adopt/adoptList.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>유기동물 조회</p>
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
                    <a href="/pages/qna/qnaList.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Q&A전체조회</p>
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
                <!-- 하위메뉴 시작 -->
                <li class="nav-item">
                    <a href="/pages/docbook/bookingMainAdmin.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>진료 예약 조회 게시판(고객)</p>
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
                    <a href="/pages/mypage/employee.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>사원 마이페이지</p>
                    </a>
                </li>
                <%
                    } else {
                %>
                <!-- 하위메뉴 시작 -->
                <li class="nav-item">
                    <a href="/pages/mypage/nurse.jsp" class="nav-link">
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
                    <a href="/pages/guide/introMap.jsp" class="nav-link">
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
                    <a href="/pages/adopt/adoptList.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>유기동물 조회</p>
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
                    <a href="/pages/qna/qnaList.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Q&A전체조회</p>
                    </a>
                </li>
                <!-- 하위메뉴 시작 -->
                <li class="nav-item">
                    <a href="/pages/qna/qnaDetail.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Q&A상세페이지</p>
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
                    <a href="/pages/docbook/bookingMainCustomer.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>진료 예약 조회 게시판(사원)</p>
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
                    <a href="/pages/customerDB/totalDataList.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>고객-동물 전체 데이터 조회</p>
                    </a>
                </li>
                <!-- 하위메뉴 시작 -->
                <li class="nav-item">
                    <a href="/pages/customerDB/totalCustomerList.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>고객 데이터</p>
                    </a>
                </li>
                <!-- 하위메뉴 시작 -->
                <li class="nav-item">
                    <a href="/pages/customerDB/medicalLog.jsp" class="nav-link">
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
                    <a href="/pages/payment/paymentList.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>결제리스트</p>
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
                    <a href="/pages/esignbox/docsBox.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>문서보관함</p>
                    </a>
                </li>
                <!-- 하위메뉴 시작 -->
                <li class="nav-item">
                    <a href="/pages/esignbox/cancelledDocs.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>취소보관함</p>
                    </a>
                </li>
                <!-- 하위메뉴 시작 -->
                <li class="nav-item">
                    <a href="/pages/esignbox/progressDocs.jsp" class="nav-link">
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
                    <a href="/pages/stock/stockList.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>재고조회 리스트</p>
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
                    <a href="/pages/mypage/admin.jsp" class="nav-link">
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
                    <a href="/pages/guide/introMap.jsp" class="nav-link">
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
                    <a href="/pages/adopt/adoptList.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>유기동물 조회</p>
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
                    <a href="/pages/qna/qnaList.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Q&A전체조회</p>
                    </a>
                </li>
                <!-- 하위메뉴 시작 -->
                <li class="nav-item">
                    <a href="/pages/qna/qnaDetail.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Q&A상세페이지</p>
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
                    <a href="/pages/docbook/bookingMainCustomer.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>진료 예약 조회 게시판(사원)</p>
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
                    <a href="/pages/customerDB/totalDataList.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>고객-동물 전체 데이터 조회</p>
                    </a>
                </li>
                <!-- 하위메뉴 시작 -->
                <li class="nav-item">
                    <a href="/pages/customerDB/totalCustomerList.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>고객 데이터</p>
                    </a>
                </li>
                <!-- 하위메뉴 시작 -->
                <li class="nav-item">
                    <a href="/pages/customerDB/medicalLog.jsp" class="nav-link">
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
                    <a href="/pages/payment/paymentList.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>결제리스트</p>
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
                    <a href="/pages/esignbox/docsBox.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>문서보관함</p>
                    </a>
                </li>
                <!-- 하위메뉴 시작 -->
                <li class="nav-item">
                    <a href="/pages/esignbox/cancelledDocs.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>취소보관함</p>
                    </a>
                </li>
                <!-- 하위메뉴 시작 -->
                <li class="nav-item">
                    <a href="/pages/esignbox/progressDocs.jsp" class="nav-link">
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
                    <a href="/pages/stock/stockList.jsp" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>재고조회 리스트</p>
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
<%
    }
%>
