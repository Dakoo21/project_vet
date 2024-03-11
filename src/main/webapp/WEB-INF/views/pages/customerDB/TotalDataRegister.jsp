<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
    <%@ include file="/include/bootCommon.jsp"%>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <%@ include file="/include/sidebar.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <!--여기 -->
            <div class="mb-3 row">
                <div id="contents_box">
                    <div id="img_area">
                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="...">
                    </div>
                </div>
                <div class="col-sm-10">
                </div>
            </div>
            <table class="table table-borderless">
                <thead>
                <tr>
                    <th>고객명</th>
                    <th><input type="text" class="form-control" id="exampleFormControlInput1" placeholder=></th>
                    <th>연락처</th>
                    <th><input type="tel" class="form-control" id="exampleFormControlInput2" placeholder="- 포함"></th>
                </tr>
                <tr>
                    <th>주소</th>
                    <th><input type="text" class="form-control" id="exampleFormControlInput3" placeholder=></th>
                    <th>email</th>
                    <th><input type="email" class="form-control" id="exampleFormControlInput4" placeholder=></th>
                </tr>
                <tr>
                    <th>동물이름</th>
                    <th><input type="text" class="form-control" id="exampleFormControlInput5" placeholder=></th>
                    <th>축종</th>
                    <th><input type="text" class="form-control" id="exampleFormControlInput6" placeholder="개, 고양이, 토끼..."></th>
                </tr>
                <tr>
                    <th>품종</th>
                    <th><input type="text" class="form-control" id="exampleFormControlInput7" placeholder=></th>
                    <th>성별</th>
                    <th><select class="form-select" aria-label="default select example">
                        <option selected>성별</option>
                        <option value="1">남자</option>
                        <option value="2">여자</option>
                    </select></th>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <th><input type="date" class="form-control" id="exampleFormControlInput9" placeholder="8자리"></th>
                    <th>중성화</th>
                    <th><select class="form-select" aria-label="default select example">
                        <option selected>중성화 여부</option>
                        <option value="1">O</option>
                        <option value="2">X</option>
                    </select></th>
                </tr>
                <tr>
                    <th>진료예약</th>
                    <th><input type="date" class="form-control" id="exampleFormControlInput11" ></th>
                    <th><input type="time" class="form-control" id="exampleFormControlInput12"></th>
                </tr>
                <tr>
                    <th>몸무게</th>
                    <th><input type="text" class="form-control" id="exampleFormControlInput13" placeholder="kg"></th>
                </tr>
            </table>
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">최근 진료내역</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
            <div class="text-center">
                <button type="button" class="btn btn-danger" style="margin-right: 10px;">취소</button>
                <button type="button" class="btn btn-primary">등록</button>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
<%--<%@ include file="/include/bootCommonFoot1.jsp"%>--%>

</body>
</html>

<style typeof="text/css">
    .form-control{
        width: 50%;
        text-align: center;
        line-height: 2.5;
    }

    #exampleFormControlTextarea1{
        width: 100%;
    }

    #contents_box > #img_area{
        width: 50%;
        height: 50%;
    }
    #contents_box > #table table-borderless{
        width: 50%;
        height: 50%;
    }
    #contents_box > #img_area > img{
        width: 95%;
        padding-top: 50%;
    }
</style>