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
                                <div class="product-image-thumb active"><img src="../../dist/img/prod-1.jpg" alt="Product Image"></div>
                                <div class="product-image-thumb" ><img src="../../dist/img/prod-2.jpg" alt="Product Image"></div>
                                <div class="product-image-thumb" ><img src="../../dist/img/prod-3.jpg" alt="Product Image"></div>
                                <div class="product-image-thumb" ><img src="../../dist/img/prod-4.jpg" alt="Product Image"></div>
                                <div class="product-image-thumb" ><img src="../../dist/img/prod-5.jpg" alt="Product Image"></div>
                            </div>
                        </div>
                        <div class="col-12 col-sm-6">
                            <div class="form-group">
                                <h3 class="my-3"><label for="inputSTOCK_COMMON_CODE">상품명</label></h3>
                                <input type="text" id="inputSTOCK_COMMON_NM" class="form-control" value="상품명">
                            </div>
                            <p>상품상세설명</p>

                            <hr>
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
                                <input type="text" id="inputSTOCK_COMMON_CODE" class="form-control" value="ABC123456">
                            </div>
                            <div class="form-group">
                                <label for="inputSTOCK_BUYPRICE">입고가</label>
                                <input type="text" id="inputSTOCK_BUYPRICE" class="form-control" value="10,000">
                            </div>
                            <div class="form-group">
                                <label for="inputSTOCK_COMMON_SELLPRICE">판매가</label>
                                <input type="text" id="inputSTOCK_COMMON_SELLPRICE" class="form-control" value="20,000">
                            </div>
                            <div class="form-group">
                                <label for="inputSTOCK_CHANGED_PK">재고량</label>
                                <input type="text" id="inputSTOCK_CHANGED_PK" class="form-control" value="0">
                            </div>

                            <div class="mt-4">
                                <div class="btn btn-primary btn-lg btn-flat">
                                    <%--<i class="fas fa-cart-plus fa-lg mr-2"></i>--%>
                                    파일첨부
                                </div>

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

