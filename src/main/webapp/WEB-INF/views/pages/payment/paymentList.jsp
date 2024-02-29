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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script></script>
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
                        <td>010-1111-1111</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button onclick="redirectToPaymentPage()">미수납</button></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->
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
<script>
    function redirectToPaymentPage() {
        window.location.href = "paymentDetail.jsp";

        /*// 동적으로 form 요소 생성
        var form = document.createElement('form');
        form.method = 'post';  // POST 방식 지정
        form.action = 'paymentDetail.jsp';  // 이동할 페이지 URL 지정

        // 필요한 경우 데이터를 input 요소로 추가할 수 있습니다.
        // 예: 동물의 이름, 차트번호 등
        var animalNameInput = document.createElement('input');
        animalNameInput.type = 'hidden';  // 숨김 필드로 지정
        animalNameInput.name = 'animalName';  // 파라미터명 지정
        animalNameInput.value = '여기는동물이름';  // 실제 값 지정
        form.appendChild(animalNameInput);

        var chartNumberInput = document.createElement('input');
        chartNumberInput.type = 'hidden';
        chartNumberInput.name = 'chartNumber';
        chartNumberInput.value = '20240201001';
        form.appendChild(chartNumberInput);

        // form을 body에 추가하고 submit
        document.body.appendChild(form);
        form.submit();*/
    }
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
<%@ include file="/include/footer.jsp"%>
</body>
</html>