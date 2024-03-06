<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%
    List<Map<String,Object>> dList =(List)request.getAttribute("dList");
    int size = (dList != null) ? dList.size() : 0;
%>
<script type="text/javascript">
    function searchEnter(event) {
        if (event.key === 'Enter') {
            boardSearch();
        }
    }

    function boardSearch() {
        if($("#gubun").val() === '' || $("#gubun").val() === null ){
            alert("분류를 선택해주세요.");
            return;
        }
        if($("#keyword").val() === '' || $("#keyword").val() === null ){
            alert("검색어를 입력해주세요.");
            return;
        }
        let searchData = {
            gubun: $("#gubun").val(),
            keyword: $("#keyword").val(),
        }
        // AJAX 요청 보내기
        $.ajax({
            url: "/CustomerDB/TotalDataSelectedList",
            type: "GET",
            data: searchData,
            contentType: "application/json",
            success: function(data){
                updateTable(data);
            },
            error: function(xhr, status, error){
            }
        });
        }
    function updateTable(data) {
        // 받은 데이터를 사용하여 테이블을 업데이트하는 로직을 작성
        let tableContent = "";
        $('#boardAnimalList > td').remove();
        // 예를 들어, 받은 데이터를 사용하여 테이블의 각 행을 구성하는 HTML을 생성
        data.forEach(function(row) {
            tableContent += '<table class="table table-striped table-bordered table-hover dt-responsive">';
            tableContent += "<thead>";
            tableContent += "<tr>";
            tableContent += "<th>고객명</th>";
            tableContent += "<th>동물이름</th>";
            tableContent += "<th>축종</th>";
            tableContent += "<th>품종</th>";
            tableContent += "<th>성별</th>";
            tableContent += "<th>중성화</th>";
            tableContent += "</tr>";
            tableContent += "</thead>";
            tableContent += "<tr>";
            tableContent += "<td><a href=/CustomerDB/TotalDataDetail/" + row.animalPk + '>' + row.master_nm + "</td>";
            tableContent += "<td>" + row.animal_nm + "</td>";
            tableContent += "<td>" + row.animal_species + "</td>";
            tableContent += "<td>" + row.animal_breed + "</td>";
            tableContent += "<td>" + row.animal_sex + "</td>";
            tableContent += "<td>" + row.animal_neut + "</td>";
            // 이와 같이 필요한 만큼 테이블의 열을 추가
            tableContent += "</tr>";
        });
        // 테이블을 업데이트
        $("#boardAnimalList").html(tableContent);
    }
</script>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>통합데이터리스트</title>
    <%@ include file="/include/bootCommon.jsp" %>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <%@ include file="/include/sidebar.jsp" %>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>고객-동물 데이터 조회</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Projects</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="board">
                <div class="card-header">
                    <h3 class="card-title">
            <!-- 검색기 시작 -->
                        <div class="row">
                          <div class="col-3">
                               <select id="gubun" name="gubun" class="form-select" aria-label="분류선택">
                                   <option value="none">분류선택</option>
                                    <option value="master_nm">고객명</option>
                                    <option value="animal_nm">반려동물명</option>
                              </select>
                          </div>
                            <div class="spacer"></div>
                           <div class="col-5">
                                 <input type="text" id="keyword"  class="form-control" placeholder="검색어를 입력하세요"
                                    aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>
                           </div>
                       <div class="col-3">
                          <button id="btn_search" class="btn btn-danger" onClick="boardSearch()">검색</button>
                      </div>
                   </div>
                 </h3>
            <!--카테고리 버튼-->
            <div class="card-tools">
                <ul class="nav nav-pills ml-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#select-all" data-toggle="tab">전체조회</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#select-dog" data-toggle="tab">강아지</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#select-cat" data-toggle="tab">고양이</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#select-animals" data-toggle="tab">기타동물</a>
                    </li>
                </ul>
            </div>
         </div>
      </div>
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
                            <div>
                                <table id="boardAnimalList" class="table table-striped table-bordered table-hover dt-responsive">
                                    <thead>
                                    <tr>
                                        <th>고객명</th>
                                        <th>동물이름</th>
                                        <th>축종</th>
                                        <th>품종</th>
                                        <th>성별</th>
                                        <th>중성화</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (int i =0; i<dList.size(); i++){
                                            Map<String,Object> pmap =  dList.get(i);
                                        %>
                                        <tr >
                                            <td><a href="/CustomerDB/TotalDataDetail/<%=pmap.get("animalPk")%>"><%=pmap.get("master_nm")%></a></td>
                                            <td><%=pmap.get("animal_nm")%></td>
                                            <td><%=pmap.get("animal_species")%></td>
                                            <td><%=pmap.get("animal_breed")%></td>
                                            <td><%=pmap.get("animal_sex")%></td>
                                            <td><%=pmap.get("animal_neut")%></td>
                                        <%
                                            }
                                        %>
                                    </tr>
                                    </tbody>
                                </table>
                                <div style="display:flex; justify-content:center;">
                                    <ul class="pagination"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
                <!-- /.card-body -->
                <div class="col-md-2" >
                    <a href="/CustomerDB/TotalDataInsertPage" type="button" class="btn btn-default">등록</a>
                </div>
            </div>
            <!-- /.content -->

        <!-- /.content-wrapper -->
    </div>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<%@include file="/include/bootCommonFoot.jsp"%>
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables/dataTables.bootstrap.min.js"></script>



<%--<script>--%>
<%--    $(function () {--%>
<%--        $('#stocktableList').DataTable({--%>
<%--            "paging": true,--%>
<%--            "lengthChange": false,--%>
<%--            "searching": false,--%>
<%--            "ordering": true,--%>
<%--            "info": true,--%>
<%--            "autoWidth": false--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>

<%@ include file="/include/footer.jsp"%>
</body>
</html>
<style>
    .spacer {
        width: 20px; /* 조절할 공간의 너비를 지정하세요 */
        height: auto; /* 필요에 따라 높이를 조절하세요 */
        display: inline-block;
    }


</style>