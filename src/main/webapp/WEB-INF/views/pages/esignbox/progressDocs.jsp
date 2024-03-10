<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vet.model.Sign" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.vet.model.SignTotal" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.util.BSPageBar" %>
<%
    int size = 0;
    List<SignTotal> docList = null;
    docList = (List<SignTotal>) request.getAttribute("progressList");
    if (docList != null) {
        size = docList.size();
    }
    int numPerPage = 8;
    int nowPage = 0;
    if(request.getParameter("nowPage")!=null){
        nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }

%>
<script>
    function signOneDetail (SIGN_PK) {
        console.log("기안서 디테일")
        location.href = "/eSignDraft/eSignDetail?SIGN_PK="+SIGN_PK;
    }
</script>
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
                        <h1>진행중인문서</h1>
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
                                    <option value="esign_title">제목</option>
                                    <option value="esign_writer">기안자</option>
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
                                <a class="nav-link" href="#select-pending" data-toggle="tab">대기</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#select-scheduled" data-toggle="tab">예정</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#select-progress" data-toggle="tab">진행</a>
                            </li>
                        </ul>
                    </div>
                </div><!-- /.card-header -->
                <div class="card-body" >
                    <div class="tab-content p-0">
                        <!-- Morris chart - Sales -->
                        <div class="chart tab-pane active" id="select-all" style="position: relative; height: 500px;">
                            <div class ="table">
                                <table class="table table-striped table-bordered table-hover dt-responsive">
                                    <thead>
                                    <tr>
                                        <th>문서번호</th>
                                        <th>문서 제목</th>
                                        <th>결재 기안일</th>
                                        <th>결재 상태</th>
                                        <th>문서 구분</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
                                            if(i == size) break;
                                            SignTotal signTotal = docList.get(i);
                                            String docState = null;
                                            if(signTotal.getSIGN_STATE() != -1 && signTotal.getSIGN_STATE() != 0){
                                            if(signTotal.getSIGN_STATE()==1){
                                                if(role1.equals("ROLE_MASTER")){
                                                    docState = "대기";
                                                }else if(role1.equals("ROLE_ADMIN")){
                                                    docState = "예정";
                                                }
                                            }else if(signTotal.getSIGN_STATE()==2){
                                                if(role1.equals("ROLE_MASTER")){
                                                    docState = "진행";
                                                }else if(role1.equals("ROLE_ADMIN")){
                                                    docState = "대기";
                                                }
                                            }else if(signTotal.getSIGN_STATE()==3){
                                                docState = "결재완료";
                                            }
                                            int docNo = signTotal.getSIGN_PK();
                                            String docTitle = signTotal.getSIGN_TITLE();
                                            String docDate = signTotal.getSIGN_DATE();
                                            String docType = signTotal.getSIGN_DOCTYPE();
                                    %>
                                    <tr onclick="signOneDetail('<%=signTotal.getSIGN_PK()%>')">
                                        <td><%=docNo%></td>
                                        <td><%=docTitle%></td>
                                        <td><%=docDate%></td>
                                        <td><%=docState%></td>
                                        <td><%=docType%></td>
                                    </tr>
                                    <%
                                            }
                                        }
                                    %>
                                    </tbody>
                                </table>
                                <div style="display:flex; justify-content:center;">
                                    <ul class="pagination">
                                        <%
                                            String pagePath = "/eSign/progressDocs";
                                            BSPageBar bspb = new BSPageBar(numPerPage,  size, nowPage, pagePath);
                                            out.print(bspb.getPageBar());
                                        %>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="chart tab-pane" id="select-pending" style="position: relative; height: 700px;">
                            <div class ="table">
                                <table class="table table-striped table-bordered table-hover dt-responsive">
                                    <thead>
                                    <tr>
                                        <th>문서번호</th>
                                        <th>문서 제목</th>
                                        <th>결재 기안일</th>
                                        <th>결재 상태</th>
                                        <th>문서 구분</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        if(role1.equals("ROLE_MASTER")){
                                            for (SignTotal doc : docList) {
                                                if(doc.getSIGN_STATE()==1) {
                                                    int docNo = doc.getSIGN_PK();
                                                    String docTitle = doc.getSIGN_TITLE();
                                                    // String docContent = doc.getSign_content();
                                                    // int signpk = doc.getSign_pk();
                                                    String docDate = doc.getSIGN_DATE();
                                                    String docState = "대기";
                                                    String docType = doc.getSIGN_DOCTYPE();

                                    %>
                                    <tr onclick="signOneDetail('<%=doc.getSIGN_PK()%>')">
                                        <td><%=docNo%></td>
                                        <td><%=docTitle%></td>
                                        <td><%=docDate%></td>
                                        <td><%=docState%></td>
                                        <td><%=docType%></td>
                                    </tr>
                                    <%
                                                }
                                            }
                                        }
                                    %>
                                    <%
                                        if(role1.equals("ROLE_ADMIN")){
                                            for (SignTotal doc : docList) {
                                                if(doc.getSIGN_STATE()==2) {
                                                    int docNo = doc.getSIGN_PK();
                                                    String docTitle = doc.getSIGN_TITLE();
                                                    // String docContent = doc.getSign_content();
                                                    // int signpk = doc.getSign_pk();
                                                    String docDate = doc.getSIGN_DATE();
                                                    String docState = "대기";
                                                    String docType = doc.getSIGN_DOCTYPE();

                                    %>
                                    <tr onclick="signOneDetail('<%=doc.getSIGN_PK()%>')">
                                        <td><%=docNo%></td>
                                        <td><%=docTitle%></td>
                                        <td><%=docDate%></td>
                                        <td><%=docState%></td>
                                        <td><%=docType%></td>
                                    </tr>
                                    <%
                                                }
                                            }
                                        }
                                    %>
                                    </tbody>
                                </table>
                                <div style="display:flex; justify-content:center;">
                                    <ul class="pagination">

                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="chart tab-pane" id="select-scheduled" style="position: relative; height: 700px;">
                            <div class ="table">
                                <table class="table table-striped table-bordered table-hover dt-responsive">
                                    <thead>
                                    <tr>
                                        <th>문서번호</th>
                                        <th>문서 제목</th>
                                        <th>결재 기안일</th>
                                        <th>결재 상태</th>
                                        <th>문서 구분</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        if(role1.equals("ROLE_ADMIN")) {
                                            for (SignTotal doc : docList) {
                                                if(doc.getSIGN_STATE()==1){
                                                    int docNo = doc.getSIGN_PK();
                                                    String docTitle = doc.getSIGN_TITLE();
                                                    // String docContent = doc.getSign_content();
                                                    // int signpk = doc.getSign_pk();
                                                    String docDate = doc.getSIGN_DATE();
                                                    String docState = "예정";
                                                    String docType = doc.getSIGN_DOCTYPE();
                                    %>
                                    <tr onclick="signOneDetail('<%=doc.getSIGN_PK()%>')">
                                        <td><%=docNo%></td>
                                        <td><%=docTitle%></td>
                                        <td><%=docDate%></td>
                                        <td><%=docState%></td>
                                        <td><%=docType%></td>
                                    </tr>
                                    <%
                                                }
                                            }
                                        }
                                    %>
                                    <%
                                        if(role1.equals("ROLE_MASTER")) {
                                            for (SignTotal doc : docList) {
                                                if(doc.getSIGN_STATE()==0){
                                                    int docNo = doc.getSIGN_PK();
                                                    String docTitle = doc.getSIGN_TITLE();
                                                    // String docContent = doc.getSign_content();
                                                    // int signpk = doc.getSign_pk();
                                                    String docDate = doc.getSIGN_DATE();
                                                    String docState = "예정";
                                                    String docType = doc.getSIGN_DOCTYPE();
                                    %>
                                    <tr onclick="signOneDetail('<%=doc.getSIGN_PK()%>')">
                                        <td><%=docNo%></td>
                                        <td><%=docTitle%></td>
                                        <td><%=docDate%></td>
                                        <td><%=docState%></td>
                                        <td><%=docType%></td>
                                    </tr>
                                    <%
                                                }
                                            }
                                        }
                                    %>
                                    </tbody>
                                </table>
                                <div style="display:flex; justify-content:center;">
                                    <ul class="pagination"></ul>
                                </div>
                            </div>
                        </div>
                        <div class="chart tab-pane" id="select-progress" style="position: relative; height: 700px;">
                            <div class ="table">
                                <table class="table table-striped table-bordered table-hover dt-responsive">
                                    <thead>
                                    <tr>
                                        <th>문서번호</th>
                                        <th>문서 제목</th>
                                        <th>결재 기안일</th>
                                        <th>결재 상태</th>
                                        <th>문서 구분</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        if(role1.equals("ROLE_MASTER")){
                                            for (SignTotal doc : docList) {
                                                if(doc.getSIGN_STATE()==2){
                                                    int docNo = doc.getSIGN_PK();
                                                    String docTitle = doc.getSIGN_TITLE();
                                                    // String docContent = doc.getSign_content();
                                                    // int signpk = doc.getSign_pk();
                                                    String docDate = doc.getSIGN_DATE();
                                                    String docState = "진행";
                                                    String docType = doc.getSIGN_DOCTYPE();
                                    %>
                                    <tr onclick="signOneDetail('<%=doc.getSIGN_PK()%>')">
                                        <td><%=docNo%></td>
                                        <td><%=docTitle%></td>
                                        <td><%=docDate%></td>
                                        <td><%=docState%></td>
                                        <td><%=docType%></td>
                                    </tr>
                                    <%
                                                }
                                            }
                                        }
                                    %>
                                    </tbody>
                                </table>

                                <div style="display:flex; justify-content:center;">
                                    <ul class="pagination"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <%@ include file="/include/footer.jsp"%>
    <!--footer-->

</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
</body>
</html>

