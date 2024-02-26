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
    <link rel="stylesheet" type="text/css" href="/static/css/medlogList.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/sidebar.jsp"%>
<div class="wrapper">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <button id="openModalBtn" class="btn btn-info btn-sm">미수납</button>
        </section>

        <!-- Main content -->
        <section class="content">
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
                                            <div class="col-sm-6 invoice-col" id="invoiceInfo">
                                                <!-- 여기에 주문번호, 진료일 및 고객 정보가 자동으로 생성됩니다 -->
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
                                                <div class="row justify-content-end">
                                                    <div class="col-md-3">
                                                        <button type="button" class="btn btn-success btn-info"><i class="fa fa-money-bill"></i>현금결제</button>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <button type="button" class="btn btn-success btn-primary" onclick="requestPay()"><i class="fa fa-qrcode"></i>QR결제</button>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <button type="button" class="btn btn-success btn-secondary"><i class="far fa-credit-card"></i>신용카드</button>
                                                    </div>
                                                </div>
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
        </section>

        <!-- JavaScript 코드 -->
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                // 인보이스 번호 생성 (임의의 숫자를 사용하여 간단하게 생성)
                var invoiceNumber = Math.floor(Math.random() * 1000000);
                var invoiceElement = document.getElementById("invoiceInfo");
                invoiceElement.innerHTML = "<b>인보이스 번호:</b> #" + invoiceNumber + "<br>";

                // 현재 날짜 생성
                var currentDate = new Date();
                var formattedDate = currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1).toString().padStart(2, '0') + "-" + currentDate.getDate().toString().padStart(2, '0');
                invoiceElement.innerHTML += "<b>진료일:</b> " + formattedDate + "<br>";

                // 고객 정보 생성 (임의의 데이터 사용)
                var buyer_name = "홍길동";
                var buyer_tel = "010-1234-5678";
                var buyer_email = "hong@example.com";

                // 고객 정보를 화면에 표시
                invoiceElement.innerHTML += "<b>고객명:</b> " + buyer_name + "<br>";
                invoiceElement.innerHTML += "<b>고객 연락처:</b> " + buyer_tel + "<br>";
                invoiceElement.innerHTML += "<b>고객 이메일:</b> " + buyer_email + "<br>";

                // 모달 창을 보이게 함
                document.getElementById("myModal").style.display = "block";
            });
        </script>

    </div>
    <!-- /.content-wrapper -->
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
    <script>
            // IMP 객체를 전역 변수로 선언하고, 상점에서 발급받은 식별키로 초기화
            var IMP = window.IMP;
            IMP.init("imp80707007");

            // 구매자 정보를 저장할 변수 선언
            var buyer_email, buyer_name, buyer_tel;

            // 현재 시간을 기반으로 주문번호 생성
            var orderNo = 'order_no_' + Date.now();

            // 결제 요청 함수 정의
            function requestPay() {
            // 입력된 구매자 정보 가져오기
            buyer_email = document.getElementById("buyer_email").value;
            buyer_name = document.getElementById("buyer_name").value;
            buyer_tel = document.getElementById("buyer_tel").value;

            // IMP 객체를 사용하여 결제 요청
            IMP.request_pay({
            pg: 'tosspay.tosstest',  // 결제 수단 지정
            // kakaopay.TC0ONETIME / tosspay.tosstest / payco.AUTOPAY / html5_inicis
            pay_method: 'card',          // 결제 수단 (카드 결제)
            merchant_uid: orderNo,       // 상점에서 관리하는 주문번호
            name: 'Order name: Payment test',   // 주문명
            amount: 100,                    // 결제 금액
            buyer_email: buyer_email,  // 구매자 이메일
            buyer_name: buyer_name,    // 구매자 이름
            buyer_tel: buyer_tel       // 구매자 전화번호

        }, function(rsp) { // callback 로직
            if (rsp.success) {

            // 결제 정보를 콘솔에 출력
            console.log("결제 정보:");
            console.log("고유 식별자:", rsp.imp_uid);
            console.log("상점 거래 ID:", rsp.merchant_uid);
            console.log("결제 금액:", rsp.paid_amount);
            console.log("고객명:", rsp.buyer_name);
            console.log("고객 이메일:", rsp.buyer_email);
            console.log("고객 연락처:", rsp.buyer_tel);
            console.log("PG(카드사) 승인번호:", rsp.pg_tid);

            /*// 결제 성공 시 서버로 결제 정보를 전송하여 확인
            jQuery.ajax({
            url: "/pages/payment/payReceipt.jsp",  // 결제 정보를 확인할 페이지
            type: 'POST',
            dataType: 'json',
            data: {
            buyerEmail: rsp.buyer_email,
            buyer_name: rsp.buyer_name,
            buyer_tel: rsp.buyer_tel,
            pg: rsp.pg,
            payMethod: rsp.pay_method,
            merchantUid: rsp.merchant_uid,
            name: rsp.name,
            amount: rsp.amount,
            applyNum: rsp.apply_num
        }
        }).done(function(data) {
            // 결제 정보 전송 후, 결제 정보를 확인할 페이지로 이동
            window.location.href = "/pages/payment/payReceipt.jsp";
        });
        } */ else {
            // 결제 실패 시 에러 메시지 출력
            var msg = '결제 실패.';
            msg += '에러 상세 정보: ' + rsp.error_msg;

            alert(msg);
        }
        });
        }
    </script>
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

<%@ include file="/include/footer.jsp"%>
</body>
</html>