

<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--    <%--%>
<%--    List<Map<String,Object>> nVO = (List)request.getAttribute("nList");--%>
<%--    int size = 0;--%>
<%--    Map<String,Object> rmap = new HashMap<>();--%>
<%--    if(nVO !=null){--%>
<%--        rmap = nVO.get(0);//상세보기 내용들 담김--%>

<%--    }//end of 게시글 상세 내용 가져오기--%>
<%--%>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
    <%@ include file="/include/bootCommon.jsp"%>
<%--    <script type="text/javascript">--%>
<%--        const noticeList = () => {--%>
<%--            //HandlerMapping - url키값 - 메소드 이름--%>
<%--            location.href="./noticeList";--%>
<%--        }--%>
<%--        function noticeDelete(noticePK) {--%>
<%--            // 확인을 받은 후에 폼을 서버로 제출--%>
<%--            if (confirm("정말로 삭제하시겠습니까?")) {--%>
<%--                // 삭제를 확인하면 폼을 서버로 제출--%>
<%--                var form = document.createElement("form");--%>
<%--                form.setAttribute("method", "post");--%>
<%--                form.setAttribute("action", "./noticeDelete?noticePK="+<%=rmap.get("NOTICE_PK")%>);--%>

<%--                var input = document.createElement("input");--%>
<%--                input.setAttribute("type", "hidden");--%>
<%--                input.setAttribute("name", "noticePK");--%>
<%--                input.setAttribute("value", noticePK);--%>
<%--                form.appendChild(input);--%>

<%--                document.body.appendChild(form);--%>
<%--                form.submit();--%>
<%--            }--%>

<%--        }--%>
<%--        function openUpdateModal() {--%>
<%--            $('#boardUpdateForm').modal('show');--%>
<%--        }--%>
<%--        function noticeUpdate() {--%>
<%--            // 폼 가져오기--%>
<%--            var form = document.getElementById("f_board");--%>
<%--            var formData = new FormData(form);--%>

<%--            // 폼 데이터 콘솔에 출력--%>
<%--            for (var pair of formData.entries()) {--%>
<%--                console.log(pair[0] + ': ' + pair[1]);--%>
<%--            }--%>

<%--            // 폼 서버로 제출--%>
<%--            form.submit();--%>
<%--        }--%>

<%--    </script>--%>
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
<%--                <small><%=rmap.get("COMMON_CODE_PK")%></small>--%>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div style="width:58rem;">
                <div class="card-body">
                    <div class='book-detail'>
                        <div class='book-header'>

                            <table>
                                <tr>
                                    <td>제목</td>
                                    <td>
                                        <div style="width: 500px;">
<%--                                            <%=rmap.get("NOTICE_TITLE")%>--%>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>작성자:</td>
                                    <td>
                                        <div class="col-xs-3" style="width: 100px;">
<%--                                            <%=rmap.get("NOTICE_WRITER")%>--%>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>조회수</td>
                                    <td>
                                        <div class="col-xs-3" style="width: 100px;">
<%--                                            <%=rmap.get("NOTICE_HITS")%>--%>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>작성시각</td>
                                    <td>
                                        <div class="col-xs-3" style="width: 100px;">
<%--                                            <%=rmap.get("NOTICE_TIME")%>--%>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>첨부파일</td>
                                    <td>
                                        <div class="col-xs-3" style="width: 100px;">
<%--                                            <%=rmap.get("ATTACHED_PK")%>--%>
                                        </div>
                                    </td>
                                </tr>
                            </table>


                            <hr/>
                            <div class="input-group mb-3" style="width: 200px">
                                <div class="col-xs-8">
<%--                                    <%=rmap.get("NOTICE_CONTENT")%>--%>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <hr/>
                <div class='detail-link'>
                    <button class="btn btn-info" onclick="openUpdateModal()">
                        수정
                    </button>
                    &nbsp;
                    <button class="btn btn-warning" onclick="noticeDelete()">
                        삭제
                    </button>
                    &nbsp;
                    <button class="btn btn-success" onclick="noticeList()">
                        공지목록
                    </button>
                </div>
            </div>

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