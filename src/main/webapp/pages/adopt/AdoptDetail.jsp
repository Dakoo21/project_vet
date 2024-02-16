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
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Icons</h1>
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
        <section class="content">
        <!-- Main content -->
        <div id="contents_box">
            <div id="img_area">
                <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="...">
            </div>
            <div id="table_area">
                <table class="table table-borderless">
                    <tr>
                        <th>공고상태</th>
                        <td><input class="form-control" type="text" value="공고중" aria-label="readonly input example" readonly></td>
                        <th>축종</th>
                        <td><input class="form-control" type="text" value="개" aria-label="readonly input example" readonly></td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td><input class="form-control" type="text" value="여" aria-label="readonly input example" readonly></td>
                        <th>중성화</th>
                        <td><input class="form-control" type="text" value="O" aria-label="readonly input example" readonly></td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td><input class="form-control" type="text" value="2022" aria-label="readonly input example" readonly></td>
                        <th>몸무게</th>
                        <td><input class="form-control" type="text" value="5.3kg" aria-label="readonly input example" readonly></td>
                    </tr>
                    <tr>
                        <th>털 색</th>
                        <td><input class="form-control" type="text" value="갈 검" aria-label="readonly input example" readonly></td>
                        <th>보호소</th>
                        <td><input class="form-control" type="text" value="제주 동물보호센터" aria-label="readonly input example" readonly></td>
                    </tr>
                </table>
        <!-- /.content -->
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label">상태 및 특이사항</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>
            </div>
        </section>
    </div>
    <!-- /.content-wrapper -->
    <%@ include file="/include/footer.jsp"%>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!--footer-->
<%@ include file="/include/bootCommonFoot.jsp"%>

</body>
</html>

<style typeof="text/css">

    #contents_box{
        display: flex;
        width: 100%;
        justify-content: space-evenly;
        align-items: center;
    }

    #contents_box > #img_area{
        width: 50%;
        height: 50%;
    }

    #contents_box > #img_area > img{
        width: 95%;
        padding-top: 50%;
    }

</style>