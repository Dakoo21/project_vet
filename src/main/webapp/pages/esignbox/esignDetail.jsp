<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
    <%@include file="/include/common/bootstrap_common.jsp"%>
    <%@ include file="/include/bootCommon.jsp"%>
    <%@include file="/include/common/quill_common.jsp"%>
    <style>
        .gray-background {
            background-color: #f0f0f0;
        }

        .white-background {
            background-color: #ffffff;
        }

        .centered-text {
            text-align: center;
        }
        .table-bordered th,
        .table-bordered td {
            padding: 5px;
        }
        .stamp {
            width: 120px;
            height: 120px;
        }
        .team.name,
        .team.position {
            max-height: 50px;
            overflow: hidden;
        }
    </style>
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
                        <h1>Icons</h1>
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
            <div class="card-body">
                <div class="content_title">
                    <fieldset style="max-width:90%;">
                        <span>품의서</span>
                    </fieldset>
                </div>
                <table class="table table-bordered">
                    <tr>
                        <th>문서 종류</th>
                        <td>지출결의서</td>
                        <th>작성자</th>
                        <td>김엘모</td>
                    </tr>
                    <tr>
                        <th scope="row">문서번호</th>
                        <td>AAA-2102131</td>
                        <th>보존연한</th>
                        <td>5년</td>
                    </tr>
                </table>
                <div class="after" style="display: flex; align-items: center;">
                    <h4 class="fl mgr_20" style="margin-right: 10px;">결재선</h4>
                </div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="row" class="gray-background centered-text sign">
                                <div style="vertical-align: middle;">
                                    결재
                                </div>
                            </th>
                            <th class="white-background">
                                <table id="결재선" class="table table-bordered">
                                    <thead>
                                    <tr style="height: 20px;">
                                        <td class="team name" scope="row">
                                            <span class="stamp-step-num">사원</span>
                                        </td>
                                        <td class="team name" scope="row">
                                            <span class="stamp-step-num">부원장</span>
                                        </td>
                                        <td class="team name" scope="row">
                                            <span class="stamp-step-num">관리자</span>
                                        </td>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="stamp">
                                            <img src="/img/img.png">
                                        </td>
                                        <td class="stamp">
                                            <div id="modal">
                                                <button type="button" class="btn btn-block btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#selectForm">
                                                    결재
                                                </button>
                                            </div>
                                        </td>
                                        <td class="stamp">
                                            <div id="modal1">
                                                <button type="button" class="btn btn-block btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#selectForm">
                                                    결재
                                                </button>
                                            </div>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>김엘모</td>
                                        <td class="name gt-position-relative">
                                            <span class="stamp-step-num"></span>대표이사
                                        </td>
                                        <td class="name gt-position-relative">
                                            <span class="stamp-step-num"></span>대표이사
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </th>
                        </tr>
                    </thead>
                </table>
            </div>
            <div class='book-header'>

                <div class="input-group mb-3">
                    <span class="board-title">제목</span>
                </div>
                <div class="input-group mb-3">
                    <div class="board-content">
                        내용내용
                    </div>
                </div>

            </div>
        </section>
        <!-- /.content -->
    </div>
    <%@include file="selectList.jsp"%>
    <!-- /.content-wrapper -->
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
<!-- 결재 승인/반려 모달-->
<div class="modal" id="selectForm">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">결재</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <!-- <form id="f_board" method="get" action="./boardInsert"> -->
                <form id="f_board" method="post" enctype="multipart/form-data" action="./boardInsert">
                    <div class="form-floating mb-3 mt-3">
                        <input type="radio" value="accept" checked>승인
                        <input type="radio" value="reject">반려
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="boardInsert()"  value="선택">
                <input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="닫기">
            </div>
        </div>
    </div>
</div>
</body>
</html>

