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
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script></script>
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
                        <h1>진료기록조회</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Projects</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="card-body p-0">
                <table id = "medlogtableList" class="table table-striped projects">
                    <thead>
                    <tr>
                        <th style="width: 5%">
                            등록일시
                        </th>
                        <th style="width: 10%">
                            축종
                        </th>
                        <th style="width: 10%">
                            보호자
                        </th>
                        <th style="width: 20%" class="text-center">
                            연락처
                        </th>
                        <th style="width: 20%">
                            동물명
                        </th>
                        <th style="width: 5%" class="text-center">
                            차트번호
                        </th>
                        <th style="width: 15%"> 수납상태
                        </th>
                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>김보호</td>
                        <td>010-1111-1111</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button class="btn btn-info btn-sm openModalBtn">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>이보호</td>
                        <td>010-2222-2222</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button class="btn btn-info btn-sm openModalBtn">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>정보호</td>
                        <td>010-3333-3333</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button class="btn btn-info btn-sm openModalBtn">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>양보호</td>
                        <td>010-4444-4444</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button class="btn btn-info btn-sm openModalBtn">미수납</button></td>
                    </tr><tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>최보호</td>
                        <td>010-5555-5555</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button class="btn btn-info btn-sm openModalBtn">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>강보호</td>
                        <td>010-6666-6666</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button class="btn btn-info btn-sm openModalBtn">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>안보호</td>
                        <td>010-7777-7777</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button class="btn btn-info btn-sm openModalBtn">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>유보호</td>
                        <td>010-8888-8888</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button class="btn btn-info btn-sm openModalBtn">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>한보호</td>
                        <td>010-9999-9999</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button class="btn btn-info btn-sm openModalBtn">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>임보호</td>
                        <td>010-0000-0000</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button class="btn btn-info btn-sm openModalBtn">미수납</button></td>
                    </tr>
                    <tr>
                        <td>2024.02.01</td>
                        <td>강아지</td>
                        <td>서보호</td>
                        <td>010-1212-1212</td>
                        <td>여기는동물이름</td>
                        <td>20240201001</td>
                        <td><button class="btn btn-info btn-sm openModalBtn">미수납</button></td>
                    </tr>

                    </tbody>

                </table>
            </div>
            <!-- /.card-body -->
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

<%-- ===========================[modal]============================== --%>
<div id="paymentModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="invoice p-1 mb-1">
                        <div class="row invoice-info" id="invoiceInfo">
                            <!-- 여기에 주문번호, 진료일 및 고객 정보가 자동으로 생성 -->
                        </div>
                        <!-- /.row -->

                        <div class="row">
                            <div class="col-12 table-responsive">
                                <table id="modalTable" class="table table-striped">
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
                                        <tr id="totalRow"> <!-- 합계 표시를 위한 새로운 <tr> 태그 -->
                                            <td colspan="6" style="text-align: right;"><b>합계:</b></td> <!-- colspan은 표의 열 개수만큼 설정 -->
                                            <td id="totalAmountCell"></td> <!-- 합계 금액이 표시될 셀 -->
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
                                        <button type="button" class="btn btn-success btn-info" onclick="requestCashPay()"><i class="fa fa-money-bill"></i>현금결제</button>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn btn-success btn-primary" onclick="requestQRPay()"><i class="fa fa-qrcode"></i>QR결제</button>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn btn-success btn-secondary" onclick="requestCardPay()"><i class="far fa-credit-card"></i>신용카드</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.invoice -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // openModalBtn 함수를 버튼에 클릭 이벤트로 연결
        const buttons = document.querySelectorAll(".openModalBtn");
        buttons.forEach(function(button) {
            button.addEventListener("click", function() {
                openModalBtn(this); // 클릭된 버튼을 인자로 전달하여 함수 호출
            });
        });

        function openModalBtn(btn) {
            const row = btn.closest("tr");
            const invoiceElement = document.getElementById("invoiceInfo");

            // 인보이스 번호 생성 (임의의 숫자를 사용하여 간단하게 생성)
            const invoiceNumber = Math.floor(Math.random() * 1000000);
            let invoiceHTML = "<b>인보이스 번호:</b> #" + invoiceNumber + "\n";

            // 진료 날짜 생성
            const currentDate = new Date();
            const formattedDate = currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1).toString().padStart(2, '0') + "-" + currentDate.getDate().toString().padStart(2, '0');
            invoiceHTML += "<b>진료일:</b> " + formattedDate + "\n";

            // 고객 정보를 표시
            const buyer_name = row.cells[2].innerText;
            const buyer_tel = row.cells[3].innerText;
            invoiceHTML += "<b>고객명:</b> " + buyer_name;
            invoiceHTML += "<b>고객 연락처:</b> " + buyer_tel;
            invoiceElement.innerHTML = invoiceHTML;

            const table = document.getElementById("modalTable");

            // 진료항목별 금액을 합산
            let paid_amount = 0;
            table.querySelectorAll("td:nth-child(3)").forEach(function(td) {
                const amountString = td.innerText.replace(/,/g, ""); // 콤마(,) 제거
                const amount = parseFloat(amountString); // 부동 소수점 숫자로 변환
                if (!isNaN(amount)) { // NaN이 아닌 경우에만 합계에 추가
                    paid_amount += amount;
                } else {
                    console.warn("잘못된 숫자 형식입니다:", td.innerText);
                }
            });

            // 합계를 표시
            const totalAmountCell = document.getElementById("totalAmountCell");
            totalAmountCell.dataset.amount = paid_amount; // 데이터 속성으로 정수 값을 저장
            totalAmountCell.innerHTML = paid_amount + "원";

            // 모달 창 열기
            document.getElementById("paymentModal").style.display = "block";

            // 세션 스토리지에 정보 저장
            sessionStorage.setItem("invoiceNumber", invoiceNumber);
            sessionStorage.setItem("currentDate", formattedDate);
            sessionStorage.setItem("buyerName", buyer_name);
            sessionStorage.setItem("buyerTel", buyer_tel);
            sessionStorage.setItem("amount", paid_amount);

            /*// 모달창 내부의 buyer_name과 buyer_tel에 값을 설정
            document.getElementById("buyer_name").value = buyer_name;
            document.getElementById("buyer_tel").value = buyer_tel;*/
        }
        // 모달 창 닫기 버튼에 클릭 이벤트 리스너 추가
        document.getElementsByClassName("close")[0].addEventListener("click", function() {
            document.getElementById("paymentModal").style.display = "none";
        });


    });
