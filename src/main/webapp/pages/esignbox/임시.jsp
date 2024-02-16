<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"  xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
      layout:decorate="layout/default_layout">
<head>
<%--    <link rel="stylesheet" href="/css/style.css">--%>
    <link rel="stylesheet" href="/css/board.css">
    <%@include file="/common/bootstrap_common.jsp"%>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<%@ include file="/pages/include/header.jsp"%>
<%@ include file="/pages/include/sidebar.jsp"%>
    <div class="wrapper">
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    임시보관함
                </h1>
            </section>
            <div id="container">
                <body>
                <!-- body start    -->
                <div class="container">
                    <div class="page-header">
                        <h2>게시판 <small>게시글목록</small></h2>
                        <hr />
                    </div>
                    <!-- 검색기 시작 -->
                    <div class="row">
                        <div class="col-3">
                            <select id="gubun" class="form-select" aria-label="분류선택">
                                <option value="none">분류선택</option>
                                <option value="b_title">제목</option>
                                <option value="b_writer">기안자</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                                   aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>
                        </div>
                        <div class="col-3">
                            <button id="btn_search" class="btn btn-danger" onClick="boardSearch()">검색</button>
                        </div>
                    </div>
                    <!-- 검색기 끝 -->
                    <!-- 회원목록 시작 -->
                    <div class='board-list'>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th width="10%">문서번호</th>
                                <th width="40%">제목</th>
                                <th width="20%">기안자</th>
                                <th width="15%">기안일</th>
                                <th width="15%">구분</th>
                                <th width="15%">상태</th>
                            </tr>
                            </thead>
                            <tbody>



                            </tbody>
                        </table>
                        <hr />
                        <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
                        <div style="display:flex;justify-content:center;">
                            <ul class="pagination">

                            </ul>
                        </div>
                        <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
                        <div class='board-footer'>
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardForm">
                                기안하기
                            </button>
                        </div>
                    </div>
                    <!-- 회원목록   끝  -->

                </div>
            </div>
        </div>
    </div>


<!-- /.content-wrapper -->

<%@ include file="/pages/include/footer.jsp"%>
</body>
</html>

