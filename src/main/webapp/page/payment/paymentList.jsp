<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>결제페이지</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="../../iCheck/flat/blue.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="plugins/morris/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="/js/paymentList.js"></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/sidebar.jsp"%>
<div class="wrapper">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                결제페이지
                <small>결제페이지</small>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-8">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">상품리스트</h3>
                        </div>
                        <div class="card-body">
                            <table id="stocktableList" class="table table-striped projects">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" value="value"></th>
                                    <th style="width: 5%">
                                        상품코드
                                    </th>
                                    <th style="width: 10%">
                                        구분
                                    </th>
                                    <th style="width: 10%">
                                        이미지
                                    </th>
                                    <th style="width: 45%" class="text-center">
                                        상품명
                                    </th>
                                    <th style="width: 10%">
                                        재고량
                                    </th>
                                    <th style="width: 10%">
                                        선택량
                                    </th>
                                    <th style="width: 15%">
                                        금액
                                    </th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar.png">
                                    </li></td>
                                    <td>상품명1</td>
                                    <td>100</td>
                                    <td>0</td>
                                    <td>10,000</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0002</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar2.png">
                                    </li></td>
                                    <td>상품명2</td>
                                    <td>100</td>
                                    <td>0</td>
                                    <td>10,000</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0003</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar3.png">
                                    </li></td>
                                    <td>상품명3</td>
                                    <td>100</td>
                                    <td>0</td>
                                    <td>10,000</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0004</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar4.png">
                                    </li></td>
                                    <td>상품명4</td>
                                    <td>100</td>
                                    <td>0</td>
                                    <td>10,000</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0005</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar5.png">
                                    </li></td>
                                    <td>상품명5</td>
                                    <td>100</td>
                                    <td>0</td>
                                    <td>10,000</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0006</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar.png">
                                    </li></td>
                                    <td>상품명6</td>
                                    <td>100</td>
                                    <td>0</td>
                                    <td>10,000</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0007</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar2.png">
                                    </li></td>
                                    <td>상품명7</td>
                                    <td>100</td>
                                    <td>0</td>
                                    <td>10,000</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0008</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar3.png">
                                    </li></td>
                                    <td>상품명8</td>
                                    <td>100</td>
                                    <td>0</td>
                                    <td>10,000</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0009</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar4.png">
                                    </li></td>
                                    <td>상품명9</td>
                                    <td>100</td>
                                    <td>0</td>
                                    <td>10,000</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0010</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar5.png">
                                    </li></td>
                                    <td>상품명10</td>
                                    <td>100</td>
                                    <td>0</td>
                                    <td>10,000</td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <div class="col-md-4">
                    <div class="card card-secondary">
                        <div class="card-header">
                            <h3 class="card-title">결제할 항목</h3>
                        </div>
                        <div class="card-body">
                            <div class="card-header">
                                <h3 class="card-title">구매자명 검색</h3>
                            </div>
                            <table id="paymentTable" class="table table-hover">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>상품코드</th>
                                    <th>구분</th>
                                    <th>상품명</th>
                                    <th>수량</th>
                                    <th>금액</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- 여기에 데이터가 추가될 것입니다. -->
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="6" style="text-align: right;">합계</td>
                                    <td id="totalAmountValue">원</td>
                                    <td></td>
                                </tr>
                                </tfoot>
                            </table>
                            <div class="stock-footer">
                                <button type="button">선택 취소</button>&nbsp;
                            </div>
                            <!-- 하단 버튼 -->
                            <div class="stock-footer">
                                <button type="button" class="btn btn-outline-warning" id="onlinePaymentButton">온라인결제</button>&nbsp;&nbsp;
                                <button type="button" class="btn btn-outline-success">현금결제</button>
                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
            <div class="row">
                <td colspan="8" style="text-align: right;">
                    <button onclick="addToCart()">선택 담기</button>
                </td>
            </div>
        </section>
        <!-- /.content -->
    </div>
</div>
<!-- /.content-wrapper -->
<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<!-- DataTables -->
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables/dataTables.bootstrap.min.js"></script>
<%@ include file="/include/footer.jsp"%>
<!-- 페이징처리 -->
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
</body>
</html>
