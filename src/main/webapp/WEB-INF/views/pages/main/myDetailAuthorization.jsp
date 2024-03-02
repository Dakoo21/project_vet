<%--
  Created by IntelliJ IDEA.
  User: janghwan
  Date: 2/28/24
  Time: 2:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<%@ include file="/include/session.jsp"%>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>내 정보</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <%@ include file="/include/common/quill_common.jsp"%>
    <style>
        .table-bordered th,
        .table-bordered td {
            padding: 5px;
        }
        .content-wrapper {
            margin-top: 20px; /* 상단 여백 추가 */
        }
        .card {
            margin-top: 250px; /* 카드 위쪽 여백 추가 */
            margin-right: 200px;
        }
    </style>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <%@ include file="/include/sidebar.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <!-- Main content -->
    <section class="content">
        <!--여기 -->
        <div class="container-fluid content-wrapper"> <!-- content-wrapper 클래스 추가 -->
            <div class="row justify-content-center"> <!-- 중앙 정렬 클래스 추가 -->
                <div class="col-md-6"> <!-- 가로 폭을 조정 -->
                    <div class="card">
                        <div class="card-body">
                            <!-- /.card -->
                            <div class="tab-pane" id="settings">
                                <form id="passwordCheck" action="/passwordCheckOut" method="post" class="form-horizontal">
                                    <div class="form-group row">
                                            <input type="hidden" id="MEMBER_ID" name="MEMBER_ID" value="<%=username%>">
                                        <label for="MEMBER_PW" class="col-sm-4 col-form-label">비밀번호:</label> <!-- 왼쪽 여백 -->
                                        <div class="col-sm-8">
                                            <input type="password" class="form-control" id="MEMBER_PW" name="MEMBER_PW" placeholder="비밀번호를 입력하세요">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer" style="text-align: right;">
                            <button type="button" class="btn btn-primary" onclick="passcheck()">확인</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /.content -->
    <!-- /.content-wrapper -->
    <!-- Summernote -->
    <script src="/plugins/summernote/summernote-bs4.min.js"></script>
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
<!-- CodeMirror -->
<script src="/plugins/codemirror/codemirror.js"></script>
<script src="/plugins/codemirror/mode/css/css.js"></script>
<script src="/plugins/codemirror/mode/xml/xml.js"></script>
<script src="/plugins/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<script>
    const passcheck = (event) => {
      document.querySelector("#passwordCheck").submit();
    }
</script>
</body>
</html>
