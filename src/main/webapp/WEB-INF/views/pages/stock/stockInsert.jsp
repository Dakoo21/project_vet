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
    <%@include file="/include/bootCommon.jsp"%>
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
                        <h1>재고등록</h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <form id="stockInsert" action="/stock/stockInsert" method="post">
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
                                            <%-- attached 컬럼 받아야됨 --%>
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
                                        <label for="stock_common_nm">상품명</label>
                                        <input type="text" id="stock_common_nm" name="stock_common_nm" class="form-control" placeholder="상품명을 입력하세요">
                                    </div>


                                    <div class="form-group">
                                        <label for="inputSTOCK_COMMON_DETAIL">상품 상세설명</label>
                                        <input type="text" id="inputSTOCK_COMMON_DETAIL" class="form-control" placeholder="상품 상세설명을 입력하세요">
                                    </div>


                                    <div class="form-group">
                                        <label for="stock_common_type">구분</label>
                                        <select id="stock_common_type" name="stock_common_type" class="form-control custom-select">
                                            <option value="일반">일반</option>
                                            <option value="식품">식품</option>
                                            <option value="약품">약품</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="stock_common_code">상품코드</label>
                                        <input type="text" id="stock_common_code" name="stock_common_code" class="form-control" placeholder="ex.ABC123456">
                                    </div>


                                    <div class="form-group">
                                        <label for="inputSTOCK_BUYPRICE">입고가</label>
                                        <input type="text" id="inputSTOCK_BUYPRICE" class="form-control">
                                    </div>


                                    <div class="form-group">
                                        <label for="stock_common_sellprice">판매가</label>
                                        <input type="text" id="stock_common_sellprice" name="stock_common_sellprice" class="form-control">
                                    </div>



                                    <div class="form-group">
                                        <label for="inputSTOCK_CHANGED_PK">재고량</label>
                                        <input type="text" id="inputSTOCK_CHANGED_PK" class="form-control" >
                                    </div>


                                </div>

                                    <div class="mt-4">
                                        <div type="button" class="btn btn-primary btn-flat" onclick="StockIN()">
                                            등록
                                        </div>
                                        <%--  같이 내용이지만 디테일 페이지 만들어서 이용
                                        <div type="button" class="btn btn-default btn-flat">
                                            수정
                                        </div>
                                        <div type="button" class="btn btn-danger btn-flat">
                                            삭제
                                        </div>
                                        --%>
                                    </div>

                            </div>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </form>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
</div>
<!-- ./wrapper -->

<%@include file="/include/bootCommonFoot.jsp"%>
<script>
    $(document).ready(function() {
        $('.product-image-thumb').on('click', function () {
            var $image_element = $(this).find('img')
            $('.product-image').prop('src', $image_element.attr('src'))
            $('.product-image-thumb.active').removeClass('active')
            $(this).addClass('active')
        })
    })
    const StockIN = (event) => {
      document.querySelector("#stockInsert").submit();
    }
</script>

<%@ include file="/include/footer.jsp"%>
</body>
</html>
