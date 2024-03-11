<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>사원관리 </title>
    <%@ include file="/include/bootCommon.jsp" %>

    <script>

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
                        <h1 class="noto-sans">사원관리</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                            <li class="breadcrumb-item active">Icons</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <!--여기 -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3">
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
                    </div>

            <div class="col-md-9">
                <div class="card">
            <div class="card-body">
            <!-- /.card -->
            <div class="tab-pane" id="settings">
                <form id="" class="form-horizontal">
                    <div class="form-group row">
                        <label for="Emp_Nm" class="col-sm-2 col-form-label">이름:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Emp_Nm" name="Emp_Nm" placeholder="Name">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">소속:</label>
                        <div class="col-sm-10">
                            <p class="form-control">동물생심</p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputExperience" class="col-sm-2 col-form-label">직위:</label>
                        <div class="col-sm-10">
                            <select id="select" class="form-control">
                                <option value="">간호사</option>
                                <option value="1">의사</option>
                                <option value="2">관리자</option>
                                <!-- 필요한 만큼 옵션을 추가하세요 -->
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="Emp_email" class="col-sm-2 col-form-label">이메일:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Emp_email" name="Emp_email" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="Emp_Pnumber" class="col-sm-2 col-form-label">전화번호:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Emp_Pnumber" name="Emp_Pnumber" placeholder="010-1234-1234">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputExperience" class="col-sm-2 col-form-label">입사일:</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="Emp_Bdate" name="Emp_Bdate" />
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="Emp_username" class="col-sm-2 col-form-label">아이디:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Emp_username" name="Emp_username" placeholder="id">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="Emp_pw" class="col-sm-2 col-form-label">비밀번호:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Emp_pw" name="Emp_pw" placeholder="pw">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="EMP_Postcode" class="col-sm-2 col-form-label">자택주소</label>
                        <div class="col-sm-8"> <!-- col-sm-8 추가 -->
                            <input type="text" class="form-control" id="EMP_Postcode" placeholder="우편번호">
                        </div>
                        <div class="col-sm-2"> <!-- col-sm-2 추가 -->
                            <button type="button" class="btn btn-default" >우편번호 검색</button>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="EMP_Address" class="col-sm-2 col-form-label"></label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="EMP_Address" placeholder="동호수">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputExperience" class="col-sm-2 col-form-label">기타정보:</label>
                        <div class="col-sm-10">
                            <textarea class="form-control" id="inputExperience" placeholder="컬럼이 맞는지 수정부분 말씀해주시면 수정하겠습니다."></textarea>
                        </div>
                    </div>


                </form>
            </div>
            </div>
                    <div class="modal-footer" style="text-align: right;">
                        <button type="button" class="btn btn-default" data-dismiss="modal">삭제</button>
                        <button type="button" class="btn btn-primary">수정</button>
                        <button type="button" class="btn btn-primary">등록</button>
                    </div>
                </div>

            </div>










</div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!--footer-->
    <%@ include file="/include/footer.jsp" %>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp" %>
</body>
</html>