</script>

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
    function openPaymentModal2() {
        // paymentModal 닫기
        document.getElementById("paymentModal").style.display = "none";
        // paymentModal2 열기
        document.getElementById("paymentModal2").style.display = "block";

        // 세션 스토리지에서 정보 읽기
        const invoiceNumber = sessionStorage.getItem("invoiceNumber");
        const currentDate = sessionStorage.getItem("currentDate");
        const buyerName = sessionStorage.getItem("buyerName");
        const buyerTel = sessionStorage.getItem("buyerTel");
        const amount = sessionStorage.getItem("amount");

        // 읽어온 정보를 활용하여 페이지 내용 업데이트
        document.getElementById("invoiceNumber").textContent = "인보이스 번호: #" + invoiceNumber;
        document.getElementById("currentDate").textContent = "진료일: " + currentDate;
        document.getElementById("buyerName").textContent = "고객명: " + buyerName;
        document.getElementById("buyerTel").textContent = "고객 연락처: " + buyerTel;
        document.getElementById("paymentAmountCell").textContent = amount + "원";
    }
</script>


<script>
    // IMP 객체를 전역 변수로 선언하고, 상점에서 발급받은 식별키로 초기화
    // IMP 변수가 이미 선언되었는지 확인하여 선언하지 않음
    if (typeof IMP === "undefined") {
        const IMP = window.IMP;
    }
    IMP.init("imp80707007");

    // QR결제 요청 함수 정의
    function requestQRPay() {
        console.log("결제가 진행됩니다");

        // IMP 객체를 사용하여 결제 요청
        IMP.request_pay({
            pg: 'kakaopay.TC0ONETIME',  // 결제 수단 지정
            // kakaopay.TC0ONETIME / tosspay.tosstest / payco.AUTOPAY / html5_inicis
            /*pg_tid: ,*/         //pg사 승인번호
            pay_method: "card",
            merchant_uid: "order" + new Date().getTime(),  // 주문번호
            name: 'test_order',   // 주문명
            amount: 100,   // 결제 금액
            buyer_name: "구매자 이름",     // 구매자 이름
            buyer_tel: "연락처",        // 구매자 전화번호
            m_redirect_url: "/"
        }, function(rsp) { // callback 로직
            console.log("콜백 시작");
            console.log(rsp);
            if (rsp.success) {
                console.log("rsp.success");
                // 결제가 완료되었습니다 알림창 띄우기
                alert("결제가 완료되었습니다.");

                // 결제 성공 시 서버로 결제 정보 전송
                jQuery.ajax({
                    url: "/work/process_payment",
                    method: "POST",
                    data: {
                        imp_uid: rsp.imp_uid,            // 결제 고유번호
                        merchant_uid: rsp.merchant_uid   // 주문번호
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

<!-- 모달 창 -->
<div id="paymentModal2" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="invoice p-1 mb-1">
                        <div class="row invoice-info">
                            <div class="col-6">
                                <b>결제일시:</b> <span id="paymentDate"></span>
                            </div>
                            <div class="col-6">
                                <b>주문번호:</b> <span id="orderNumber"></span>
                            </div>
                        </div>
                        <!-- /.row -->

                        <div class="row">
                            <div class="col-12 table-responsive">
                                <table id="modalTable2" class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>수량</th>
                                        <th>진료항목</th>
                                        <th>금액</th>
                                        <th>비고</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- 여기에 결제 항목이 추가될 수 있음 -->
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
                                        <tr id="paymentAmountRow"> <!-- 결제금액 표시를 위한 새로운 <tr> 태그 -->
                                            <td colspan="6" style="text-align: right;"><b>결제금액:</b></td>
                                            <td id="paymentAmountCell"></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.invoice -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
</div>

<script>
    // 모달 창 닫기 버튼에 클릭 이벤트 리스너 추가
    document.querySelector("#paymentModal2 .close").addEventListener("click", function() {
        // 모달 창 닫기
        document.getElementById("paymentModal2").style.display = "none";
    });
</script>

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>

<script>
    $(function () {
        $('#medlogtableList').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });
    });
</script>
<%@ include file="/include/footer.jsp"%>
</body>
</html>