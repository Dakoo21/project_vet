<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>
<%@ page import="com.util.BSPageBar" %>
<%
    int size = 0;
    List<Map<String, Object>> employList = (List) request.getAttribute("employList");
    if (employList != null) {
        size = employList.size();
    }
    int numPerPage = 10;
    int nowPage = 0;
    if(request.getParameter("nowPage")!=null){
        nowPage = Integer.parseInt(request.getParameter("nowPage"));
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
            var gubun = document.querySelector("#gubun").value;
            var keyword = document.querySelector("#keyword").value;
            location.href = "/employeeList?gubun="+gubun+"&keyword="+keyword;
            document.querySelector("#gubun").value = "분류선택";
            document.querySelector("#keyword").value = "";
        }

        function totalList() {
            console.log('사원 전체 조회')
            location.href = "/employeeList"
        }

        function adminSearch() {
            location.href = "/employeeList?gubun=MEMBER_ROLE&keyword=ROLE_ADMIN";
        }

        function nurseSearch() {
            location.href = "/employeeList?gubun=MEMBER_ROLE1&keyword=ROLE_NURSE";
        }

        function infoSearch() {
            location.href = "/employeeList?gubun=MEMBER_ROLE2&keyword=ROLE_INFO";
        }

        function employeeOneDetail (member_pk) {
            location.href = "/employeeDetail?MEMBER_PK="+member_pk;
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
                                    <option value="MEMBER_EMAIL">사원 이메일</option>
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
                                <a class="nav-link active" data-toggle="tab" onclick="totalList()">전체조회</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" onclick="adminSearch()">관리자</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" onclick="nurseSearch()">간호사</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" onclick="infoSearch()">데스크</a>
                            </li>
                        </ul>
                    </div>
                </div><!-- /.card-header -->
                    <div class="card-body">
                        <div class="tab-content p-0">
                            <!-- Morris chart - Sales -->
                            <div class="chart tab-pane active" id="select-all" style="position: relative; height: 700px;">
                                <div class ="table">
                                    <table class="table table-striped table-bordered table-hover dt-responsive">
                                        <thead>
                                        <tr>
                                            <th>사원 번호</th>
                                            <th>사원 이름</th>
                                            <th>사원 권한</th>
                                            <th>사원 메일</th>
                                            <th>사원 연락처</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            //스크립틀릿 - 지변이다, 메소드 선언불가, 생성자 선언불가, 실행문
                                            //n건을 조회하는 경우이지만 resultType에는 map이나 vo패턴을 주는게 맞다
                                            //주의사항 - 자동으로 키값을 생성함 - 디폴트가 대문자이다
                                            //myBatis연동시 resultType=map{한행}으로 줌 -> selectList("noticeList", pMap)
                                            for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
                                                if(i == size) break;
                                                Map<String,Object> rmap = employList.get(i);
                                        %>
                                        <tr onclick="employeeOneDetail('<%=rmap.get("MEMBER_PK")%>')">
                                            <td><%=rmap.get("MEMBER_PK")%></td>
                                            <td><%=rmap.get("MEMBER_MEMBERNAME")%></td>
                                            <td>
                                                <%
                                                    String user_role = null;
                                                    if ("ROLE_ADMIN".equals(rmap.get("MEMBER_ROLE"))) {
                                                        user_role = "관리자";
                                                    } else if ("ROLE_MASTER".equals(rmap.get("MEMBER_ROLE"))) {
                                                        user_role = "부관리자";
                                                    } else if ("ROLE_NURSE".equals(rmap.get("MEMBER_ROLE"))) {
                                                        user_role = "간호사";
                                                    } else if ("ROLE_INFO".equals(rmap.get("MEMBER_ROLE"))) {
                                                        user_role = "데스크";
                                                    } else {
                                                        user_role = "임시 사용자";
                                                    }
                                                %>
                                                <%=user_role%>
                                            </td>
                                            <td><%=rmap.get("MEMBER_EMAIL")%></td>
                                            <td><%=rmap.get("MEMBER_PHONE")%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                    <div style="display:flex; justify-content:center;">
                                        <ul class="pagination">
                                            <%
                                                String pagePath = "/employeeList";
                                                BSPageBar bspb = new BSPageBar(numPerPage,  size, nowPage, pagePath);
                                                out.print(bspb.getPageBar());
                                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.card-body -->
                    </div>
            </div>
            <!-- /.card -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
</body>
</html>

