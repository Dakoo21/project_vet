<%@ page import="java.util.List" %>
<%@ page import="com.example.vet.controller.work.Payment_Controller" %>
<%@ page import="com.example.vet.repository.work.Payment_Repository" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    List<Map<String, Object>> dList = (List)request.getAttribute("dList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>진료 기록 조회</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <script>
        function searchEnter(event) {
            if (event.key === 'Enter') {
                boardSearch();
            }
        }
    </script>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<%@ include file="/include/sidebar.jsp"%>
<div class="wrapper">
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
            <!-- 검색기 시작 -->
            <form id="searchForm" onsubmit="boardSearch(event)">
                <div class="row">
                    <div class="col-3">
                        <select id="gubun" name="gubun" class="form-select" aria-label="분류선택">
                            <option selected="selected">분류선택</option>
                            <option value="masterNm">고객명</option>
                            <option value="animalNm">반려동물명</option>
                        </select>
                    </div>
                    <div class="col-6">
                        <input type="text" id="keyword" name="keyword" class="form-control" placeholder="검색어를 입력하세요"
                               aria-label="검색어를 입력하세요" aria-describedby="btn_search" />
                    </div>
                    <div class="col-3">
                        <button type="submit" id="btn_search" class="btn btn-danger" onclick="boardSearch()">검색</button>
                    </div>
                </div>
            </form>

            <script>
                function boardSearch() {


                    var form = document.getElementById('searchForm');
                    var formData = new FormData(form);

                    // URL로 이동하거나, AJAX를 사용하여 서버로 데이터를 전송할 수 있습니다.
                    // 여기서는 URL로 이동하는 예제를 보여드리겠습니다.
                    var queryString = new URLSearchParams(formData).toString();
                    window.location.href = "localhost:8000/diag/diagList?" + queryString;
                }
            </script>
            <!--카테고리 버튼-->

        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Default box -->
            <div class="card">
                <div class="card-body">
                    <div class="tab-content p-0">
                        <!-- Morris chart - Sales -->
                        <div class="chart tab-pane active" id="select-all"
                             style="position: relative; height: 100%;">
                            <div class="card">
                                <div class="card-header">
                                    <%--<h3 class="card-title">상세기록</h3>--%>

                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body p-0">
                                    <table class="table table-striped projects">
                                        <thead>
                                        <tr>
                                            <th style="width: 13%" class="text-center">
                                                진료번호
                                            </th>
                                            <th style="width: 15%">
                                                예약일시
                                            </th>
                                            <th style="width: 10%">
                                                동물명
                                            </th>
                                            <th style="width: 10%">
                                                축종
                                            </th>
                                            <th style="width: 10%">
                                                보호자
                                            </th>
                                            <th style="width: 15%">
                                                연락처
                                            </th>
                                            <th style="width: 10%" class="text-center">
                                                수납상태
                                            </th>
                                            <th style="width: 13%">
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <% for(int i = 0; i < dList.size(); i++) {
                                            Map<String, Object> rmap = dList.get(i);
                                        %>
                                        <tr>
                                            <td onclick="redirectToLink('<%= rmap.get("diagPk") %>')"><%= rmap.get("diagPk") %></td>
                                            <td onclick="redirectToLink('<%= rmap.get("diagPk") %>')"><%= rmap.get("bookingDate") %></td>
                                            <td onclick="redirectToLink('<%= rmap.get("diagPk") %>')"><%= rmap.get("animalNM") %></td>
                                            <td onclick="redirectToLink('<%= rmap.get("diagPk") %>')"><%= rmap.get("animalSpecies") %></td>
                                            <td onclick="redirectToLink('<%= rmap.get("diagPk") %>')"><%= rmap.get("masterNM") %></td>
                                            <td onclick="redirectToLink('<%= rmap.get("diagPk") %>')"><%= rmap.get("masterPhoneNumber") %></td>
                                            <td onclick="redirectToLink('<%= rmap.get("diagPk") %>')"><%=rmap.get("commonCodeName")%></td>
                                            <td class="project-actions text-right">
                                                <a class="btn btn-info btn-sm" onclick="redirectToPayment('<%= rmap.get("diagPk") %>', '<%= rmap.get("DIAG_PRICE") %>', '<%= rmap.get("masterNM") %>', '<%= rmap.get("masterPhoneNumber") %>')">
                                                    <i class="fas fa-pencil-alt"></i>수납
                                                </a>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                        </tbody>

                                        <script>
                                            function redirectToLink(diagPk) {
                                                window.location.href = "http://localhost:8000/diag/diagDetail?diagPk=" + diagPk;
                                            }
                                        </script>
                                        <script>
                                            function redirectToPayment(diagPk, diagPrice, masterNM, masterPhoneNumber) {
                                                var url = 'http://localhost:8000/payment/paymentList?diagPk=' + diagPk +
                                                    '&DIAG_PRICE=' + diagPrice +
                                                    '&masterNM=' + masterNM +
                                                    '&masterPhoneNumber=' + masterPhoneNumber;
                                                window.location.href = url;
                                            }
                                        </script>


                                    </table>
                                </div>
                                <!-- /.card-body -->

                                <!-- /.card-body -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->

<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables/dataTables.bootstrap.min.js"></script>

<script>
    $(function () {
        $('#stocktableList').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });
    });
</script>

<%@ include file="/include/footer.jsp"%>
</body>
</html>


