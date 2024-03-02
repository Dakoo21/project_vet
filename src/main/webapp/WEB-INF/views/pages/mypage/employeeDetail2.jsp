<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>
<%@ page import="com.example.vet.model.Member" %>
<%
    int size = 0;
    List<Member> employList = (List<Member>) request.getAttribute("employList");
    if (employList != null) {
        size = employList.size();

    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>사원 관리</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <script>
        //화면을  리액트로 사용해 보는 것만으로 자바스크립트 복습 및 최신 문법을 공부할 수 있음
        function searchEnter(){
            console.log('searchEnter')
            console.log(window.event.keyCode);//13
            if(window.event.keyCode == 13){
                employeeSearch();
            }
        }//end of searchEnter

        function employeeSearch(){
            console.log('boardSearch');
            const gubun = document.querySelector("#gubun").value;
            const keyword = document.querySelector("#keyword").value;
            console.log(`${gubun} , ${keyword}`);
            location.href="/employeeList?gubun="+gubun+"&keyword="+keyword;
            document.querySelector("#gubun").value = '분류선택';
            document.querySelector("#keyword").value = '';
        }

        const employeeDetailPage = () => {

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
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>사원 정보</h1>
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
                                    <option value="MEMBER_MEMBERNAME">사원 이름</option>
                                    <option value="MEMBER_PK">사원 번호</option>
                                </select>
                            </div>
                            <div class="col-6">
                                <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                                       aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>
                            </div>
                            <div class="col-3">
                                <button id="btn_search" class="btn btn-danger" onclick="employeeSearch()">검색</button>
                            </div>
                        </div>
                    </h3>

                    <div class="card-tools">
                        <ul class="nav nav-pills ml-auto">
                            <li class="nav-item">
                                <a class="nav-link active" href="#select-all" data-toggle="tab">전체조회</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#select-admin" data-toggle="tab">관리자</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#select-nurse" data-toggle="tab">간호사</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#select-info" data-toggle="tab">데스크</a>
                            </li>
                        </ul>
                    </div>
                </div><!-- /.card-header -->
                    <div class="card-body">
                        <div class="tab-content p-0">
                            <!-- Morris chart - Sales -->
                            <div class="chart tab-pane active" id="select-all" style="position: relative; height: 800px;">
                                <div class ="table">
                                    <table class="table table-striped table-bordered table-hover dt-responsive">
                                        <thead>
                                        <tr>
                                            <th>사원 번호</th>
                                            <th>사원 이름</th>
                                            <th>사원 권한</th>
                                            <th>사원 메일</th>
                                            <th>사원 연락처</th>
                                            <%-- <th>문서 구분</th> --%>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%--
                                            데이터 받아와서 for 문 돌려야됨
                                        --%>
                                        <%
                                            for (Member member : employList) {
                                                if ("ROLE_ADMIN".equals(member.getMEMBER_ROLE()) || "ROLE_MASTER".equals(member.getMEMBER_ROLE()) || "ROLE_NURSE".equals(member.getMEMBER_ROLE()) || "ROLE_INFO".equals(member.getMEMBER_ROLE()) || "ROLE_USER".equals(member.getMEMBER_ROLE())) {
                                                    int i = 0;
                                                    int num = i + 1;
                                                    String member_name = member.getMEMBER_MEMBERNAME();
                                                    String member_role = member.getMEMBER_ROLE();
                                                    String member_email = member.getMEMBER_EMAIL();
                                                    String member_phone = member.getMEMBER_PHONE();
                                                    Integer member_pk = member.getMEMBER_PK();
                                        %>
                                        <tr onclick="employDetailPage('<%=member_pk%>')" style="cursor: hand">
                                            <td><%=member_pk%></td>
                                            <td><%=member_name%></td>
                                            <td>
                                                <%
                                                    String user_role = null;
                                                    if (member_role.equals("ROLE_ADMIN")) {
                                                        user_role = "관리자";
                                                    } else if (member_role.equals("ROLE_MASTER")) {
                                                        user_role = "부관리자";
                                                    } else if (member_role.equals("ROLE_NURSE")) {
                                                        user_role = "간호사";
                                                    } else if (member_role.equals("ROLE_INFO")) {
                                                        user_role = "데스크";
                                                    } else {
                                                        user_role = "일반 사용자";
                                                    }
                                                %>
                                                <%=user_role%>
                                            </td>
                                            <td><%=member_email%></td>
                                            <td><%=member_phone%></td>
                                            <%--<td></td>--%>
                                        </tr>
                                        <%
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

                            <div class="chart tab-pane" id="select-admin" style="position: relative; height: 800px;">
                                <div class ="table">
                                    <table class="table table-striped table-bordered table-hover dt-responsive">
                                        <thead>
                                        <tr>
                                            <th>사원 번호</th>
                                            <th>사원 이름</th>
                                            <th>사원 권한</th>
                                            <th>사원 메일</th>
                                            <th>사원 연락처</th>
                                            <%-- <th>문서 구분</th> --%>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%--
                                            데이터 받아와서 for 문 돌려야됨
                                        --%>
                                        <%
                                            for (Member member : employList) {
                                                if ("ROLE_ADMIN".equals(member.getMEMBER_ROLE()) || "ROLE_MASTER".equals(member.getMEMBER_ROLE())) {
                                                    String member_name = member.getMEMBER_MEMBERNAME();
                                                    String member_role = member.getMEMBER_ROLE();
                                                    String member_email = member.getMEMBER_EMAIL();
                                                    String member_phone = member.getMEMBER_PHONE();
                                                    Integer member_pk = member.getMEMBER_PK();
                                        %>
                                        <tr>
                                            <td><%=member_pk%></td>
                                            <td><%=member_name%></td>
                                            <td>
                                                <%
                                                    String user_role = null;
                                                    if (member_role.equals("ROLE_ADMIN")) {
                                                        user_role = "관리자";
                                                    } else if (member_role.equals("ROLE_MASTER")) {
                                                        user_role = "부관리자";
                                                    } else if (member_role.equals("ROLE_NURSE")) {
                                                        user_role = "간호사";
                                                    } else if (member_role.equals("ROLE_INFO")) {
                                                        user_role = "데스크";
                                                    } else {
                                                        user_role = "일반 사용자";
                                                    }
                                                %>
                                                <%=user_role%>
                                            </td>
                                            <td><%=member_email%></td>
                                            <td><%=member_phone%></td>
                                            <%--<td></td>--%>
                                        </tr>
                                        <%
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
                            <div class="chart tab-pane" id="select-nurse" style="position: relative; height: 800px;">
                                <div class ="table">
                                    <table class="table table-striped table-bordered table-hover dt-responsive">
                                        <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>사원 이름</th>
                                            <th>사원 권한</th>
                                            <th>사원 메일</th>
                                            <th>사원 연락처</th>
                                            <%-- <th>문서 구분</th> --%>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%--
                                            데이터 받아와서 for 문 돌려야됨
                                        --%>
                                        <%
                                            for (Member member : employList) {
                                                if ("ROLE_NURSE".equals(member.getMEMBER_ROLE())) {
                                                int i = 0;
                                                int num = i + 1;
                                                String member_name = member.getMEMBER_MEMBERNAME();
                                                String member_role = member.getMEMBER_ROLE();
                                                String member_email = member.getMEMBER_EMAIL();
                                                String member_phone = member.getMEMBER_PHONE();
                                        %>
                                        <tr>
                                            <td><%=num%></td>
                                            <td><%=member_name%></td>
                                            <td>
                                                <%
                                                    String user_role = null;
                                                    if (member_role.equals("ROLE_ADMIN")) {
                                                        user_role = "관리자";
                                                    } else if (member_role.equals("ROLE_MASTER")) {
                                                        user_role = "부관리자";
                                                    } else if (member_role.equals("ROLE_NURSE")) {
                                                        user_role = "간호사";
                                                    } else if (member_role.equals("ROLE_INFO")) {
                                                        user_role = "데스크";
                                                    } else {
                                                        user_role = "일반 사용자";
                                                    }
                                                %>
                                                <%=user_role%>
                                            </td>
                                            <td><%=member_email%></td>
                                            <td><%=member_phone%></td>
                                            <%--<td></td>--%>
                                        </tr>
                                        <%
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
                            <div class="chart tab-pane" id="select-info" style="position: relative; height: 800px;">
                                <div class ="table">
                                    <table class="table table-striped table-bordered table-hover dt-responsive">
                                        <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>사원 이름</th>
                                            <th>사원 권한</th>
                                            <th>사원 메일</th>
                                            <th>사원 연락처</th>
                                            <%-- <th>문서 구분</th> --%>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%--
                                            데이터 받아와서 for 문 돌려야됨
                                        --%>
                                        <%
                                            for (Member member : employList) {
                                                if ("ROLE_INFO".equals(member.getMEMBER_ROLE())) {
                                                    int i = 0;
                                                    int num = i + 1;
                                                    String member_name = member.getMEMBER_MEMBERNAME();
                                                    String member_role = member.getMEMBER_ROLE();
                                                    String member_email = member.getMEMBER_EMAIL();
                                                    String member_phone = member.getMEMBER_PHONE();
                                        %>
                                        <tr>
                                            <td><%=num%></td>
                                            <td><%=member_name%></td>
                                            <td>
                                                <%
                                                    String user_role = null;
                                                    if (member_role.equals("ROLE_ADMIN")) {
                                                        user_role = "관리자";
                                                    } else if (member_role.equals("ROLE_MASTER")) {
                                                        user_role = "부관리자";
                                                    } else if (member_role.equals("ROLE_NURSE")) {
                                                        user_role = "간호사";
                                                    } else if (member_role.equals("ROLE_INFO")) {
                                                        user_role = "데스크";
                                                    } else {
                                                        user_role = "일반 사용자";
                                                    }
                                                %>
                                                <%=user_role%>
                                            </td>
                                            <td><%=member_email%></td>
                                            <td><%=member_phone%></td>
                                            <%--<td></td>--%>
                                        </tr>
                                        <%
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
                        </div><!-- /.card-body -->
                    </div>
            </div>
            <!-- /.card -->
        </section>
        <!-- /.content -->
        <div class="col-3">
            <button id="btn_insert" class="btn btn-danger" onClick="location.href='/eSignDraft/draftInsertPage'">등록</button>
        </div>
    </div>
    <!-- /.content-wrapper -->
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
</body>
</html>

