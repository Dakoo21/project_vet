<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<%@ include file="/include/session.jsp"%>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>전자결재</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <%@ include file="/include/common/quill_common.jsp"%>
    <%--<%@include file="/include/common/bootstrap_common.jsp"%>--%>
    <%--<link rel="stylesheet" href="/css/style.css">--%>
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
                        <h1>기안서 작성</h1>
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
            <div class="card-body">
                <div class="content_title">
                    <fieldset style="max-width:90%;">
                            <span class="detail_select">
			                    <a href="">기안하기</a>
		                    </span>
                        <span class="detail_select">
			                    <a href="">임시저장</a>
		                    </span>
                    </fieldset>
                </div>
                <table class="table table-bordered">
                    <tr>
                        <th>문서 종류</th>
                        <td>
                            <input type="hidden" id="prevApprovalCategoryNo" value="6747">
                            <select name="approval_form_no" class="write-select" autocomplete="off">
                                <option value="">선택</option><option value="42768">지출 결의서</option><option value="42769">품의서</option><option value="42770">입양신청서</option>
                                <button class="weakblue" onclick="ApprovalDocument.getSelectApprovalForm();">문서보기</button>
                                <input type="hidden" id="prevApprovalFormNo" value="42771">
                                <input type="hidden" id="prevApprovalFormTitle" value="">
                            </select>
                        </td>
                        <th>작성자</th>
                        <td><%=username%></td>
                    </tr>
                    <tr>
                        <th scope="row">보존 연한</th>
                        <td>
                            <select name="preserved_term" class="fl write-select" id="set_preserved_term_y">
                                <option value="">보존 연한</option>
                                <option value="1">1년</option>
                                <option value="3">3년</option>
                                <option value="5">5년</option>
                                <option value="10">10년</option>
                                <option value="0">영구</option>
                            </select>
                            <span class="fl hide" id="set_preserved_term_n" style="display: none;">년</span>
                        </td>
                    </tr>
                </table>
                <div class="after" style="display: flex; align-items: center;">
                    <h4 class="fl mgr_20" style="margin-right: 10px;">결재선 | </h4>
                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardForm">결재선</button>
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
<%--                                        <div class="after" style="display: flex; align-items: center;">--%>
<%--                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardForm">도장</button>--%>
<%--                                        </div>--%>
                                    </td>
                                    <td class="stamp">
<%--                                        <div class="after" style="display: flex; align-items: center;">--%>
<%--                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardForm">선택</button>--%>
<%--                                        </div>--%>
                                    </td>
                                    <td class="stamp">
<%--                                        <div class="after" style="display: flex; align-items: center;">--%>
<%--                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardForm">도장</button>--%>
<%--                                        </div>--%>
                                    </td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="name gt-position-relative">
                                        <span class="stamp-step-num"><%=username%></span>
                                    </td>
                                    <td class="name gt-position-relative">
                                        <div class="after" style="display: flex; align-items: center;">
                                            <button id="lineselect" type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardForm">선택</button>
                                        </div>
                                    </td>
                                    <td class="name gt-position-relative">
                                        <div class="after" style="display: flex; align-items: center;">
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardForm">선택</button>
                                        </div>
                                    </td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </th>
                    </tr>
                    </thead>
                </table>
                <div id="drag_wrap">
                    <div id="drag" class="ui-draggable ui-draggable-handle" style="left:0px;"></div>
                </div>
                <div id="contents">
                    <form autocomplete="off" onsubmit="return false;">
                        <input type="submit" style="display:none;" onclick="return false;">
                        <div class="content_inbox">
                            <div class="cont_box write">
                                <div class="approval-wrap write">
                                    <div id="approvalDocumentLine">
                                        <%-- 이게 무슨용으로 만든 테이블인지 몰라서 일단 남겨놔요 --%>
                                        <table class="cal_table1 approve-write js-approval-line">
                                            <colgroup>
                                                <col style="width:12.09%;">
                                                <col style="width:37.62%;">
                                                <col style="width:9.02%;">
                                                <col style="width:41.27%;">
                                            </colgroup>
                                        </table>
                                    </div>
                                    <div id="textarea" style="width: 100%;">
                                        <div class="form-group">
                                            <label>제목</label>
                                            <input type="text" class="form-control" placeholder="제목을 입력하세요">
                                        </div>
                                        <div class="col-md-12" style="width: 100%">
                                                <!-- /.card-header -->
                                                <div class="card-body">
                                                  <textarea id="summernote">
                                                    Place <em>some</em> <u>text</u> <strong>here</strong>
                                                  </textarea>
                                                </div>
                                        </div>
                                        <!-- /.col-->
                                        <div id="writein">
                                            <%@include file="write.jsp"%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- Summernote -->
    <script src="/plugins/summernote/summernote-bs4.min.js"></script>
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
<!-- ========================== [[ 게시판 Modal ]] ========================== -->
<div class="modal" id="boardForm">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">결재선 선택</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <!-- <form id="f_board" method="get" action="./boardInsert"> -->
                <form id="f_board" method="post" enctype="multipart/form-data" action="./boardInsert">
                    <input type="hidden" id="b_content" name="b_content">
                    <div class="form-floating mb-3 mt-3">
                        <input type="checkbox" value="master1" checked>관리자
                        <input type="checkbox" value="master2">부관리자
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
<!-- 결재선 선택 모달 -->
<div class="modal" id="selectAdmin">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">결재선 선택</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <!-- <form id="f_board" method="get" action="./boardInsert"> -->
                <form id="lv1_board" method="post" enctype="multipart/form-data" action="./boardInsert">
                    <input type="hidden" id="lv1_content" name="b_content">
                    <div class="form-floating mb-3 mt-3">
                        <input type="checkbox" value="master1" checked>관리자
                        <input type="checkbox" value="master2">부관리자
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
<!-- CodeMirror -->
<script src="/plugins/codemirror/codemirror.js"></script>
<script src="/plugins/codemirror/mode/css/css.js"></script>
<script src="/plugins/codemirror/mode/xml/xml.js"></script>
<script src="/plugins/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<script>
    $(document).ready(function() {
        // Summernote
        $('#summernote').summernote(
        {
            height: 300,
            minHeight: null,
            maxHeight: null,
            focus: true,
            lang: "ko-KR",
            placeholder: '최대 2048자까지 쓸 수 있습니다'
        });

        // CodeMirror
        CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
            mode: "htmlmixed",
            theme: "monokai"
        });
    })
