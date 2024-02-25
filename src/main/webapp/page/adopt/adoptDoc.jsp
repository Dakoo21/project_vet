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
        <!-- Main content -->
        <section class="content">
            <!--여기 -->
            <div class="table-responsive">
                <table class="table">
                    <tbody>
                    <tr>
                        <td style="max-width:50px">성명</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td style="max-width: 50px">연락처</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td style="max-width: 50px">나이</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td style="max-width: 50px">집주소</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td style="max-width: 50px">SNS 주소</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td style="max-width: 50px">직업/직장명</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td style="max-width: 50px">개인정보 이용에 동의합니다</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td style="max-width: 50px">개인정보 수집 및 이용에 대한 문의</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td style="max-width: 50px">입양을 희망하는 동물 이름</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td style="max-width: 50px">키우고 있는 반려동물 여부</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td style="max-width: 50px">입양을 원하는 이유</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td style="max-width: 50px">성별</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td style="max-width: 50px">비상 연락처</td>
                        <td><input type="text" class="form-control"></td>
                    </tr>
                    </tbody>
                </table>

            </div>

            <div>
                <table style="margin: 0 auto;">
                    <tr>
                        <td>
                            <button type="button" class="btn btn-secondary btn-block">취소</button>
                        </td>
                        <td style="width: 20px;"></td> <!-- 공백을 두기 위한 빈 td -->
                        <td>
                            <button type="button" class="btn btn-primary btn-block">제출</button>
                        </td>
                    </tr>
                </table>

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
</body>
</html>

