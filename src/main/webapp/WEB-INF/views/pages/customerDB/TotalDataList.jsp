<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%
    List<Map<String,Object>> dList =(List)request.getAttribute("dList");
    int size = (dList != null) ? dList.size() : 0;
%>
<script type="text/javascript">
    function searchEnter(){
        console.log('searchEnter')
        console.log(window.event.keyCode);//13
        if(window.event.keyCode == 13){
            dataSearch();
        }
        function dataSearch(){
            console.log('dataSearch');
            const gubun = document.querySelector("#gubun").value; // n_title을 선택시 value값은 n_title 이고 const gubun에 n_title 담김
            const keyword = document.querySelector("#keyword").value; // 주차 검색클릭, 엔터시 value값은 주차로 동시에 반영되고 const keyword도 주차 담김
            console.log(`${gubun} , ${keyword}`);
            location.href="/CustomerDB/TotalDataList?gubun="+gubun+"&keyword="+keyword;  //검색버튼 누르는 순간 주소창이 바뀌기 때문에 컨트롤러에 전달해주기위한 코드 -> 컨트롤러 이동
            //검색 후에 검색창은 다시 초기화됨
            document.querySelector("#gubun").value = '분류선택';
            document.querySelector("#keyword").value = '';
        }

        const dataInsert = () => {
            document.querySelector("#f_totaldata").submit();
        }
    }
</script>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>통합데이터리스트</title>
    <%@ include file="/include/bootCommon.jsp"%>
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
                        <h1>고객-동물 데이터 조회</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Projects</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
            <!-- 검색기 시작 -->
            <div class="row">
                <div class="col-3">
                    <select id="gubun" class="form-select" aria-label="분류선택">
                        <option value="none">분류선택</option>
                        <option value="b_title">고객명</option>
                        <option value="b_writer">반려동물명</option>
                    </select>
                </div>
                <div class="col-6">
<%--                    <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"--%>
<%--                           aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>--%>
                    <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                           aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="if(event.keyCode ===13) searchEnter(event)"/>
                </div>
                <div class="col-3">
                    <button id="btn_search" class="btn btn-danger" onClick="searchEnter(event)">검색</button>
                </div>

            </div>
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
                            <div class ="table">
                                <table class="table table-striped table-bordered table-hover dt-responsive">
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
                                        <tr>
                                        <%
                                            for (int i =0; i<dList.size(); i++){
                                                System.out.println(dList.get(i));
                                            Map<String,Object> pmap =  dList.get(i);
                                        %>
                                        </tr>
                                        <tr>
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
                <!-- /.card-body -->
                <div class="col-md-2">
                    <a href="/CustomerDB/TotalDataInsertPage" type="button" class="btn btn-default">등록</a>
                </div>
            </div>
        <!-- /.content -->
        </section>
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