</script>
</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<%@ include file="/include/session.jsp"%>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>전자결재</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <%@ include file="/include/common/quill_common.jsp"%>
    <%--<%@include file="/include/common/bootstrap_common.jsp"%>--%>
    <%--<link rel="stylesheet" href="/css/style.css">--%>
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
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px; /* 모달 최대 너비 설정 */
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
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
                        <h1>기안서 작성</h1>
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
            <div class="card-body">
                <div class="content_title">
                    <fieldset style="max-width:90%;">
                        <span class="detail_select">
                            <a href="">기안하기</a>
                        </span>
                        <span class="detail_select">
                            <a href="">임시저장</a>
                        </span>
                    </fieldset>
                </div>
                <table class="table table-bordered">
                    <tr>
                        <th>문서 종류</th>
                        <td>
                            <input type="hidden" id="prevApprovalCategoryNo" value="6747">
                            <select name="approval_form_no" class="write-select" autocomplete="off">
                                <option value="">선택</option><option value="42768">지출 결의서</option><option value="42769">품의서</option><option value="42770">입양신청서</option>
                                <button class="weakblue" onclick="ApprovalDocument.getSelectApprovalForm();">문서보기</button>
                                <input type="hidden" id="prevApprovalFormNo" value="42771">
                                <input type="hidden" id="prevApprovalFormTitle" value="">
                            </select>
                        </td>
                        <th>작성자</th>
                        <td><%=username%></td>
                    </tr>
                    <tr>
                        <th scope="row">보존 연한</th>
                        <td>
                            <select name="preserved_term" class="fl write-select" id="set_preserved_term_y">
                                <option value="">보존 연한</option>
                                <option value="1">1년</option>
                                <option value="3">3년</option>
                                <option value="5">5년</option>
                                <option value="10">10년</option>
                                <option value="0">영구</option>
                            </select>
                            <span class="fl hide" id="set_preserved_term_n" style="display: none;">년</span>
                        </td>
                    </tr>
                </table>
                <div class="after" style="display: flex; align-items: center;">
                    <h4 class="fl mgr_20" style="margin-right: 10px;">결재선 선택 </h4>
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
<%--                                        <div class="after" style="display: flex; align-items: center;">--%>
<%--                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardForm">도장</button>--%>
<%--                                        </div>--%>
                                    </td>
                                    <td class="stamp">
<%--                                        <div class="after" style="display: flex; align-items: center;">--%>
<%--                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardForm">선택</button>--%>
<%--                                        </div>--%>
                                    </td>
                                    <td class="stamp">
