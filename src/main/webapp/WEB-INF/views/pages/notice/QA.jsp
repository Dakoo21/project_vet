<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
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
            <h1>
                공지사항
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="container">
                <div class="page-header">
                    <h2>게시판 <small>글상세보기</small></h2>
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
                                        <input type="text" class="form-control"  value="제목">
                                    </div>
                                </div>

                                <div class="input-group mb-3">
                                    <span class="input-group-text">작성자</span>
                                    <div class="col-xs-3">
                                        <input type="text" class="form-control"  value="작성자">
                                    </div>
                                </div>

                                <div class="input-group mb-3">
                                    <div class="col-xs-8">
                                        내용
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <hr/>
                    <div class='detail-link'>
                        <button class="btn btn-info" data-bs-toggle="modal" data-bs-target="#boardUpdateForm">
                            수정
                        </button>
                        &nbsp;
                        <button class="btn btn-warning" onclick="boardDelete()">
                            삭제
                        </button>
                        &nbsp;
                        <button class="btn btn-success" onclick="boardList()">
                            공지목록
                        </button>
                    </div>
                </div>
                <!-- 회원목록   끝  -->
                <hr/>
                <!-- 댓글쓰기 시작  -->
                <div class="card">
                    <form id="f_comment" method="get" action="/board/commentInsert">
                        <input type="hidden" name="b_no" value="글번호" />
                        <input type="hidden" name="bc_writer" value="나신입" />
                        <div class="card-body"><textarea class="form-control" rows="1" name="bc_comment"></textarea></div>
                        <div class="card-footer">
                            <button id="btnAdd" class="btn btn-primary" type="button" onclick="commentInsert()">등록</button>
                        </div>
                    </form>
                </div>
                <!-- 댓글쓰기  끝   -->
                <br />
                <!-- 댓글목록 시작  -->
                <div class="card">
                    <div class="card-header">댓글 리스트</div>
                    <ul id="comment--items" class="list-group">

                        <li class="list-group-item d-flex justify-content-between">
                            <div>댓글</div>
                            <div class="d-flex">
                                <div>댓글 작성자</div>
                                <button class="badge btn btn-danger" onclick="commentDelete()">삭제</button>
                            </div>
                        </li>

                    </ul>
                </div>
                <!-- 댓글목록  끝  -->
            </div>

<%--            <div style="width:58rem;">--%>
<%--                <div class="card-body">--%>
<%--                    <div class='book-detail'>--%>
<%--                        <div class='book-header'>--%>

<%--                            <table>--%>
<%--                                <tr>--%>
<%--                                    <td>제목</td>--%>
<%--                                    <td>--%>
<%--                                        <div style="width: 500px;">--%>
<%--&lt;%&ndash;                                            <%=rmap.get("NOTICE_TITLE")%>&ndash;%&gt;--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>작성자:</td>--%>
<%--                                    <td>--%>
<%--                                        <div class="col-xs-3" style="width: 100px;">--%>
<%--&lt;%&ndash;                                            <%=rmap.get("NOTICE_WRITER")%>&ndash;%&gt;--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>조회수</td>--%>
<%--                                    <td>--%>
<%--                                        <div class="col-xs-3" style="width: 100px;">--%>
<%--&lt;%&ndash;                                            <%=rmap.get("NOTICE_HITS")%>&ndash;%&gt;--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>작성시각</td>--%>
<%--                                    <td>--%>
<%--                                        <div class="col-xs-3" style="width: 100px;">--%>
<%--&lt;%&ndash;                                            <%=rmap.get("NOTICE_TIME")%>&ndash;%&gt;--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>첨부파일</td>--%>
<%--                                    <td>--%>
<%--                                        <div class="col-xs-3" style="width: 100px;">--%>
<%--&lt;%&ndash;                                            <%=rmap.get("ATTACHED_PK")%>&ndash;%&gt;--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                </tr>--%>
<%--                            </table>--%>


<%--                            <hr/>--%>
<%--                            <div class="input-group mb-3" style="width: 200px">--%>
<%--                                <div class="col-xs-8">--%>
<%--&lt;%&ndash;                                    <%=rmap.get("NOTICE_CONTENT")%>&ndash;%&gt;--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <hr/>--%>
<%--                <div class='detail-link'>--%>
<%--                    <button class="btn btn-info" onclick="openUpdateModal()">--%>
<%--                        수정--%>
<%--                    </button>--%>
<%--                    &nbsp;--%>
<%--                    <button class="btn btn-warning" onclick="noticeDelete()">--%>
<%--                        삭제--%>
<%--                    </button>--%>
<%--                    &nbsp;--%>
<%--                    <button class="btn btn-success" onclick="noticeList()">--%>
<%--                        공지목록--%>
<%--                    </button>--%>
<%--                </div>--%>
<%--            </div>--%>

        </section>
        <!-- /.content -->
    </div>
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