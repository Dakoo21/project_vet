<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList, java.util.HashMap" %>
<%@ page import="com.example.vet.model.Member" %>
<%
    List<Map<String,Object>> myDetail = (List)request.getAttribute("myDetailList");
    Map<String, Object> userDetail = myDetail.get(0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>내 정보</title>
    <%@ include file="/include/bootCommon.jsp" %>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        const dataUpdate = (event) => {
            document.querySelector("#myDetail").submit();
        }
    </script>
    <![endif]-->
    <style>
        hr {
            border-top: 3px solid black; /* 굵기 조절 */
            width: 98%; /* 가로 길이 조절 */
        }

        /* 더보기 링크 스타일 */
        h1 small a {
            color: black; /* 링크 색을 검정으로 설정 */
        }
        .card {
            height: 100%; /* 카드에도 높이를 100%로 설정 */
        }
    </style>
</head>
<body class="hold-transition sidebar-mini">
    <div class="wrapper">
        <%@ include file="/include/sidebar.jsp" %>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="noto-sans">내 정보</h1>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>
            <!-- Main content -->
            <section class="content">
                <!--여기 -->
                <div class="container-fluid">
                    <div class="row">
                        <%--<div class="col-md-3">
                            <!-- Profile Image -->
                            <div class="card card-primary card-outline">
                                <div class="card-body box-profile">
                                    <div class="text-center">
                                        <img class="profile-user-img img-fluid img-circle"
                                             src="../../dist/img/user4-128x128.jpg"
                                             alt="User profile picture">
                                    </div>
                                    <br>
                                    <br>
                                    <a href="#" class="btn btn-primary btn-block"><b>사진등록</b></a>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>--%>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <!-- /.card -->
                                    <div class="tab-pane" id="settings">
                                            <div class="form-group row">
                                                <label class="col-sm-2 col-form-label">이름:</label>
                                                <div class="col-sm-10">
                                                    <!-- 유저 아이디  -->
                                                    <span><%=userDetail.get("MEMBER_MEMBERNAME")%></span>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-sm-2 col-form-label">소속:</label>
                                                <div class="col-sm-10">
                                                    <span>동물생심</span>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-sm-2 col-form-label">아이디:</label>
                                                <div class="col-sm-10">
                                                    <!-- 아이디 넣을 자리 -->
                                                    <span><%=userDetail.get("MEMBER_ID")%></span>
                                                </div>
                                            </div>

                                                <div class="form-group row">
                                                    <label for="MEMBER_PW" class="col-sm-2 col-form-label">비빌번호:</label>
                                                    <div class="col-sm-2">
                                                        <%--<input type="password" class="form-control" id="MEMBER_PW" name="MEMBER_PW" placeholder="수정할 비빌번호를 입력하세요" onblur="validatePassword()">--%>
                                                        <div id="modal">
                                                            <button type="button" id="modalBtn" class="btn btn-primary btn-block" data-bs-toggle="modal" data-bs-target="#selectForm">비밀번호 변경</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            <form id="myDetail" action="/myDetailUpdate" method="post">
                                                <div class="form-group row">
                                                    <label for="inputExperience" class="col-sm-2 col-form-label">직위:</label>
                                                    <div class="col-sm-10">
                                                        <!-- 역활 (if 문으로 역활에 맞춰서 나타내기) -->
                                                        <%
                                                            String user_role = null;
                                                            Object memberRoleObj = userDetail.get("MEMBER_ROLE");
                                                            if (memberRoleObj != null && memberRoleObj instanceof String) {
                                                                String memberRole = (String) memberRoleObj;
                                                                if (memberRole.equals("ROLE_ADMIN")) {
                                                                    user_role = "관리자";
                                                                } else if (memberRole.equals("ROLE_MASTER")) {
                                                                    user_role = "부관리자";
                                                                } else if (memberRole.equals("ROLE_NURSE")) {
                                                                    user_role = "간호사";
                                                                } else if (memberRole.equals("ROLE_INFO")) {
                                                                    user_role = "데스크";
                                                                } else {
                                                                    user_role = "임시 사용자";
                                                                }
                                                            } else {
                                                                user_role = "임시 사용자";
                                                            }
                                                        %>
                                                        <span><%= user_role %></span>
                                                        <input type="hidden" id="MEMBER_ROLE" name="MEMBER_ROLE" value="<%=userDetail.get("MEMBER_ROLE")%>">
                                                    </div>
                                                </div>
                                                <input type="hidden" id="MEMBER_MEMBERNAME" name="MEMBER_MEMBERNAME" value="<%=userDetail.get("MEMBER_MEMBERNAME")%>">
                                                <div class="form-group row">
                                                    <label for="MEMBER_EMAIL" class="col-sm-2 col-form-label">이메일:</label>
                                                    <div class="col-sm-10">
                                                        <input type="email" class="form-control" id="MEMBER_EMAIL" name="MEMBER_EMAIL" value="<%=userDetail.get("MEMBER_EMAIL")%>" onblur="validateEmail()">
                                                    </div>
                                                </div>
                            <%--
                                                <div class="form-group row">
                                                    <label for="MEMBER_PHONE" class="col-sm-2 col-form-label">전화번호:</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="MEMBER_PHONE" name="MEMBER_PHONE" placeholder="010-1234-1234">
                                                    </div>
                                                </div>
                            --%>
                                                <div class="form-group row">
                                                    <label class="col-sm-2 col-form-label">전화번호:</label>
                                                    <div class="col-sm-10">
                                                        <%
                                                            String user_phone = null;
                                                            String memberPhoneObj = (String) userDetail.get("MEMBER_PHONE");
                                                            if (memberPhoneObj != null) {
                                                                user_phone = memberPhoneObj;
                                                            } else {
                                                                user_phone = "전화번호를 등록해주세요!";
                                                            }
                                                        %>
                                                        <input type="text" class="form-control" id="MEMBER_PHONE" name="MEMBER_PHONE" value="<%=user_phone%>" onblur="validatePhone()">
                                                    </div>
                                                </div>
                                                <!-- 우편 검색 API 넣어야됨 -->
                                                <div class="form-group row">
                                                    <label for="MEMBER_POSTCODE" class="col-sm-2 col-form-label">자택주소</label>
                                                    <div class="col-sm-8"> <!-- col-sm-8 추가 -->
                                                        <%
                                                            String user_postcode = null;
                                                            String memberPostcodeObj = (String) userDetail.get("MEMBER_POSTCODE");
                                                            if (memberPostcodeObj != null) {
                                                                user_postcode = memberPostcodeObj;
                                                            } else {
                                                                user_postcode = "주소를 등록해 주세요!";
                                                            }
                                                        %>
                                                        <input type="text" class="form-control" id="MEMBER_POSTCODE" name="MEMBER_POSTCODE" value="<%=user_postcode%>">
                                                    </div>

                                                    <div class="col-sm-2"> <!-- col-sm-2 추가 -->
                                                        <button type="button" class="btn btn-default" onclick="openZipcode()">우편번호 검색</button>
                                                    </div>

                                                </div>
                            <%--
                                                <div class="form-group row">
                                                    <label for="MEMBER_POSTCODE" class="col-sm-2 col-form-label"></label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="MEMBER_POSTCODE" name="MEMBER_POSTCODE" placeholder="우편번호">
                                                    </div>
                                                </div>
                            --%>
                                                <div class="form-group row">
                                                    <label for="MEMBER_ADDRESS" class="col-sm-2 col-form-label"></label>
                                                    <div class="col-sm-10">
                                                        <%
                                                            String user_address = null;
                                                            String memberaddressObj = (String) userDetail.get("MEMBER_ADDRESS");
                                                            if (memberaddressObj != null) {
                                                                user_address = memberaddressObj;
                                                            } else {
                                                                user_address = " ";
                                                            }
                                                        %>
                                                        <input type="text" class="form-control" id="MEMBER_ADDRESS" name="MEMBER_ADDRESS" value="<%=user_address%>">
                                                    </div>
                                                </div>
                            <%--
                                                <div class="form-group row">
                                                    <label for="MEMBER_ADDRESS" class="col-sm-2 col-form-label"></label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" id="MEMBER_ADDRESS" name="MEMBER_ADDRESS" placeholder="주소">
                                                    </div>
                                                </div>
                            --%>
                                            </form>
                                            <div class="form-group row">
                                                <label for="inputExperience" class="col-sm-2 col-form-label">기타정보:</label>
                                                <div class="col-sm-10">
                                                    <textarea class="form-control" id="inputExperience" placeholder="추가 정보를 입력해 주세요"></textarea>
                                                </div>
                                            </div>
                                    </div>
                                </div>
                                <div class="modal-footer" style="text-align: right;">
                                    <button type="button" class="btn btn-primary" onclick="dataUpdate()">수정</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <%-- model--%>
        <div class="modal" id="selectForm">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">변경할 비밀번호를 입력해주세요</h4>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form id="pwChange" action="/passwordUpdate" method="post">
                            <div class="form-group row">
                                <label for="MEMBER_MEMBERNAME" class="col-sm-2 col-form-label">이름:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="MEMBER_MEMBERNAME" name="MEMBER_MEMBERNAME" value="<%=userDetail.get("MEMBER_MEMBERNAME")%>" readonly>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="MEMBER_PW" class="col-sm-2 col-form-label">비밀번호:</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="MEMBER_PW" name="MEMBER_PW" placeholder="수정할 비밀번호를 입력하세요" onblur="validatePassword()">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer" style="text-align: right;">
                        <button type="button" class="btn btn-primary" onclick="passwordChange()">변경</button>
                    </div>
                </div>
            </div>
        </div>
        <!--footer-->
        <%@ include file="/include/footer.jsp" %>
    </div>
    <!-- ./wrapper -->
    <%@ include file="/include/bootCommonFoot.jsp" %>
<script>
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
                document.getElementById("MEMBER_ADDRESS").value = addr;//주소
                document.getElementById("MEMBER_POSTCODE").value =  data.zonecode;//우
            }
        }).open();
    }

    //비밀번호 정규식표현
    const expPwText = /^[A-Za-z0-9]{4,12}$/;
    //핸드폰 정규식표현
    const expPhoneText = /^\d{3}-\d{3,4}-\d{4}$/;
    //이메일 정규실표현
    const expEmailText = /^[a-zA-Z0-9._+=-]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$/;

    const validateForm = () => {
        // 각 입력 필드에 대한 개별 유효성 검사 함수를 호출합니다.
        const isPasswordValid = validatePassword();
        const isPhoneValid = validatePhone();
        const isEmailValid = validateEmail();


        // 모든 검사가 통과되면 true를 반환하고, 그렇지 않으면 false를 반환합니다.
        return isPasswordValid && isPhoneValid && isEmailValid;
    }

    const validatePassword = () => {
        const pwSpan = document.getElementById('pw');
        const mbrPwInput = document.getElementById('MEMBER_PW');
        const isValid = expPwText.test(mbrPwInput.value);

        if (isValid) {
            pwSpan.style.display = 'none';
        } else {
            //pwSpan.style.display = 'inline';
            mbrPwInput.type = 'text';
            mbrPwInput.style.color = 'red';
            mbrPwInput.value = "대소문자와 숫자 4~12자리로 입력하세요."
        }
        mbrPwInput.onclick = function() {
            mbrPwInput.type = 'password';
            mbrPwInput.style.color = ''; // 글자색 초기화
            mbrPwInput.value = ''; // 입력값 초기화
        };

        return isValid;
    }

    const validateEmail = () => {
        const emailSpan = document.getElementById('email');
        const mbrEmailInput = document.getElementById('MEMBER_EMAIL');
        const isValid = expEmailText.test(mbrEmailInput.value);

        if (isValid) {
            emailSpan.style.display = 'none';
        } else {
            //emailSpan.style.display = 'inline';
            mbrEmailInput.style.color = 'red';
            mbrEmailInput.value = "이메일형식이 아닙니다."
        }
            mbrEmailInput.onclick = function() {
                mbrEmailInput.style.color = ''; // 글자색 초기화
                mbrEmailInput.value = ''; // 입력값 초기화
            };
        return isValid;
    }

    const validatePhone = () => {
        const numberSpan = document.getElementById('number');
        const mbrPhoneInput = document.getElementById('MEMBER_PHONE');
        const isValid = expPhoneText.test(mbrPhoneInput.value);

        if (isValid) {
            numberSpan.style.display = 'none';
        } else {
            //numberSpan.style.display = 'inline';
            mbrPhoneInput.style.color = 'red';
            mbrPhoneInput.value = "전화번호 형식이 아닙니다."
        }

        mbrPhoneInput.onclick = function() {
            mbrPhoneInput.style.color = ''; // 글자색 초기화
            mbrPhoneInput.value = ''; // 입력값 초기화
        };

        return isValid;
    }

    $(document).ready(function() {
        $("#modalBtn").click(function() {
            // 클릭 이벤트 핸들러 함수가 실행되는지 확인하기 위해 콘솔에 메시지 출력
            console.log("버튼이 클릭되었습니다.");
            $('#selectForm').modal('show');
        });
    });

    const passwordChange = (event) => {
      document.querySelector("#pwChange").submit();
    }

</script>
</body>
</html>