<%--                                        <div class="after" style="display: flex; align-items: center;">--%>
<%--                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardForm">도장</button>--%>
<%--                                        </div>--%>
                                    </td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="name gt-position-relative">
                                        <span class="stamp-step-num"><%=username%></span>
                                    </td>
                                    <td class="name gt-position-relative">
                                        <div class="after" style="display: flex; align-items: center;">
                                            <div id="modal1">
                                                <button id="lineselect_lv2" type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#selectLine">선택</button>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="name gt-position-relative">
                                        <div class="after" style="display: flex; align-items: center;">
                                            <button id="lineselect_lv3" type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardForm">선택</button>
                                        </div>
                                    </td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </th>
                    </tr>
                    </thead>
                </table>
                <div id="drag_wrap">
                    <div id="drag" class="ui-draggable ui-draggable-handle" style="left:0px;"></div>
                </div>
                <div id="contents">
                    <form autocomplete="off" onsubmit="return false;">
                        <input type="submit" style="display:none;" onclick="return false;">
                        <div class="content_inbox">
                            <div class="cont_box write">
                                <div class="approval-wrap write">
                                    <div id="approvalDocumentLine">
                                        <%-- 이게 무슨용으로 만든 테이블인지 몰라서 일단 남겨놔요 --%>
                                        <table class="cal_table1 approve-write js-approval-line">
                                            <colgroup>
                                                <col style="width:12.09%;">
                                                <col style="width:37.62%;">
                                                <col style="width:9.02%;">
                                                <col style="width:41.27%;">
                                            </colgroup>
                                        </table>
                                    </div>
                                    <div id="textarea" style="width: 100%;">
                                        <div class="form-group">
                                            <label>제목</label>
                                            <input type="text" class="form-control" placeholder="제목을 입력하세요">
                                        </div>
                                        <div class="col-md-12" style="width: 100%">
                                            <!-- /.card-header -->
                                            <div class="card-body">
                                                <textarea id="summernote">
                                                    Place <em>some</em> <u>text</u> <strong>here</strong>
                                                </textarea>
                                            </div>
                                        </div>
                                        <!-- /.col-->
                                        <div id="writein">
                                            <%@include file="write.jsp"%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- Summernote -->
    <script src="/plugins/summernote/summernote-bs4.min.js"></script>
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
<!-- ========================== [[ 게시판 Modal ]] ========================== -->
<%--<div class="modal" id="boardForm">--%>
<%--    <div class="modal-dialog modal-dialog-centered">--%>
<%--        <div class="modal-content">--%>
<%--            <!-- Modal Header -->--%>
<%--            <div class="modal-header">--%>
<%--                <h4 class="modal-title">결재선 선택</h4>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>--%>
<%--            </div>--%>
<%--            <!-- Modal body -->--%>
<%--            <div class="modal-body">--%>
<%--                <!-- <form id="f_board" method="get" action="./boardInsert"> -->--%>
<%--                <form id="f_board" method="post" enctype="multipart/form-data" action="./boardInsert">--%>
<%--                    <input type="hidden" id="b_content" name="b_content">--%>
<%--                    <div class="form-floating mb-3 mt-3">--%>
<%--                        <input type="checkbox" value="master1" checked>관리자--%>
<%--                        <input type="checkbox" value="master2">부관리자--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <input type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="boardInsert()"  value="선택">--%>
<%--                <input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="닫기">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<!-- 결재선 선택 모달 -->--%>
<%--<div class="modal" id="selectAdmin">--%>
<%--    <div class="modal-dialog modal-dialog-centered">--%>
<%--        <div class="modal-content">--%>
<%--            <!-- Modal Header -->--%>
<%--            <div class="modal-header">--%>
<%--                <h4 class="modal-title">결재선 선택</h4>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>--%>
<%--            </div>--%>
<%--            <!-- Modal body -->--%>
<%--            <div class="modal-body">--%>
<%--                <!-- <form id="f_board" method="get" action="./boardInsert"> -->--%>
<%--                <form id="lv1_board" method="post" enctype="multipart/form-data" action="./boardInsert">--%>
<%--                    <input type="hidden" id="lv1_content" name="b_content">--%>
<%--                    <div class="form-floating mb-3 mt-3">--%>
<%--                        <input type="checkbox" value="master1" checked>관리자--%>
<%--                        <input type="checkbox" value="master2">부관리자--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <input type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="boardInsert()"  value="선택">--%>
<%--                <input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="닫기">--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- CodeMirror -->
<script src="/plugins/codemirror/codemirror.js"></script>
<script src="/plugins/codemirror/mode/css/css.js"></script>
<script src="/plugins/codemirror/mode/xml/xml.js"></script>
<script src="/plugins/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<script>
    $(document).ready(function() {
        // Summernote
        $('#summernote').summernote(
        {
            height: 300,
            minHeight: null,
            maxHeight: null,
            focus: true,
            lang: "ko-KR",
            placeholder: '최대 2048자까지 쓸 수 있습니다'
        });
        // CodeMirror
        CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
            mode: "htmlmixed",
            theme: "monokai"
        });
    })
