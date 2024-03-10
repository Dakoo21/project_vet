<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>진료기록조회</title>
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
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- DataTables -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/static/css/medlogList.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">
<%@ include file="/include/header.jsp"%>
<div class="wrapper">
<%@ include file="/include/sidebar.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>진료기록조회</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Projects</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="card-body p-0">
                <table id = "medlogtableList" class="table table-striped projects">
                    <thead>
                    <tr>
                        <th style="width: 5%">
                            등록일시
                        </th>
                        <th style="width: 10%">
                            축종
                        </th>
                        <th style="width: 10%">
                            보호자
                        </th>
                        <th style="width: 20%" class="text-center">
                            연락처
                        </th>
                        <th style="width: 20%">
                            동물명
                        </th>
                        <th style="width: 5%" class="text-center">
                            차트번호
                        </th>
                        <th style="width: 15%"> 수납상태
                        </th>
                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>김보호</td>
                        <td>010-1234-5678</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button id="openModalBtn" class="btn btn-info btn-sm">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>김보호</td>
                        <td>010-1234-5678</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button id="openModalBtn" class="btn btn-info btn-sm">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>김보호</td>
                        <td>010-1234-5678</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button id="openModalBtn" class="btn btn-info btn-sm">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>김보호</td>
                        <td>010-1234-5678</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button id="openModalBtn" class="btn btn-info btn-sm">미수납</button></td>
                    </tr><tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>김보호</td>
                        <td>010-1234-5678</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button id="openModalBtn" class="btn btn-info btn-sm">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>김보호</td>
                        <td>010-1234-5678</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button id="openModalBtn" class="btn btn-info btn-sm">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>김보호</td>
                        <td>010-1234-5678</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button id="openModalBtn" class="btn btn-info btn-sm">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>김보호</td>
                        <td>010-1234-5678</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button id="openModalBtn" class="btn btn-info btn-sm">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>김보호</td>
                        <td>010-1234-5678</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button id="openModalBtn" class="btn btn-info btn-sm">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>김보호</td>
                        <td>010-1234-5678</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button id="openModalBtn" class="btn btn-info btn-sm">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>김보호</td>
                        <td>010-1234-5678</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button id="openModalBtn" class="btn btn-info btn-sm">미수납</button></td>
                    </tr>

                    </tbody>

                </table>
            </div>
            <!-- /.card-body -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <%@ include file="/include/footer.jsp"%>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<%-- =======================[modal]============================= --%>
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-6">
                        <!-- Main content -->
                        <div class="invoice p-1 mb-1">
                            <!-- info row -->
                            <div class="row invoice-info">
                                <div class="col-sm-4 invoice-col">
                                    <b>인보이스 번호:</b> #007612<br>
                                    <b>주문 ID:</b> 4F3S8J<br>
                                    <b>진료일:</b> 2024-02-19<br>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->

                            <!-- Table row -->
                            <div class="row">
                                <div class="col-12 table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>수량</th>
                                            <th>진료항목</th>
                                            <th>금액</th>
                                            <th>비고</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>진료비</td>
                                            <td>30,000</td>
                                            <td>없음</td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>엑스레이</td>
                                            <td>20,000</td>
                                            <td>없음</td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>주사</td>
                                            <td>50,000</td>
                                            <td>없음</td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>약 처방</td>
                                            <td>20,000</td>
                                            <td>없음</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->

                            <div class="row">
                                <div class="col-6"></div> <!-- 왼쪽 열 -->
                                <div class="col-6 offset-6"> <!-- 오른쪽 열 -->
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tr>
                                                <th>합계:</th>
                                                <td>120,000</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->

                            <!-- this row will not appear when printing -->
                            <div class="row no-print">
                                <div class="col-12">
                                    <button type="button" class="btn btn-success float-right"><i class="far fa-credit-card"></i>
                                        결제진행
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- /.invoice -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>


</div>

<script>
    // 모달 창 열기 버튼에 클릭 이벤트 리스너 추가
    document.getElementById("openModalBtn").addEventListener("click", function() {
        document.getElementById("myModal").style.display = "block";
    });

    // 모달 창 닫기 버튼에 클릭 이벤트 리스너 추가
    document.getElementsByClassName("close")[0].addEventListener("click", function() {
        document.getElementById("myModal").style.display = "none";
    });
</script>

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
        $('#medlogtableList').DataTable({
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