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
            <div class="row">
                <div class="col-md-8">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">수납 결제페이지</h3>
                        </div>
                        <div class="card-body">
                            <!-- 고객명 검색을 위한 폼 시작 -->
                            <form id="searchForm">
                                <div class="form-group">
                                    <label for="merchantUid">주문번호</label>
                                    <input type="text" class="form-control" id="merchantUid" name="merchantUid">
                                </div>
                                <div class="form-group">
                                    <label for="orderName">주문명</label>
                                    <input type="text" class="form-control" id="orderName" name="orderName" value="주문명">
                                </div>
                                <div class="form-group">
                                    <label for="amount">결제 금액</label>
                                    <input type="text" class="form-control" id="amount" name="amount" value="100">
                                </div>
                                <div class="form-group">
                                    <label for="buyerEmail">고객 이메일</label>
                                    <input type="email" class="form-control" id="buyerEmail" name="buyerEmail" value="daeunj404@gmail.com">
                                </div>
                                <div class="form-group">
                                    <label for="buyerName">고객 이름</label>
                                    <input type="text" class="form-control" id="buyerName" name="buyerName" value="정다은">
                                </div>
                                <div class="form-group">
                                    <label for="buyerTel">고객 전화번호</label>
                                    <input type="text" class="form-control" id="buyerTel" name="buyerTel" value="010-8971-9641">
                                </div>
                                <button type="button" class="btn btn-primary" onclick="submitForm()">검색</button>
                            </form>
                            <!-- 고객명 검색을 위한 폼 끝 -->
                            <table id="paymentTable" class="table table-hover">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>진료코드</th>
                                    <th>구분</th>
                                    <th>진료항목</th>
                                    <th>수량</th>
                                    <th>금액</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- 여기에 데이터가 추가될 것입니다. -->
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="6" style="text-align: right;">합계</td>
                                    <td id="totalAmountValue">원</td>
                                    <td></td>
                                </tr>
                                </tfoot>
                            </table>
                            <div class="stock-footer">
                                <button type="button">선택 취소</button>&nbsp;
                            </div>
                            <!-- 하단 버튼 -->
                            <div class="stock-footer">
                                <button type="button" class="btn btn-outline-warning">온라인결제</button>
                                <button type="button" class="btn btn-outline-success">현금결제</button>
                            </div>

                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                </div>
            </div>
        </section>
        <!-- /.content -->
        <!-- 결제 정보 출력을 위한 모달 -->
        <div class="modal fade" id="paymentReceiptModal" tabindex="-1" aria-labelledby="paymentReceiptModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="paymentReceiptModalLabel">결제 정보</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p id="impUid"></p>
                        <p id="paidAmount"></p>
                        <p id="applyNum"></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.content-wrapper -->
<script>
    // 고객 정보를 저장할 변수 선언
    var merchantUid, orderName, amount, buyerEmail, buyerName, buyerTel;

    // 폼 제출 함수
    function submitForm() {
        // 입력된 정보 가져오기
        merchantUid = document.getElementById("merchantUid").value;
        orderName = document.getElementById("orderName").value;
        amount = document.getElementById("amount").value;
        buyerEmail = document.getElementById("buyerEmail").value;
        buyerName = document.getElementById("buyerName").value;
        buyerTel = document.getElementById("buyerTel").value;

        // 확인 메시지 표시 (테스트용)
        alert("고객 정보가 저장되었습니다.");
    }
    // IMP 객체를 전역 변수로 선언하고, 상점에서 발급받은 식별키로 초기화
    var IMP = window.IMP;
    IMP.init("imp80707007");

    // 결제 요청 함수 정의
    function requestPay() {
        // IMP 객체를 사용하여 결제 요청
        IMP.request_pay({
            pg: 'tosspay.tosstes',  // 결제 수단 지정
            // kakaopay.TC0ONETIME / tosspay.tosstest / payco.AUTOPAY / html5_inicis
            pay_method: 'card',          // 결제 수단 (카드 결제)
            merchant_uid: order_1,
            name: orderName,
            amount: amount,
            buyer_email: buyerEmail,
            buyer_name: buyerName,
            buyer_tel: buyerTel
            //m_redirext_url: 'https://api.iamport.kr/payments/imp80707007' // '{모바일에서 결제 완료 후 리디렉션 될 URL}'
        }, function (rsp) { // callback 로직
            if (rsp.success) {
                // 결제 성공 시 서버로 결제 정보를 전송하여 확인
                jQuery.ajax({
                    url: "/payments/complete",  // 서버 측 결제 완료 처리를 위한 엔드포인트
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid: rsp.imp_uid  // 결제 고유 식별자를 서버로 전송
                        // 필요한 경우 추가 데이터를 함께 전송
                    }
                }).done(function (data) {
                    // 결제 정보가 확인되고 서비스 루틴이 정상인 경우
                    if (everything_fine) {
                        var msg = '결제가 완료되었습니다.';
                        msg += '\n고유 식별자: ' + rsp.imp_uid;
                        msg += '\n상점 거래 ID: ' + rsp.merchant_uid;
                        msg += '\결제 금액: ' + rsp.paid_amount;
                        msg += '카드 승인 번호: ' + rsp.apply_num;

                        alert(msg);

                        // 모달 보이기
                        $('#paymentReceiptModal').modal('show');
                    } else {
                        // 결제가 정상적으로 이루어지지 않은 경우 처리
                        // 또는 요청된 금액과 결제된 금액이 다른 경우 처리
                    }
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
