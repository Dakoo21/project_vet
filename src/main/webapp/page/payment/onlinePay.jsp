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
    <script src='https://cdn.iamport.kr/v1/iamport.js'></script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/sidebar.jsp"%>
<div class="wrapper">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1></h1>
        </section>

        <!-- Main content -->
        <section class="content">
            <h2>구매자 정보 입력</h2>
            <div>
                <label for="buyer_email">이메일:</label>
                <input type="email" id="buyer_email" name="buyer_email">
            </div>
            <div>
                <label for="buyer_name">이름:</label>
                <input type="text" id="buyer_name" name="buyer_name">
            </div>
            <div>
                <label for="buyer_tel">전화번호:</label>
                <input type="tel" id="buyer_tel" name="buyer_tel">
            </div>
            <!-- 'Pay' 버튼 클릭 시 결제 요청 함수 호출 -->
            <button onclick="requestPay()">결제</button>
            <!-- 결제 버튼 생성 -->
        </section>
        <!-- /.content -->
        <!-- 결제 정보 출력을 위한 모달 -->
    </div>
</div>
<!-- /.content-wrapper -->
<script>
    // IMP 객체를 전역 변수로 선언하고, 상점에서 발급받은 식별키로 초기화
    var IMP = window.IMP;
    IMP.init("imp80707007");

    // 구매자 정보를 저장할 변수 선언
    var buyer_email, buyer_name, buyer_tel;

    // 결제 요청 함수 정의
    function requestPay() {
        // 입력된 구매자 정보 가져오기
        buyer_email = document.getElementById("buyer_email").value;
        buyer_name = document.getElementById("buyer_name").value;
        buyer_tel = document.getElementById("buyer_tel").value;

        // 현재 시간을 기반으로 주문번호 생성
        var orderNo = 'order_no_' + Date.now();

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
            //m_redirext_url: 'https://api.iamport.kr/payments/imp80707007' // '{모바일에서 결제 완료 후 리디렉션 될 URL}'
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
                /*console.log(":", rsp.);
                console.log(":", rsp.);*/

                // 결제 성공 시 서버로 결제 정보를 전송하여 확인
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
            } else {
                // 결제 실패 시 에러 메시지 출력
                var msg = '결제 실패.';
                msg += '에러 상세 정보: ' + rsp.error_msg;

                alert(msg);
            }
        });
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

<%@ include file="/include/footer.jsp"%>

</body>
</html>
