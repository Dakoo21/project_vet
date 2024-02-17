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
                                    <td>상품명</td>
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
                                    <td>상품명</td>
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
                                    <td>상품명</td>
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
                                    <td>상품명</td>
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
                                    <td>상품명</td>
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
                                    <td>상품명</td>
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
                                    <td>상품명</td>
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
                                    <td>상품명</td>
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
                                    <td>상품명</td>
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
                                    <td>상품명</td>
                                    <td>100</td>
                                    <td>0</td>
                                    <td>10,000</td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                            <script>
                                // 페이지 로드 후 실행되는 함수
                                document.addEventListener("DOMContentLoaded", function() {
                                    // 모든 행을 선택합니다.
                                    var rows = document.querySelectorAll("tbody tr");

                                    // 각 행에 대해 반복합니다.
                                    rows.forEach(function(row) {
                                        // 마지막 열을 선택합니다.
                                        var lastCell = row.cells[row.cells.length - 1];

                                        // 버튼을 생성합니다.
                                        var button = document.createElement("button");
                                        button.className = "addToCartButton";
                                        button.textContent = "담기";
                                        button.onclick = function() {
                                            addToCart();
                                        };

                                        // 버튼을 열에 추가합니다.
                                        lastCell.appendChild(button);
                                    });
                                });
                            </script>
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
                            </table>
                            <div class="stock-footer">
                                <button type="button">선택 취소</button>&nbsp;
                            </div>
                            <!-- 하단 버튼 -->
                            <div class="stock-footer">
                                <button type="button" class="btn btn-outline-warning">온라인결제</button>&nbsp;
                                <button type="button" class="btn btn-outline-success">현금결제</button>
                            </div>
                        </div>
                        <!-- /.card-body -->
                        <script>
                            document.addEventListener("DOMContentLoaded", function() {
                                // 모든 담기 버튼을 선택합니다.
                                var addToCartButtons = document.querySelectorAll(".addToCartButton");

                                // 결제할 상품 리스트의 테이블을 선택합니다.
                                var paymentTable = document.getElementById("paymentTable").querySelector("tbody");

                                // 각 담기 버튼에 대해 반복합니다.
                                addToCartButtons.forEach(function(button) {
                                    // 담기 버튼을 클릭했을 때 실행될 함수를 설정합니다.
                                    button.addEventListener("click", function() {
                                        // 해당 행의 데이터를 가져옵니다.
                                        var row = button.closest("tr");
                                        var quantityCell = row.cells[6]; // 선택량이 표시되는 셀
                                        var currentQuantity = parseInt(quantityCell.textContent); // 현재 선택량
                                        var newQuantity = currentQuantity + 1; // 새로운 선택량

                                        // 선택량을 업데이트합니다.
                                        quantityCell.textContent = newQuantity;

                                        // 해당 행의 재고량을 가져옵니다.
                                        var stockCell = row.cells[5]; // 재고량이 표시되는 셀
                                        var currentStock = parseInt(stockCell.textContent); // 현재 재고량
                                        var newStock = currentStock - 1; // 새로운 재고량

                                        // 재고량을 업데이트합니다.
                                        stockCell.textContent = newStock;

                                        // 해당 행의 데이터를 가져옵니다.
                                        var productCode = row.cells[1].innerText;
                                        var category = row.cells[2].innerText;
                                        var productName = row.cells[4].innerText;
                                        var amount = row.cells[7].innerText;

                                        // 결제할 상품 리스트로 데이터를 복사합니다.
                                        var existingProductRow = null;

                                        // 이미 결제할 상품 리스트에 있는지 확인합니다.
                                        paymentTable.querySelectorAll("tr").forEach(function(paymentRow) {
                                            if (paymentRow.cells[0].innerText === productCode) {
                                                existingProductRow = paymentRow;
                                            }
                                        });

                                        if (existingProductRow) {
                                            // 이미 결제할 상품 리스트에 있는 경우 선택 수량만 증가시킵니다.
                                            var existingQuantityCell = existingProductRow.cells[3];
                                            var existingQuantity = parseInt(existingQuantityCell.textContent);
                                            existingQuantityCell.textContent = existingQuantity + 1;
                                        } else {
                                            // 결제할 상품 리스트에 추가합니다.
                                            var newRow = paymentTable.insertRow();
                                            var cell0 = newRow.insertCell(0); // 체크박스를 위한 셀
                                            var cell1 = newRow.insertCell(1);
                                            var cell2 = newRow.insertCell(2);
                                            var cell3 = newRow.insertCell(3);
                                            var cell4 = newRow.insertCell(4);
                                            var cell5 = newRow.insertCell(5);

                                            // 체크박스 생성 및 설정
                                            var checkbox = document.createElement('input');
                                            checkbox.type = "checkbox";
                                            checkbox.value = productCode; // 체크박스의 값으로 상품 코드 설정
                                            cell0.appendChild(checkbox);

                                            cell1.textContent = productCode;
                                            cell2.textContent = category;
                                            cell3.textContent = productName;
                                            cell4.textContent = 1; // 선택 수량
                                            cell5.textContent = amount;
                                        }

                                        // 총 금액을 업데이트합니다.
                                        updateTotalAmount();
                                    });
                                });

                                // 결제할 상품 리스트의 총 금액을 표시할 요소를 선택합니다.
                                var totalAmountElement = document.getElementById("totalAmount");

                                // 결제할 상품 리스트의 총 금액을 초기화합니다.
                                var totalAmount = 0;

                                // 합계를 업데이트합니다.
                                function updateTotalAmount() {
                                    // 모든 결제할 상품의 금액을 합산합니다.
                                    var items = paymentTable.querySelectorAll("tr");
                                    totalAmount = 0;
                                    items.forEach(function(item) {
                                        totalAmount += parseInt(item.cells[3].textContent) * parseInt(item.cells[4].textContent);
                                    });

                                    // 합계를 표시합니다.
                                    totalAmountElement.textContent = totalAmount;
                                }
                            });
                        </script>
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
<%@ include file="/include/footer.jsp"%>
</body>
</html>
