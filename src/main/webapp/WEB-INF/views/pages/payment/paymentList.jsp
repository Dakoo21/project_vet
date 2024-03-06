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
                        <h1>결제페이지</h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="callout callout-info">
                            <h5><i class="fas fa-globe"></i> 동물생심</h5>
                            서울특별시 금천구 가산디지털2로 95 KM타워
                        </div>


                        <!-- Main content -->
                        <div class="invoice p-3 mb-3">
                            <!-- title row -->
                            <div class="row">
                                <div class="col-12">
                                    <h4>
                                        <i class="fas fa-info"></i> 수납정보
                                        <small class="float-right" id="currentDate"></small>
                                    </h4>
                                </div>
                                <!-- /.col -->
                                <script>
                                    // 현재 날짜를 가져오는 함수
                                    function getCurrentDate() {
                                        var today = new Date();
                                        var dd = String(today.getDate()).padStart(2, '0');
                                        var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
                                        var yyyy = today.getFullYear();

                                        today = mm + '/' + dd + '/' + yyyy;
                                        return today;
                                    }

                                    // 페이지가 로드될 때 실행되는 함수
                                    window.onload = function() {
                                        // 현재 날짜를 가져와서 요소에 삽입
                                        document.getElementById('currentDate').innerHTML = "Date: " + getCurrentDate();
                                    };
                                </script>
                            </div>
                            <!-- info row -->
                            <div class="row invoice-info">
                                <form id="f_payment" method="post" action="./paymentInsert">
                                    <input type="hidden" name="method" value="memberInsert">

                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control" id="buyer_name" name="buyer_name" placeholder="buyer_name" />
                                                        <label for="buyer_name">고객명</label>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control" id="buyer_tel" name="buyer_tel" placeholder="buyer_tel" />
                                                        <label for="buyer_tel">연락처</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control" id="merchant_uid" name="merchant_uid" placeholder="merchant_uid" value="order<%= new java.util.Date().getTime() %>" readonly />
                                                        <label for="merchant_uid">주문번호</label>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control" id="paid_amount" name="paid_amount" placeholder="paid_amount" />
                                                        <label for="paid_amount">결제금액</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-floating mb-8">
                                                        <input type="text" class="form-control" id="pg_provider" name="pg_provider" placeholder="pg_provider" />
                                                        <label for="pg_provider">PG사</label>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-floating mb-8">
                                                        <input type="text" class="form-control" id="paid_at" name="paid_at" placeholder="paid_at" />
                                                        <label for="paid_at">결제시각</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-floating mb-8">
                                                        <input type="text" class="form-control" id="status" name="status" placeholder="status" />
                                                        <label for="status">결제상태</label>
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-floating mb-8">
                                                        <input type="text" class="form-control" id="pg_tid" name="pg_tid" placeholder="pg_tid" />
                                                        <label for="pg_tid">거래번호</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
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
                                            <th>진료코드</th>
                                            <th>세부사항</th>
                                            <th>금액</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>service_nm</td>
                                            <td>service_code</td>
                                            <td>세부정보</td>
                                            <td>service_price</td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>service_nm</td>
                                            <td>service_code</td>
                                            <td>세부정보</td>
                                            <td>service_price</td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>service_nm</td>
                                            <td>service_code</td>
                                            <td>세부정보</td>
                                            <td>service_price</td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>service_nm</td>
                                            <td>service_code</td>
                                            <td>세부정보</td>
                                            <td>service_price</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->

                            <div class="row">
                                <!-- accepted payments column -->
                                <div class="col-6">

                                </div>
                                <!-- /.col -->
                                <div class="col-6">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tr>
                                                <th>합계:</th>
                                                <td>sum</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->

                            <!-- this row will not appear when printing -->
                            <div class="row no-print">
                                <div class="col-12">
                                    <button type="button" class="btn btn-success float-right" onclick="requestPay()"><i class="far fa-credit-card"></i> QR결제
                                    </button>
                                    <button type="button" class="btn btn-primary float-right" style="margin-right: 5px;">
                                        <i class="fa fa-money-bill"></i> 현금결제
                                    </button>
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
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<script>
    // 현금결제 버튼 클릭 시 동작
    function requestCashPay() {
        // 알림창으로 현금으로 결제하시겠습니까? 메시지 표시
        const confirmCashPayment = confirm("현금으로 결제하시겠습니까?");

        if (confirmCashPayment) {
            // "네" 버튼 클릭 시 현금 결제를 완료한 후 확인 버튼을 눌라는 메시지 표시
            const cashPaymentComplete = confirm("현금 결제를 완료한 후 확인 버튼을 눌러주세요.");

            if (cashPaymentComplete) {
                // "확인" 버튼 클릭 시 paymentModal2로 이동 및 paymentModal 닫기
                openPaymentModal2();
            }
        } else {
            // "아니오" 버튼 클릭 시 알림창 닫기
            alert("결제가 취소되었습니다.");
        }
    }
