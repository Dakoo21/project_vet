<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>
<%@ page import="com.util.BSPageBar" %>
<%
    List<Map<String, Object>> paymentList = (List) request.getAttribute("paymentList");
    int size = 0;
    if (paymentList != null) {
        size = paymentList.size();
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
    <title>진료 기록</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <script>
        const searchEnter = () => {
            if (window.event.keyCode == 13) {
                paymentSearch();
            }
        }

        function paymentSearch() {
            console.log("검색 버튼 작동");
            var gubun = document.querySelector("#gubun").value;
            var keyword = document.querySelector("#keyword").value;
            location.href = "/payment2/paymentList2?gubun="+gubun+"&keyword="+keyword;
            document.querySelector("#gubun").value = "분류선택";
            document.querySelector("#keyword").value = "";
        }

        function paymentTotalList() {
            location.href = "/payment2/paymentList2";
        }

        function unPaid() {
            location.href = "/payment2/paymentList2?gubun=COMMON_CODE_NM&keyword=미수납";
        }

        function paid() {
            location.href = "/payment2/paymentList2?gubun=COMMON_CODE_NM1&keyword=수납완료";
        }

        const DIAGDetail = (BOOKING_PK) => {
          console.log("진료 기록 조회 요청");
          location.href = "/payment2/DIAGDetail?BOOKING_PK=" + BOOKING_PK;
        }

        const paymentDetail = () => {
          console.log("결제 상세 페이지 요청")
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
                        <h1>진료 기록 조회</h1>
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
                                    <option value="ANIMAL_NM">동물</option>
                                    <option value="MASTER_NM">보호자</option>
                                </select>
                            </div>
                            <div class="col-6">
                                <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                                       aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>
                            </div>
                            <div class="col-3">
                                <button id="btn_search" class="btn btn-danger" onClick="paymentSearch()">검색</button>
                            </div>
                        </div>
                    </h3>

                    <div class="card-tools">
                        <ul class="nav nav-pills ml-auto">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" onclick="paymentTotalList()">전체조회</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" onclick="unPaid()">미수납</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" onclick="paid()">수납완료</a>
                            </li>
                        </ul>
                    </div>
                </div><!-- /.card-header -->
                <div class="card-body" >
                    <div class="tab-content p-0">
                        <!-- Morris chart - Sales -->
                        <div class="chart tab-pane active" id="select-all" style="position: relative; height: 700px;">
                            <div class ="table">
                                <table class="table table-striped table-bordered table-hover dt-responsive">
                                    <thead>
                                    <tr>
                                        <th>진료 번호</th>
                                        <th>동물</th>
                                        <th>보호자</th>
                                        <th>수납 금액</th>
                                        <th>수납 상태</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
                                            if(i == size) break;
                                            Map<String, Object> pMap = paymentList.get(i);
                                    %>
                                    <tr onclick="DIAGDetail('<%=pMap.get("BOOKING_PK")%>')">
                                        <td><%=pMap.get("DIAG_PK")%></td>
                                        <td><%=pMap.get("ANIMAL_NM")%></td>
                                        <td><%=pMap.get("MASTER_NM")%></td>
                                        <td><%=pMap.get("DIAG_PRICE")%></td>
                                        <%
                                            if ("미수납".equals(pMap.get("COMMON_CODE_NM"))) {
                                        %>
                                        <td>
                                            <a class="btn btn-info btn-sm" onclick="paymentDetail()">
                                                미수납
                                            </a>
                                        </td>
                                        <%
                                            } else {
                                        %>
                                        <td><%=pMap.get("COMMON_CODE_NM")%></td>
                                        <%
                                            }
                                        %>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                                <div style="display:flex; justify-content:center;">
                                    <ul class="pagination">
                                    <%
                                        String pagePath = "/payment2/paymentList2";
                                        BSPageBar bspb = new BSPageBar(numPerPage,  size, nowPage, pagePath);
                                        out.print(bspb.getPageBar());
                                    %>
                                    </ul>
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
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
</body>
</html>

