<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>동물생심 | Log in</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/dist/css/adminlte.min.css">
    <%@include file="/include/common/bootstrap_common.jsp"%>
    <style>
        .social-auth-links .btn-success {
            background-color: #26E322;
            border-color: black;
            border-style: solid;
        }
    </style>

</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="/login"><b>동물</b>생심</a>
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">Find Your ID</p>
            <form id="f_id">
                <label for="MEMBER_MEMBERNAME">이름</label>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="MEMBER_MEMBERNAME" name="MEMBER_MEMBERNAME" placeholder="Full Name" required>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-user"></span>
                        </div>
                    </div>
                </div>
                <label for="MEMBER_EMAIL">이메일</label>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="MEMBER_EMAIL" name="MEMBER_EMAIL" placeholder="Email" required>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <!-- /.col -->
                    <div class="col-8"></div>
                    <div class="col-4">
                        <div id="modal">
                            <button type="button" id="modalBtn" class="btn btn-primary btn-block" data-bs-toggle="modal" data-bs-target="#selectForm">찾기</button>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <p class="mb-1">
                <a href="/findPassword">비밀번호 찾기</a>
            </p>
            <p class="mb-0">
                <a href="/login" class="text-center">로그인</a>
            </p>
        </div>
        <!-- /.login-card-body -->
    </div>
</div>

<div class="modal" id="selectForm">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">아이디를 알려드립니다!</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <label id="userIdInput">
                </label>

            </div>
        </div>
    </div>
</div>
<!-- /.login-box -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
<script>
    $(document).ready(function() {
        $("#modalBtn").click(function() {
            // 클릭 이벤트 핸들러 함수가 실행되는지 확인하기 위해 콘솔에 메시지 출력
            console.log("버튼이 클릭되었습니다.");

            // Ajax를 사용하여 서버에 데이터 조회 요청
            $.ajax({
                type: "POST",
                url: "/findid",
                data: {
                    name: $("#MEMBER_MEMBERNAME").val(),
                    email: $("#MEMBER_EMAIL").val()
                },
                success: function(response) {
                    // 서버로부터 응답이 왔을 때 실행되는 부분
                    // 응답이 성공적으로 돌아오면 모달창에 받아온 데이터를 표시하는 코드 실행
                    displayuserID(response.userID);
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 실행되는 부분
                    // 콘솔에 오류 메시지 출력하여 확인
                    console.error("오류 발생:", error);

                    // 사용자에게 오류 메시지를 알리기 위해 alert 창 표시
                    alert("데이터 조회 중 오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        });
    });

    function displayuserID(userID) {
        var userIdInput = $("#userIdInput");
        userIdInput.empty();
        if (userID != null) {
            var row = "<span>" + "당신의 아이디는 " + userID + " 입니다." + "</span>";
            userIdInput.append(row);
        } else {
            var row = "<span>" + "정보가 올바르지 않습니다." + "</span>";
            userIdInput.append(row);
        }
    }



</script>
</body>
</html>
