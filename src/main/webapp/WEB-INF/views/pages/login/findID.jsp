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
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="/login"><b>동물</b>생심</a>
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">Try to find your ID</p>

            <form id="f_ID" action="/findid" method="post">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="MEMBER_MEMBERNAME" name="MEMBER_MEMBERNAME" placeholder="Full name" required>
                    <div class="input-group-append">
                        <div class="input-group-text">
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="email" class="form-control" id="MEMBER_EMAIL" name="MEMBER_EMAIL" placeholder="Email" required>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <label>
                    <span id="foundID" class="form-control" style="display:none"> 입니다.</span>
                    <span id="notFoundID" class="form-control" style="display:none"> 가 존재하지 않습니다.</span>
                </label>
                <div class="row">
                    <div class="col-4">
                        <button type="button" class="btn btn-primary btn-block" onclick="findID()">아이디 찾기</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <p class="mb-1">
                <a href="/findPassword">Found out Password</a>
            </p>
            <p class="mb-0">
                <a href="/login" class="text-center">Go to Sign in</a>
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
