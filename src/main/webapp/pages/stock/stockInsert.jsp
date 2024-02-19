<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>재고등록</title>
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
                        <h1>재고등록</h1>
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
                        <div class="col-12 col-sm-6">

                            <div class="col-12">
                                <div class="position-relative">
                                    <div class="d-flex justify-content-center align-items-center flex-column product-image-container">
                                        <div class="mb-3">
                                            <button type="button" class="btn btn-primary" onclick="uploadImage()">이미지 등록</button>
                                        </div>
                                        <img id="productImage" class="product-image" alt="Product Image" style="display: none;">
                                    </div>
                                </div>
                            </div>

                            <style>
                                .product-image-container {
                                    width: 350px; /* 이미지 크기에 맞게 조절 */
                                    height: 350px; /* 이미지 크기에 맞게 조절 */
                                    border: 1px solid #ccc; /* 네모난 박스의 테두리 스타일 */
                                    position: relative; /* 상대적으로 위치시킴 */
                                }

                                .product-image-container button {
                                    position: absolute; /* 버튼을 절대적으로 위치시킴 */
                                    bottom: 150px; /* 아래 여백 조절 */
                                    left: 50%; /* 왼쪽 여백을 50%로 설정하여 가운데 정렬 */
                                    transform: translateX(-50%); /* 가운데 정렬 */
                                }
                            </style>
                        </div>

                        <div class="col-12 col-sm-6">
                            <div class="form-group">
                                <div class="form-group">
                                    <label for="inputSTOCK_COMMON_CODE">상품명</label>
                                    <input type="text" id="inputSTOCK_COMMON_NM" class="form-control" placeholder="상품명을 입력하세요">
                                </div>
                                <div class="form-group">
                                    <label for="inputSTOCK_COMMON_CODE">상품 상세설명</label>
                                    <input type="text" id="inputSTOCK_COMMON_DETAIL" class="form-control" placeholder="상품 상세설명을 입력하세요">
                                </div>
                                <div class="form-group">
                                    <label for="inputStatus">구분</label>
                                    <select id="inputStatus" class="form-control custom-select">
                                        <option selected>일반</option>
                                        <option>식품</option>
                                        <option>약품</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="inputSTOCK_COMMON_CODE">상품코드</label>
                                    <input type="text" id="inputSTOCK_COMMON_CODE" class="form-control" placeholder="ex.ABC123456">
                                </div>
                                <div class="form-group">
                                    <label for="inputSTOCK_BUYPRICE">입고가</label>
                                    <input type="text" id="inputSTOCK_BUYPRICE" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="inputSTOCK_COMMON_SELLPRICE">판매가</label>
                                    <input type="text" id="inputSTOCK_COMMON_SELLPRICE" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="inputSTOCK_CHANGED_PK">재고량</label>
                                    <input type="text" id="inputSTOCK_CHANGED_PK" class="form-control" >
                                </div>

                                <div class="mt-4">
                                    <div class="btn btn-primary btn-flat">
                                        확인
                                    </div>
                                    <div class="btn btn-default btn-flat">
                                        수정
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
