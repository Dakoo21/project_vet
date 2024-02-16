<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <%@include file="/include/common/quill_common.jsp"%>
<%--    <%@include file="/include/common/bootstrap_common.jsp"%>--%>
<%--    <link rel="stylesheet" href="/css/style.css">--%>
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
            <div id="drag_wrap">
                <div id="drag" class="ui-draggable ui-draggable-handle" style="left:0px;"></div>
            </div>
            <div id="contents">
                <form autocomplete="off" onsubmit="return false;">
                    <input type="submit" style="display:none;" onclick="return false;">
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
                    <div class="content_inbox">
                        <div class="cont_box write">
                            <div class="approval-wrap write">
                                <h4 style="display:inline-block">
                                    기본 설정				<a href="javascript:void(0);" class="mgl_20 weakblue hide" id="approvalFormRule" onclick="ApprovalDocument.showApprovalFormRule('');" style="display: none;">사내전자결재규정</a>
                                </h4>
                                <span class="gt-float-right gt-mt-5"></span>
                                <table class="tableType02">
                                    <caption>전자결재 기본 설정</caption>
                                    <colgroup>
                                        <col style="width:12.15%;">
                                        <col style="width:44.94%">
                                        <col style="width:12.15%">
                                        <col style="width:30.76%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row">문서 종류</th>
                                        <td>
                                            <input type="hidden" id="prevApprovalCategoryNo" value="6747">
                                            <select name="approval_form_no" class="write-select" autocomplete="off">
                                                <option value="">선택</option><option value="42768">지출 결의서</option><option value="42769">품의서</option>
                                                <button class="weakblue" onclick="ApprovalDocument.getSelectApprovalForm();">문서보기</button>
                                                <input type="hidden" id="prevApprovalFormNo" value="42771">
                                                <input type="hidden" id="prevApprovalFormTitle" value="">
                                            </select>
                                        </td>
                                        <th scope="row">작성자</th>
                                        <td>
                                            <input type="hidden" name="node_id" value="58503">
                                            <span>김엘모</span>
                                        </td>
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
                                            <a href="javascript:void(0)" class="icon question tipsIcon" style="position: relative;top:4px;margin-left:10px"><span class="blind">세부 설명</span></a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="after">
                                    <h4 class="fl mgr_20">결재선 | 결재선 선택</h4>
                                    <span class="detail_select">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardForm">결재선</button>
		                            </span>
                                </div>
                                <div id="approvalDocumentLine">
                                    <table class="tableType02">
                                        <caption>결재선</caption>
                                        <colgroup>
                                            <col style="width:12.09%;">
                                            <col style="width:87.91%;">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <th scope="row" class="sign">
                                                <div style="height: 162px; display: table-cell; row-span: 3; width: 116px; vertical-align: middle; text-align: center;">
                                                    결재									</div>
                                            </th>
                                            <td class="sign vt" id="approvalFirstLine">
                                                <table style="width:70%;table-layout:fixed"><colgroup><col><col><col><col><col><col><col></colgroup>
                                                    <tbody scope="row">
                                                    <tr>
                                                        <td class="team name" scope="row">
                                                            <span class="stamp-step-num" style="height:60px">관리자</span>
                                                        </td>
                                                        <td class="team name" scope="row">
                                                            <span class="stamp-step-num">관리자</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="stamp">
                                                            <span class="stamp-step-num" style="height:80px;">도장</span>
                                                        </td>
                                                        <td class="stamp">
                                                            <span class="stamp-step-num" style="height:80px;">도장</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="name gt-position-relative">
                                                            <span class="stamp-step-num">1</span>대표이사
                                                        </td>
                                                        <td class="name gt-position-relative">
                                                            <span class="stamp-step-num">1</span>대표이사
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <table class="cal_table1 approve-write js-approval-line">
                                        <colgroup>
                                            <col style="width:12.09%;">
                                            <col style="width:37.62%;">
                                            <col style="width:9.02%;">
                                            <col style="width:41.27%;">
                                        </colgroup>
                                    </table>
                                </div>
                                <div id="textarea" style="height: 80px; width: 65%;">
                                    <div class="form-group">
                                        <label>제목</label>
                                        <input type="text" class="form-control" placeholder="제목을 입력하세요">
                                    </div>
                                    <!-- summernote -->
                                    <div class="col-md-12">
                                        <div class="card card-outline card-info">
                                            <div class="card-header">
                                                <h3 class="card-title">
                                                    Summernote
                                                </h3>
                                            </div>
                                            <!-- /.card-header -->
                                            <div class="card-body">
                                              <textarea id="summernote">
                                                Place <em>some</em> <u>text</u> <strong>here</strong>
                                              </textarea>
                                            </div>
                                            <div class="card-footer">
                                                Visit <a href="https://github.com/summernote/summernote/">Summernote</a> documentation for more examples and information about the plugin.
                                            </div>
                                        </div>
                                    </div><!-- /.summernote -->
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
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
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
                <h4 class="modal-title">게시판</h4>
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
<!-- Summernote -->
<script src="/plugins/summernote/summernote-bs4.min.js"></script>
<!-- CodeMirror -->
<script src="/plugins/codemirror/codemirror.js"></script>
<script src="/plugins/codemirror/mode/css/css.js"></script>
<script src="/plugins/codemirror/mode/xml/xml.js"></script>
<script src="/plugins/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<script>
    $(function () {
        // Summernote
        $('#summernote').summernote()

        // CodeMirror
        CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
            mode: "htmlmixed",
            theme: "monokai"
        });
    })
</script>
</body>
</html>

