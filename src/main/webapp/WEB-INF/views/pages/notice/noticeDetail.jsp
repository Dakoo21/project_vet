<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>
<%@ page import="com.example.vet.model.Notice" %>
<%@ page import="com.util.BSPageBar" %>
<%
    List<Notice> noticeDetail = (List<Notice>) request.getAttribute("noticeDetail");
    Notice notice = noticeDetail.get(0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <%@include file="/include/common/bootstrap_common.jsp"%>
    <style>
        input[type=text]:disabled {
            background: white;
        }

        .custom-textarea:disabled {
            background: white;
        }

    </style>
    <script>
       const noticeList = (event) => {
         location.href = "/notice";
       }

       const noticeDelete = (event) => {
           location.href = "/noticeDelete?notice_pk="+<%=notice.getNOTICE_PK()%>
       }

       const noticeUpdate = (event) => {
         document.querySelector("#f_board").submit();
       }
    </script>
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
                    <h2>게시글</h2>
                    <hr />
                </div>
                <!-- 공지목록 시작 -->
                <div style="width:58rem;">
                    <div class="card-body">
                        <div class='book-detail'>
                            <div class='book-header'>
                                <form id="noticeInsertForm" action="/noticeInsert" method="post">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">제목</span>
                                        <div style="width:718px;">
                                            <input type="text" id="NOTICE_TITLE" name="NOTICE_TITLE" class="form-control" value="<%=notice.getNOTICE_TITLE()%>" disabled>
                                        </div>
                                    </div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">작성자</span>
                                        <div class="col-xs-3" style="width:705px;">
                                            <input type="text" class="form-control" id="MEMBER_MEMBERNAME" name="MEMBER_MEMBERNAME" value="<%=notice.getMEMBER_MEMBERNAME()%>" disabled>
                                        </div>
                                    </div>
                                    <div class="input-group mb-3">
                                        <span class="input-group-text">내용</span>
                                        <div class="col-xs-8">
                                            <textarea class="form-control custom-textarea" id="NOTICE_CONTENT" name="NOTICE_CONTENT" rows="5" cols="80" disabled><%=notice.getNOTICE_CONTENT()%></textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class="detail-link d-flex justify-content-end">
                    <%
                        if (isAdmin || isMaster) {
                    %>
                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardUpdateForm">
                            수정
                        </button>
                        &nbsp
                        <button class="btn btn-warning mr-2" onclick="noticeDelete()">
                            삭제
                        </button>
                    <%
                        }
                    %>
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
                <h4 class="modal-title">공지사항 수정</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <form id="f_board" method="post" action="/noticeUpdate">
                    <input type="hidden" id="NOTICE_PK" name="NOTICE_PK" value="<%=notice.getNOTICE_PK()%>">
                    <div class="form-floating mb-3 mt-3">
                        <input type="text"  class="form-control" id="NOTICE_TITLE" name="NOTICE_TITLE" placeholder="Enter title"  value="<%=notice.getNOTICE_TITLE()%>"/>
                        <label>제목</label>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <input type="text"  class="form-control" id="MEMBER_MEMBERNAME" name="MEMBER_MEMBERNAME" placeholder="Enter writer"   value="<%=notice.getMEMBER_MEMBERNAME()%>" readonly/>
                        <label>작성자</label>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <textarea rows="5" class="form-control h-25" aria-label="With textarea" id="NOTICE_CONTENT" name="NOTICE_CONTENT"><%=notice.getNOTICE_CONTENT()%></textarea>
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