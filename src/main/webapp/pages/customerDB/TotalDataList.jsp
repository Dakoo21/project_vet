<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>재고관리</title>
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
                    <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                           aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>
                </div>
                <div class="col-3">
                    <button id="btn_search" class="btn btn-danger" onClick="boardSearch()">검색</button>
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
                                        <td>서견주<a href="totalDataDetail.jsp?고객명"></a></td>
                                        <td>뭉치</td>
                                        <td>개</td>
                                        <td>불독</td>
                                        <td>여</td>
                                        <td>O</td>
                                    </tr>
                                    <tr>
                                        <td>서견주</td>
                                        <td>망치</td>
                                        <td>개</td>
                                        <td>불독</td>
                                        <td>여</td>
                                        <td>O</td>
                                    </tr>
                                    <tr>
                                        <td>서견주</td>
                                        <td>양치</td>
                                        <td>개</td>
                                        <td>불독</td>
                                        <td>남</td>
                                        <td>O</td>
                                    </tr>
                                    <tr>
                                        <td>고영주</td>
                                        <td>루루</td>
                                        <td>고양이</td>
                                        <td>코리안숏헤어</td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div style="display:flex; justify-content:center;">
                                    <ul class="pagination"></ul>
                                </div>
                            </div>
                        </div>
                        <div class="chart tab-pane" id="select-dogs" style="position: relative; height: 100%;">
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
                                        <td>서견주<a href="totalDataDetail.jsp?고객명"></a></td>
                                        <td>뭉치</td>
                                        <td>개</td>
                                        <td>불독</td>
                                        <td>여</td>
                                        <td>O</td>
                                    </tr>
                                    <tr>
                                        <td>서견주</td>
                                        <td>망치</td>
                                        <td>개</td>
                                        <td>불독</td>
                                        <td>여</td>
                                        <td>O</td>
                                    </tr>
                                    <tr>
                                        <td>서견주</td>
                                        <td>양치</td>
                                        <td>개</td>
                                        <td>불독</td>
                                        <td>남</td>
                                        <td>O</td>
                                    </tr>
                                    <tr>
                                        <td>고영주</td>
                                        <td>루루</td>
                                        <td>고양이</td>
                                        <td>코리안숏헤어</td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div style="display:flex; justify-content:center;">
                                    <ul class="pagination"></ul>
                                </div>
                            </div>
                        </div>
                        <div class="chart tab-pane" id="select-cat" style="position: relative; height: 100%;">
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
                                        <td>서견주<a href="totalDataDetail.jsp?고객명"></a></td>
                                        <td>뭉치</td>
                                        <td>강아지</td>
                                        <td>불독</td>
                                        <td>여</td>
                                        <td>O</td>
                                    </tr>
                                    <tr>
                                        <td>서견주</td>
                                        <td>망치</td>
                                        <td>개</td>
                                        <td>불독</td>
                                        <td>여</td>
                                        <td>O</td>
                                    </tr>
                                    <tr>
                                        <td>서견주</td>
                                        <td>양치</td>
                                        <td>개</td>
                                        <td>불독</td>
                                        <td>남</td>
                                        <td>O</td>
                                    </tr>
                                    <tr>
                                        <td>고영주</td>
                                        <td>루루</td>
                                        <td>고양이</td>
                                        <td>코리안숏헤어</td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div style="display:flex; justify-content:center;">
                                    <ul class="pagination"></ul>
                                </div>
                            </div>
                        </div>
                        <div class="chart tab-pane" id="select-animals" style="position: relative; height: 100%;">
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
                                        <td>서견주<a href="totalDataDetail.jsp?고객명"></a></td>
                                        <td>뭉치</td>
                                        <td>기타동물</td>
                                        <td>불독</td>
                                        <td>여</td>
                                        <td>O</td>
                                    </tr>
                                    <tr>
                                        <td>서견주</td>
                                        <td>망치</td>
                                        <td>개</td>
                                        <td>불독</td>
                                        <td>여</td>
                                        <td>O</td>
                                    </tr>
                                    <tr>
                                        <td>서견주</td>
                                        <td>양치</td>
                                        <td>개</td>
                                        <td>불독</td>
                                        <td>남</td>
                                        <td>O</td>
                                    </tr>
                                    <tr>
                                        <td>고영주</td>
                                        <td>루루</td>
                                        <td>고양이</td>
                                        <td>코리안숏헤어</td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
                                    </tr>
                                    <tr>
                                        <td>김톨이</td>
                                        <td>햄토리</td>
                                        <td>햄스터</td>
                                        <td> - </td>
                                        <td>남</td>
                                        <td>X</td>
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
                    <button type="button" class="btn btn-default">등록</button>
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
<script src="../../dist/js/demo.js"></script>
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
