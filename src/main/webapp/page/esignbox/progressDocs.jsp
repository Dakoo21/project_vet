<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>진행중인 문서</title>
    <%@ include file="/include/bootCommon.jsp"%>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <%@ include file="/include/sidebar.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>진행중인 문서</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Icons</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <!--여기 -->
            <div class="board">
                <div class="card-header">
                    <h3 class="card-title">
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
                    </h3>

                    <div class="card-tools">
                        <ul class="nav nav-pills ml-auto">
                            <li class="nav-item">
                                <a class="nav-link active" href="#select-all" data-toggle="tab">전체조회</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#select-queue" data-toggle="tab">대기</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#select-processing" data-toggle="tab">진행</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#select-scheduled" data-toggle="tab">예정</a>
                            </li>
                        </ul>
                    </div>
                </div><!-- /.card-header -->
                <div class="card-body">
                    <div class="tab-content p-0">
                        <!-- Morris chart - Sales -->
                        <div class="chart tab-pane active" id="select-all"
                             style="position: relative; height: 300px;">
                            <%@ include file="include/boardList.jsp"%>
                        </div>
                        <div class="chart tab-pane" id="sales-queue" style="position: relative; height: 300px;">
                            <%@ include file="include/boardList.jsp"%>
                        </div>
                        <div class="chart tab-pane" id="sales-processing" style="position: relative; height: 300px;">
                            <%@ include file="include/boardList.jsp"%>
                        </div>
                        <div class="chart tab-pane" id="sales-cheduled" style="position: relative; height: 300px;">
                            <%@ include file="include/boardList.jsp"%>
                        </div>
                    </div>
                </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
</body>
</html>

