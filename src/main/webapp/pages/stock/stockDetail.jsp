<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
    <%@ include file="/include/bootCommon.jsp"%>
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
                        <h1>Icons</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Icons</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <!--여기 -->
            <!-- Default box -->
            <div class="card card-solid">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 col-sm-6">
                            <h3 class="d-inline-block d-sm-none">LOWA Men’s Renegade GTX Mid Hiking Boots Review</h3>
                            <div class="col-12">
                                <img src="../../dist/img/prod-1.jpg" class="product-image" alt="Product Image">
                            </div>
                            <div class="col-12 product-image-thumbs">
                                <div class="product-image-thumb active"><img src="/dist/img/prod-1.jpg" alt="Product Image"></div>
                                <div class="product-image-thumb" ><img src="/dist/img/prod-2.jpg" alt="Product Image"></div>
                                <div class="product-image-thumb" ><img src="/dist/img/prod-3.jpg" alt="Product Image"></div>
                                <div class="product-image-thumb" ><img src="/dist/img/prod-4.jpg" alt="Product Image"></div>
                                <div class="product-image-thumb" ><img src="/dist/img/prod-5.jpg" alt="Product Image"></div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6">
                            <h3 class="my-3">상품명</h3>
                            <p>여기에 상품에 대한 상세 내용을 적는 게 필요할까요?</p>

                            <hr>
                            <h5>구분&nbsp;<small>여기는 내용</small></h5>
                            <h5>상품코드&nbsp;<small>여기는 내용</small></h5>
                            <h5>입고가&nbsp;<small>여기는 내용</small></h5>
                            <h5>판매가&nbsp;<small>여기는 내용</small></h5>
                            <h5>재고량&nbsp;<small>여기는 내용</small></h5>

                            <div class="mt-4">
                                <div class="btn btn-primary btn-lg btn-flat">
                                    <%--<i class="fas fa-cart-plus fa-lg mr-2"></i>--%>
                                    수정
                                </div>

                                <div class="btn btn-default btn-lg btn-flat">
                                    <%--<i class="fas fa-heart fa-lg mr-2"></i>--%>
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
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
</body>
</html>