</script>
<script>
    // 결재선 LV2 선택 모달
    // 검색 버튼 클릭 시 모달창 열고 데이터 조회
    $(document).ready(function () {
        $("#lineselect_lv2").click(function() {
            // Ajax를 사용하여 서버에 데이터 조회 요청
            $.ajax({
                type: "GET",
                url: "/eSignDraft/selectLine",
                dataType: "json",
                success: function (members) {
                    var form = $("#membersForm");
                    form.empty();
                    members.forEach(function (member) {
                        form.append('<label><input type="radio" name="member" value="' + member.MEMBER_PK + '">' + member.MEMBER_MEMBERNAME + '</label><br>');
                    });
                    $("#myModal").css("display", "block");
                }
            });
        });

        $("#closeModalBtn").click(function () {
            $("#myModal").css("display", "none");
        });

        $("#submitBtn").click(function () {
            // 선택된 멤버 값 가져오기
            var selectedMemberId = $('input[name=member]:checked').val();
            var selectedMemberName = $('input[name=member]:checked').next().text();
            // 선택된 멤버의 값을 사용하여 원하는 동작 수행
            console.log("Selected Member ID: " + selectedMemberId);
            console.log("Selected Member Name: " + selectedMemberName);
            // 모달 창 닫기
            $("#myModal").css("display", "none");
        });
    });
</script>
<script>
    // 결재선 LV3 선택 모달
    // 검색 버튼 클릭 시 모달창 열고 데이터 조회
    $(document).ready(function () {
        $("#lineselect_lv3").click(function() {
            // Ajax를 사용하여 서버에 데이터 조회 요청
            $.ajax({
                type: "GET",
                url: "/eSignDraft/selectLine",
                data: { searchParam: "yourSearchParameter" },  // 필요한 검색 파라미터 전달
                success: function(data) {
                    // 모달창에 받아온 데이터를 표시하는 코드
                    var form = $("#membersForm");
                    form.empty();
                    members.forEach(function (member) {
                        form.append('<label><input type="radio" name="member" ' +
                            '' + 'value="' + member.role + '">' + member.name + '</label><br>');
                    });
                    $("#myModal").css("display", "block");
                }
            });
        });
        $("#closeModalBtn").click(function () {
            $("#myModal").css("display", "none");
        });
    });
</script>
<!-- 모달 창 -->
<%--<div id="selectLine" class="modal">--%>
<%--    <div class="modal-content">--%>
<%--&lt;%&ndash;        <span class="close" id="closeModalBtn">&times;</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <form id="membersForm">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <!-- 멤버 목록을 여기에 추가할 것입니다 -->&ndash;%&gt;--%>
<%--&lt;%&ndash;        </form>&ndash;%&gt;--%>
<%--    </div>--%>
<%--</div>--%>
<%--<button id="openModalBtn">Open Modal</button>--%>
<button id="openModalBtn">Open Modal</button>
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeModalBtn">&times;</span>
        <form id="membersForm">
            <!-- 멤버 목록을 여기에 추가할 것입니다 -->
<%--            <th:block th:each="member : ${members}">--%>
<%--                <label><input type="radio" name="member" th:value="${member.MEMBER_MEMBERNAME}" th:text="${member.MEMBER_MEMBERNAME}"></label><br>--%>
<%--            </th:block>--%>

        </form>
        <button id="submitBtn">Submit</button>
    </div>
</div>
<script>
    $(document).ready(function () {
        $("#openModalBtn").click(function () {
            $.ajax({
                url: "/eSignDraft/selectLine",
                method: "GET",
                success: function (members) {
                    var form = $("#membersForm");
                    form.empty();
                    members.forEach(function (member) {
                        form.append('<label><input type="radio" name="member" value="' + member.id + '">' + member.name + '</label><br>');
                    });
                    $("#myModal").css("display", "block");
                }
            });
        });
        $("#closeModalBtn").click(function () {
            $("#myModal").css("display", "none");
        });
        $("#submitBtn").click(function () {
            // 선택된 멤버 값 가져오기
            var selectedMemberId = $('input[name=member]:checked').val();
            var selectedMemberName = $('input[name=member]:checked').next().text();
            // 선택된 멤버의 값을 사용하여 원하는 동작 수행
            console.log("Selected Member ID: " + selectedMemberId);
            console.log("Selected Member Name: " + selectedMemberName);
            // 모달 창 닫기
            $("#myModal").css("display", "none");
        });
    });
</script>

</body>
</html>
>>>>>>> test2
