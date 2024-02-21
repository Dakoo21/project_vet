<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <style>
        /* 추가한 스타일 */
        .separator {
            margin-top: 20px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
        }
    </style>

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <%@ include file="/include/sidebar.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>예약신청</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Icons</li>
                        </ol>

                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <!--여기 -->
            <div class="separator"></div>

                    <form action="../../index.html" method="post">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="<%="현재 사용자명"%>">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <label class="input-group-text" for="animalSelect"><%= "동물 이름" %></label>
                            </div>
                            <select class="custom-select" id="animalSelect" name="animal">
                                <option selected>동물을 선택하세요...</option>
                                <option value="동물1">동물1</option>

                            </select>
                            <div class="input-group-append">

                                <div class="input-group-text">

                                    <span class="fas fa-user">

                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <label class="input-group-text" for="animalSelect"><%= "서비스 이름" %></label>
                            </div>
                            <select class="custom-select" id="typeSelect" name="bookingType">
                                <option selected>원하는 서비스를 선택하세요</option>
                                <option value="미용">미용</option>
                                <option value="진료">진료</option>

                            </select>
                            <div class="input-group-append">

                                <div class="input-group-text">

                                    <span class="fas fa-user">

                                    </span>
                                </div>
                            </div>
                        </div>
                        <div id="additionalInfo1" style="display: none;">
                            <!-- 미용 서비스를 선택했을 때 추가되는 내용 -->
                            <!-- 여기에 미용 서비스와 관련된 추가 정보를 입력하세요 -->
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <label class="input-group-text" for="designerSelect"><%= "디자이너 이름" %></label>
                                </div>
                                <select class="custom-select" id="designerSelect" name="bookingType">
                                    <option selected>디자이너를 선택하세요</option>
                                    <option value="미용사1">미용사1</option>
                                    <option value="미용사2">미용사2</option>


                                </select>
                                <div class="input-group-append">

                                    <div class="input-group-text">

                                    <span class="fas fa-user">

                                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="additionalInfo2" style="display: none;">
                            <!-- 진료 서비스를 선택했을 때 추가되는 내용 -->
                            <!-- 여기에 진료 서비스와 관련된 추가 정보를 입력하세요 -->
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <label class="input-group-text" for="docterSelect"><%= "의사 이름" %></label>
                                </div>
                                <select class="custom-select" id="docterSelect" name="bookingType">
                                    <option selected>의사를 선택하세요</option>
                                    <option value="의사1">의사1</option>
                                    <option value="의사2">의사2</option>


                                </select>
                                <div class="input-group-append">

                                    <div class="input-group-text">

                                    <span class="fas fa-user">

                                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="datepicker1" name="bookingStartDate">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-user"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="datepicker2" name="bookingStartDate">
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
                            <div class="col-4" id="submitButtonWrapper" style="display: none;">
                                <button type="submit" class="btn btn-primary btn-block">예약</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>
                </section>
                </div>
            </div><!-- /.container-fluid -->
        <!-- Main content -->
        <section class="content">
            <!--여기 -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
<script>
    document.getElementById("typeSelect").addEventListener("change", function() {
        var type = this.value;
        if (type === "미용") {
            document.getElementById("additionalInfo1").style.display = "block";
            document.getElementById("additionalInfo2").style.display = "none";
        } else if (type === "진료") {
            document.getElementById("additionalInfo1").style.display = "none";
            document.getElementById("additionalInfo2").style.display = "block";
        } else {
            document.getElementById("additionalInfo1").style.display = "none";
            document.getElementById("additionalInfo2").style.display = "none";
        }
    });
    $(document).ready(function(){
        $("#datepicker1").datepicker();
        $("#datepicker2").datepicker();
    });
    document.getElementById("agreeTerms").addEventListener("change", function() {
        var buttonWrapper = document.getElementById("submitButtonWrapper");
        if (this.checked) {
            buttonWrapper.style.display = "block";
        } else {
            buttonWrapper.style.display = "none";
        }
    });
</script>
</body>
</html>

