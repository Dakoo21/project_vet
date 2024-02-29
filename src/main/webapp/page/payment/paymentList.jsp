<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    List<Map<String, Object>> dList = (List)request.getAttribute("dList");
%>
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
                        <h1>진료완료기록</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Projects</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
            <!-- 검색기 시작 -->
            <form id="searchForm" onsubmit="boardSearch(event)">
                <div class="row">
                    <div class="col-3">
                        <select id="gubun" name="gubun" class="form-select" aria-label="분류선택">
                            <option selected="selected">분류선택</option>
                            <option value="masterNm">고객명</option>
                            <option value="animalNm">반려동물명</option>
                        </select>
                    </div>
                    <div class="col-6">
                        <input type="text" id="keyword" name="keyword" class="form-control" placeholder="검색어를 입력하세요"
                               aria-label="검색어를 입력하세요" aria-describedby="btn_search" />
                    </div>
                    <div class="col-3">
                        <button type="submit" id="btn_search" class="btn btn-danger" onclick="boardSearch()">검색</button>
                    </div>
                </div>
            </form>

            <script>
                function boardSearch() {


                    var form = document.getElementById('searchForm');
                    var formData = new FormData(form);

                    var queryString = new URLSearchParams(formData).toString();
                    window.location.href = "localhost:8000/diag/diagList?" + queryString;
                }
            </script>
            <!--카테고리 버튼-->
            <div class="card-tools">
                <ul class="nav nav-pills ml-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="http://localhost:8080/diag/diagList" data-toggle="tab">전체조회</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/diag/diagList?species=dog" data-toggle="tab">강아지</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/diag/diagList?species=cat" data-toggle="tab">고양이</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="http://localhost:8080/diag/diagList?species=etc" data-toggle="tab">기타동물</a>
                    </li>
                </ul>
            </div>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="card-body p-0">
                <table id = "medlogtableList" class="table table-striped projects">
                    <thead>
                    <tr>
                        <th style="width: 5%" class="text-center">
                            차트번호
                        </th>
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
                        <th style="width: 15%"> 수납상태
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for(int i = 0 ; i<dList.size();i++){
                            Map<String, Object> rmap = dList.get(i);
                    %>
                    <%--<tr>
                        <td><%=rmap.get("diagPk")%></td>
                        <td><%=rmap.get("bookingDate")%></td>
                        <td><%=rmap.get("animalSpecies")%></td>
                        <td><%=rmap.get("masterNM")%></td>
                        <td><%=rmap.get("masterPhoneNumber")%></td>
                        <td><%=rmap.get("animalNM")%></td>
                        <td class="project-actions text-right">
                            <a class="btn btn-info btn-sm" href="http://localhost:8000/diag/diagDetail?diagPk=<%=rmap.get("diagPk")%>">
                                <i class="fas fa-pencil-alt"></i><%=rmap.get("commonCodeName")%></a>
                        </td>
                    </tr>--%>
                    <%
                        }
                    %>
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

<script>
    function redirectToPaymentPage() {
        // 버튼이 클릭된 행의 데이터를 가져올 수 있도록 원하는 정보를 추가해주세요
        // 예: 동물의 이름, 차트번호 등
        // 이동할 페이지에 해당 데이터를 전달하고 싶다면 쿼리 파라미터 형태로 추가하면 됩니다
        window.location.href = "paymentDetail.jsp"; // 이동할 페이지의 경로를 설정해주세요
    }
</script>
<%--
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
--%>



<%--
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
--%>

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
