e<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>동물생심 | Registration Page</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    $(document).ready(function(){
      $("#datepicker").datepicker();
    });

    const singUP = (event) => {
      document.querySelector("#memberJoin").submit();
    };
  </script>
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="../../index2.html"><b>동물</b>생심</a>
  </div>

  <div class="card">
    <div class="card-body register-card-body">
      <p class="login-box-msg">Register a new membership</p>

      <form id="memberJoin" action="joinMember" method="post">

        <label for="MEMBER_ID">아이디 <span class="text-danger">*</span>
          <span id="id" class="text-danger" style="display:none">4~12글자 영어나 숫자로 입력하세요</span>
          <span id="idd" class="text-danger" style="display:none">중복된 아이디 입니다.</span>
        </label>
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="ID" id="MEMBER_ID" name="MEMBER_ID" onblur="validateId()">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>

        <label for="MEMBER_PW">비밀번호 <span class="text-danger">*</span>
          <span id="pw" class="text-danger" style="display:none"> 대소문자와 숫자 4~12자리로 입력하세요.</span>
        </label>
        <div class="input-group mb-3">
            <input type="password" class="form-control" placeholder="Password" id="MEMBER_PW" name = "MEMBER_PW" onblur="validatePassword()">
        <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>

        <label for="MEMBER_PWD">비밀번호 확인 <span class="text-danger">*</span>
          <span id="pwd" class="text-danger" style="display:none">비밀번호가 일치하지않습니다.</span>
        </label>
        <div class="input-group mb-3">
          <input type="password" class="form-control" placeholder="Retype password" id="MEMBER_PWD" name="MEMBER_PWD" onblur="validatePassword2()">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>

        <label for="MEMBER_MEMBERNAME">이름 <span class="text-danger">*</span>
          <span id="nm" class="text-danger" style="display:none">2~5글자로 입력해주세요.</span>
        </label>
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Full name" id="MEMBER_MEMBERNAME" name = "MEMBER_MEMBERNAME" onblur="validateName()">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>

        <label for="MEMBER_EMAIL">이메일 <span class="text-danger">*</span>
          <span id="email" class="text-danger" style="display:none"  >이메일형식이 아닙니다.</span>
        </label>
        <div class="input-group mb-3">
          <input type="email" class="form-control" placeholder="Email" id="MEMBER_EMAIL" name="MEMBER_EMAIL" onblur="validateEmail()">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        </div>

        <label for="MEMBER_ADDRESS">주소</label>
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Postcode" id="MEMBER_POSTCODE" name="MEMBER_POSTCODE">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          <div class="input-group-append">
            <button class="btn btn-success" type="button" id="search-btn" onclick="openZipcode()">검색</button>
          </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Address" id="MEMBER_ADDRESS" name = "MEMBER_ADDRESS">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="agreeTerms" name="terms" value="agree">
              <label for="agreeTerms">
                I agree to the <a href="#">terms</a>
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="submit" class="btn btn-primary btn-block" onclick="singUP()">Register</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <a href="/login" class="text-center">I already have a membership</a>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<script>
  //회원가입 우편번호찾기
  // 여기배포햇나? -head에 위치 - 호이스팅이슈
  // 단-DOM 읽혀진 이후에만 접근이 가능하다 - undefined - 배포위치 고려해본다 -기준
  const openZipcode = () => {
    new daum.Postcode({//Postcode객체 생성하기  - 생성하자마자 내부에 구현하기가 전기해고있다
      oncomplete: function(data) {//완료되었을때 - 요청에 대한 응답이 완료되었을때 -이벤트처리
        let addr = '';
        if (data.userSelectedType === 'R') {
          addr = data.roadAddress;//도로명
        } else {
          addr = data.jibunAddress;//지번
        }
        console.log(data);
        console.log(addr);
        //console.log(post.postNum);
        //setPost({...post, zipcode:data.zonecode, addr:addr}) ;
        // document.querySelector("#mem_zipcode").value = data.zonecode;//우편번호
        // document.querySelector("#mem_address").value = addr;//주소
        document.getElementById("MEMBER_ADDRESS").value = addr;//주소
        document.getElementById("MEMBER_POSTCODE").value =  data.zonecode;//우
        //document.getElementById("postDetail").focus();
      }
    }).open();
  }

  // 정규표현식 패턴 상수 선언
  //아이디 정규식표현
  const expIdText = /^[A-Za-z0-9]{4,12}$/;
  //비밀번호 정규식표현
  const expPwText = /^[A-Za-z0-9]{4,12}$/;
  //이름 정규식표현
  const expNameText = /^[가-힣]{2,5}$/;
  //이메일 정규실표현
  const expEmailText = /^[a-zA-Z0-9._+=-]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$/;

  const validateForm = () => {
    // 각 입력 필드에 대한 개별 유효성 검사 함수를 호출합니다.
    const isIdValid = validateId();
    const isPasswordValid = validatePassword();
    const isNameValid = validateName();
    const isEmailValid = validateEmail();
    const isPassword2Valid = validatePassword2();


    // 모든 검사가 통과되면 true를 반환하고, 그렇지 않으면 false를 반환합니다.
    return isIdValid && isPasswordValid && isNameValid && isEmailValid && isPassword2Valid;
  }

  // 개별 유효성 검사 함수
  const validateId = () => {
    const idSpan = document.getElementById('id');
    const id2 = document.getElementById('idd');
    const mbrIdInput = document.getElementById('MEMBER_ID');

    const id = document.getElementById('MEMBER_ID').value;
    const isValid = expIdText.test(mbrIdInput.value);

    if (isValid) {
      id2.style.display = 'none';
      $.ajax({
        type: 'POST',
        url: '/checkId',
        data: {id : id },
        success: function(cnt) {
          // 서버로부터의 응답 처리
          if (cnt == 0){
            idSpan.style.display = 'none';
          }else{
            id2.style.display = 'inline';
          }
        },
        error: function(error) {
          // 오류 처리
          alert("에러입니다");
        }
      });
    } else {
      id2.style.display = 'none';
      idSpan.style.display = 'inline';
    }
    return isValid;
  }

  const validatePassword = () => {
    const pwSpan = document.getElementById('pw');
    const mbrPwInput = document.getElementById('MEMBER_PW');
    const isValid = expPwText.test(mbrPwInput.value);

    if (isValid) {
      pwSpan.style.display = 'none';
    } else {
      pwSpan.style.display = 'inline';
    }

    return isValid;
  }
  const validatePassword2 = () => {
    const pwdSpan = document.getElementById('pwd');
    const mbrPwdInput = document.getElementById('MEMBER_PWD');
    const mbrPwInput = document.getElementById('MEMBER_PW');
    const isValid = mbrPwdInput.value;


    if (mbrPwdInput.value == mbrPwInput.value) {
      pwdSpan.style.display = 'none';
    } else {
      pwdSpan.style.display = 'inline';
    }

    return isValid;
  }

  const validateName = () => {
    const nmSpan = document.getElementById('nm');
    const mbrNmInput = document.getElementById('MEMBER_MEMBERNAME');
    const isValid = expNameText.test(mbrNmInput.value);

    if (isValid) {
      nmSpan.style.display = 'none';
    } else {
      nmSpan.style.display = 'inline';
    }

    return isValid;
  }

  const validateEmail = () => {
    const emailSpan = document.getElementById('email');
    const mbrEmailInput = document.getElementById('MEMBER_EMAIL');
    const isValid = expEmailText.test(mbrEmailInput.value);

    if (isValid) {
      emailSpan.style.display = 'none';
    } else {
      emailSpan.style.display = 'inline';
    }

    return isValid;
  }

</script>
</body>
</html>
