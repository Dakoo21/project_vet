<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>고객예약등록</title>
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
    <!-- daterange picker -->
    <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="../../dist/css/reserveInsert.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/sidebar.jsp"%>
<div class="wrapper">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Main content -->
        <section class="content">
            <%-- 예약 버튼 --%>
            <button id="reservationButton">예약</button>
                <h5>버튼 클릭! 예약화면이 만들어진다면 버튼을 옮기겠습니다</h5>
            <div id="reservationModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <!-- 예약 양식 -->
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">고객진료예약등록</h3>
                        </div>
                        <div class="card-body">
                            <!-- 보호자명 -->
                            <div class="form-group" style="display: inline-block; width: 240px;">
                                <label for="guardianName" style="display: inline-block; width: 70px;">보호자명</label>
                                <input type="text" id="guardianName" class="form-control" placeholder="입력해 주세요" style="display: inline-block; width: 150px;">
                            </div>
                            <!-- 동물선택 -->
                            <div class="form-group" style="display: inline-block; width: 240px;">
                                <label style="display: inline-block; width: 70px;">환축명</label>
                                <select class="form-control select2" style="display: inline-block; width: 150px;">
                                    <option selected="selected">선택</option>
                                    <option>동물1</option>
                                    <option>동물2</option>
                                    <option>동물3</option>
                                </select>
                            </div>
                            <!-- 예약일 -->
                            <div class="form-group" style="display: inline-block; width: 240px;">
                                <label for="reservationdate" style="display: inline-block; width: 70px;">예약일</label>
                                <input type="date" id="reservationdate" class="form-control" style="display: inline-block; width: 150px;">
                            </div>
                            <!-- 예약시간 -->
                            <div class="form-group" style="display: inline-block; width: 240px;">
                                <label style="display: inline-block; width: 70px;">예약시간</label>
                                <select class="form-control select2" style="display: inline-block; width: 150px;">
                                    <option selected="selected">선택</option>
                                    <option>오전 10:00</option>
                                    <option>오전 10:30</option>
                                    <option>오전 11:00</option>
                                    <option>오전 11:30</option>
                                    <option>오후 12:00</option>
                                    <option>오후 12:30</option>
                                    <option>오후 1:00</option>
                                    <option>오후 1:30</option>
                                    <option>오후 2:00</option>
                                    <option>오후 2:30</option>
                                    <option>오후 3:00</option>
                                    <option>오후 3:30</option>
                                    <option>오후 4:00</option>
                                    <option>오후 4:30</option>
                                    <option>오후 5:00</option>
                                    <option>오후 5:30</option>
                                    <option>오후 6:00</option>
                                    <option>오후 6:30</option>
                                    <option>오후 7:00</option>
                                    <option>오후 7:30</option>
                                </select>
                            </div>
                            <!-- 예약구분 -->
                            <div class="form-group" style="display: inline-block; width: 240px;">
                                <label style="display: inline-block; width: 70px;">예약구분</label>
                                <select class="form-control select2" style="display: inline-block; width: 150px;">
                                    <option selected="selected">선택</option>
                                    <option>진료</option>
                                    <option>미용</option>
                                </select>
                            </div>
                            <!-- 담당의 -->
                                <div class="form-group" style="display: inline-block; width: 240px;">
                                    <label style="display: inline-block; width: 70px;">담당의</label>
                                    <select class="form-control select2" style="display: inline-block; width: 150px;">
                                        <option selected="selected">선택</option>
                                        <option>원장</option>
                                        <option>부원장</option>
                                    </select>
                                </div>
                            <!-- 의심증상 -->
                            <div class="form-group">
                            <label>의심증상</label>
                            <textarea class="form-control" rows="3" placeholder="환축의 현재 상태를 기재해 주세요"></textarea>
                        </div>
                            <button id="reservationUpdateButton">수정</button>
                            <button id="reservationSaveButton">저장</button>
                        </div>
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.modal-content -->
            </div>
        </section>
        <!-- /.content -->
    </div>
</div>
<!-- /.content-wrapper -->
<script>
    // 예약 버튼 요소 가져오기
    var reservationButton = document.getElementById("reservationButton");

    // 모달 요소 가져오기
    var modal = document.getElementById("reservationModal");

    // 모달의 닫기 버튼 요소 가져오기
    var closeButton = document.querySelector(".close");

    // 예약 버튼을 클릭하면 모달 창 표시
    reservationButton.addEventListener("click", function() {
        modal.style.display = "block";
    });

    // 모달의 닫기 버튼을 클릭하면 모달 창 닫기
    closeButton.addEventListener("click", function() {
        modal.style.display = "none";
    });

    // 모달 외부를 클릭하면 모달 창 닫기
    window.addEventListener("click", function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    });

    <!--Date picker-->
        $('#reservationdate').datetimepicker({
        format: 'L'
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
<%@ include file="/include/footer.jsp"%>
</body>
</html>