</script>

<script>
    // QR결제 요청 함수 정의
    function requestPay() {
        console.log("결제가 진행됩니다");

        // 폼 양식에서 입력된 정보 가져오기
        var merchant_uid = document.getElementById("merchant_uid").value;
        var buyer_tel = document.getElementById("buyer_tel").value;
        var buyer_name = document.getElementById("buyer_name").value;
        /*var paid_amount = document.getElementById("paid_amount").value;*/

        var IMP = window.IMP;
        IMP.init("imp80707007");

        // IMP 객체를 사용하여 결제 요청
        IMP.request_pay({
            pg: 'kakaopay.TC0ONETIME',  // 결제 수단 지정
            // kakaopay.TC0ONETIME / tosspay.tosstest / payco.AUTOPAY / html5_inicis
            merchant_uid: merchant_uid,  // 주문번호
            pg_provider: null,
            paid_at: null,
            status: null,
            pg_tid: null,
            name: 'test_order', // 주문명
            amount: document.getElementById("paid_amount").value,
            buyer_name: buyer_name,     // 구매자 이름
            buyer_tel: buyer_tel,        // 구매자 전화번호
        }, function(rsp) { // callback 로직
            console.log("콜백 시작");
            console.log(rsp);
            if (rsp.success) {
                console.log("rsp.success");
                document.getElementById("buyer_name").value = rsp.buyer_name;
                document.getElementById("buyer_tel").value = rsp.buyer_tel;
                document.getElementById("merchant_uid").value = rsp.merchant_uid;
                document.getElementById("paid_amount").value = rsp.paid_amount;
                document.getElementById("pg_provider").value = rsp.pg_provider;
                document.getElementById("paid_at").value = rsp.paid_at;
                document.getElementById("status").value = rsp.status;
                document.getElementById("pg_tid").value = rsp.pg_tid;

                // 결제가 완료되었습니다 알림창 띄우기
                alert("결제가 완료되었습니다.");

                // 결제 성공 시 서버로 결제 정보 전송
                jQuery.ajax({
                    url: "/payment/paymentInsert",
                    method: "POST",
                    data: {
                        imp_uid: rsp.imp_uid,            // 결제 고유번호
                        merchant_uid: rsp.merchant_uid,   // 주문번호
                        pg_tid: rsp.pg_tid,
                        name: rsp.name,   // 주문명
                        amount: rsp.amount,   // 결제 금액
                        paid_amount: rsp.paid_amount,   // 결제 금액
                        buyer_name: rsp.buyer_name,     // 구매자 이름
                        buyer_tel: rsp.buyer_tel        // 구매자 전화번호
                    },
                    error: function(xhr, status, error) { // 요청이 실패했을 때의 처리
                        console.error("서버 요청 실패:", error);
                    }
                });
            } else {
                // 결제가 실패하였습니다 알림창 띄우기
                alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
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

<%@ include file="/include/footer.jsp"%>
</body>
</html>