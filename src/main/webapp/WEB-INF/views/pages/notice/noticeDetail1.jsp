<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <%@include file="/include/common/bootstrap_common.jsp"%>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <%@ include file="/include/sidebar.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1 class="noto-sans">
                공지사항
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="container">
                <div class="page-header">
                    <h2>게시글 등록</h2>
                    <hr />
                </div>
                <!-- 공지목록 시작 -->
                <div style="width:58rem;">
                    <div class="card-body">
                        <div class='book-detail'>
                            <div class='book-header'>
                                <div class="input-group mb-3">
                                    <span class="input-group-text">제목</span>
                                    <div style="width:500px;">
                                        <input type="text" class="form-control" placeholder="글 제목을 입력해 주세요">
                                    </div>
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-group-text">작성자</span>
                                    <div class="col-xs-3">
                                        <input type="text" class="form-control"  value="<%=username%>">
                                    </div>
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-group-text">내용</span>
                                    <div class="col-xs-8">
                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" cols="80"></textarea>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class='detail-link'>
                        <button class="btn btn-warning" onclick="noticeInsert()">
                            등록
                        </button>
                        &nbsp;
                        <button class="btn btn-success" onclick="noticeList()">
                            공지목록
                        </button>
                    </div>
                </div>
                <!-- 회원목록   끝  -->
                <hr/>
            </div>
        </section>
        <!-- /.content -->
    </div>
        <%@ include file="/include/footer.jsp"%>
</div>
<!-- /.content-wrapper -->
<div class="modal" id="boardUpdateForm">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">공지사항수정</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal">X</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form id="f_board" method="post" action="noticeUpdate?noticePK=">
                    <input type="hidden" name="method" value="noticeUpdate">
                    <input type="hidden" name="noticeHits" value="">
                    <input type="hidden" name="noticeTime" value="">
                    <input type="hidden" name="commonCodePK" value="">
                    <input type="hidden" name="attachedPK" value="">
                    <input type="hidden" name="noticeHighlighted" value="">
                    <div class="form-floating mb-3 mt-3">
                        <input type="text"  class="form-control" id="noticeTitle" name="noticeTitle" placeholder="Enter title"  value=""/>
                        <label>제목</label>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <input type="text"  class="form-control" id="noticeWriter" name="noticeWriter" placeholder="Enter writer"   value=""/>
                        <label>작성자</label>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <textarea rows="5" class="form-control h-25" aria-label="With textarea" id="noticeContent" name="noticeContent"></textarea>
                    </div>
                </form>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <input type="button" class="btn btn-secondary btn-block" data-bs-dismiss="modal" onclick="noticeUpdate()"  value="저장">

                <input type="button" class="btn btn-primary btn-block" data-bs-dismiss="modal" value="닫기">
            </div>

        </div>
    </div>
</div>
<!--footer-->
<%@ include file="/include/bootCommonFoot.jsp"%>
</body>
</html>