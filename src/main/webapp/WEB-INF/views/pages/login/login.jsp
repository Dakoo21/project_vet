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
    <script>
        function requestYJ() {
            if (window.event.keycode == 13) {
                login();
            }
        }

        const login = (event) => {
            document.querySelector("#f_login").submit();
        };

        const loginG = (event) => {
            console.log("google 로그인 호출");
            location.href = "/oauth2/authorization/google";
        };

        const loginK = (event) => {
            console.log("kakao 로그인 호출")
            location.href = "/oauth2/authorization/kakao";
        };

        const loginN = (event) => {
            console.log("naver 로그인 호출")
            location.href = "/oauth2/authorization/naver"
        };
    </script>
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="/login"><b>동물</b>생심</a>
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">Sign in to start your session</p>
            <form id="f_login" action="/loginProcess" method="post">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="MEMBER_ID" name="MEMBER_ID" placeholder="ID" required>
                    <div class="input-group-append">
                        <div class="input-group-text">
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" id="MEMBER_PW" name="MEMBER_PW" placeholder="Password" required>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-8">
                        <div class="icheck-primary">
                            <input type="checkbox" id="remember">
                            <label for="remember">
                                기억하기
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-4">
                        <button type="button" class="btn btn-primary btn-block" onclick="login()" onkeyup="requestYJ()">로그인</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <div class="social-auth-links text-center mb-3">
                <p>- OR -</p>
                <button type="button" class="btn btn-block btn-success" onclick="loginN()"> Naver Login</button>
                <button type="button" class="btn btn-block btn-warning" onclick="loginK()">Kakao Login</button>
                <button type="button" class="btn btn-block bg-light.bg-gradient" onclick="loginG()">
                    <i class="fab fa-google-plus mr-2"></i> Google
                </button>
            </div>
            <!-- /.social-auth-links -->

            <p class="mb-1">
                <a href="/findID">ID 찾기</a>
            </p>
            <p class="mb-1">
                <a href="/findPassword">비밀번호 찾기</a>
            </p>
            <p class="mb-0">
                <a href="/join" class="text-center">회원가입</a>
            </p>
        </div>
        <!-- /.login-card-body -->
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
</body>
</html>

<style typeof="text/css">

    .social-auth-links text-center mb-3 > .btn btn-block btn-success {
        background-color: #26E322;
    }
    .btn btn-block {
        border-color: black;
        border-style : solid;
    }

</style>
