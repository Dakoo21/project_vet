<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>재고 상세페이지</title>
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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="hold-transition skin-blue sidebar-mini">
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/sidebar.jsp"%>
<div class="wrapper">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>재고 상세조회</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">E-commerce</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="card card-solid">
                <div class="card-body">
                    <div class="row">
                        <div class="col-6">
                            <img src="../../dist/img/prod-1.jpg" class="product-image" alt="Product Image">
                        </div>

                        <div class="col-12 col-sm-6">
                            <div class="form-group">
                                <div class="form-group">
                                    <label for="inputSTOCK_COMMON_CODE">상품명</label>
                                    <input type="text" id="inputSTOCK_COMMON_NM" class="form-control" value="상품명입니다">
                                </div>
                                <div class="form-group">
                                    <label for="inputSTOCK_COMMON_CODE">상품 상세설명</label>
                                    <input type="text" id="inputSTOCK_COMMON_DETAIL" class="form-control" value="상품 상세설명입니다">
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputStatus">구분</label>
                                            <select id="inputStatus" class="form-control custom-select">
                                                <option selected>일반</option>
                                                <option>식품</option>
                                                <option>약품</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputSTOCK_COMMON_CODE">상품코드</label>
                                            <input type="text" id="inputSTOCK_COMMON_CODE" class="form-control" value="ABC123456">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputSTOCK_BUYPRICE">입고가</label>
                                            <input type="text" id="inputSTOCK_BUYPRICE" class="form-control" value="10,000">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputSTOCK_COMMON_SELLPRICE">판매가</label>
                                            <input type="text" id="inputSTOCK_COMMON_SELLPRICE" class="form-control" value="20,000">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-5"> <!-- 재고량 라벨 공간을 늘리기 위해 컬럼의 크기 조정 -->
                                        <div class="form-group d-flex align-items-center"> <!-- d-flex 클래스와 align-items-center 클래스를 추가하여 세로 중앙 정렬 -->
                                            <label for="inputSTOCK_CHANGED_PK" class="mr-3">재고량</label> <!-- mr-3 클래스를 추가하여 라벨과 입력 폼 사이에 간격 추가 -->
                                            <input type="text" id="inputSTOCK_CHANGED_PK" class="form-control" value="30" style="width: 70px;"> <!-- 입력 폼의 길이를 직접 지정 -->
                                            <span class="ml-2">개</span>
                                        </div>
                                    </div>
                                    <!-- 다른 입력란들 추가 -->
                                </div>

                                <div class="mt-4">
                                    <div class="btn btn-primary btn-flat">
                                        수정
                                    </div>
                                    <div class="btn btn-default btn-flat">
                                        삭제
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

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
<script>
    $(document).ready(function() {
        $('.product-image-thumb').on('click', function () {
            var $image_element = $(this).find('img')
            $('.product-image').prop('src', $image_element.attr('src'))
            $('.product-image-thumb.active').removeClass('active')
            $(this).addClass('active')
        })
    })
</script>

<%@ include file="/include/footer.jsp"%>
</body>
</html>
