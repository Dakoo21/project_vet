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
            <div class="container">
                <table>
                    <tr>
                        <!-- 첫 번째 그리드 아이템 -->
                        <td>
                            <div class="image-container">
                                <img src="http://www.animal.go.kr/files/shelter/2021/12/202201030901129.jpg" alt="Image 1">
                            </div>
                            <div class="content">
                                <!-- 데이터베이스에서 가져온 내용 -->
                                <h3>Title 1</h3>
                                <p>Description 1</p>
                            </div>
                        </td>

                        <!-- 두 번째 그리드 아이템 -->
                        <td>
                            <div class="image-container">
                                <img src="image2.jpg" alt="Image 2">
                            </div>
                            <div class="content">
                                <!-- 데이터베이스에서 가져온 내용 -->
                                <h3>Title 2</h3>
                                <p>Description 2</p>
                            </div>
                        </td>

                        <!-- 세 번째 그리드 아이템 -->
                        <td>
                            <div class="image-container">
                                <img src="image3.jpg" alt="Image 3">
                            </div>
                            <div class="content">
                                <!-- 데이터베이스에서 가져온 내용 -->
                                <h3>Title 3</h3>
                                <p>Description 3</p>
                            </div>
                        </td>

                        <!-- 네 번째 그리드 아이템 -->
                        <td>
                            <div class="image-container">
                                <img src="image4.jpg" alt="Image 4">
                            </div>
                            <div class="content">
                                <!-- 데이터베이스에서 가져온 내용 -->
                                <h3>Title 4</h3>
                                <p>Description 4</p>
                            </div>
                        </td>
                        <td>
                            <div class="image-container">
                                <img src="image4.jpg" alt="Image 4">
                            </div>
                            <div class="content">
                                <!-- 데이터베이스에서 가져온 내용 -->
                                <h3>Title 4</h3>
                                <p>Description 4</p>
                            </div>
                        </td>
                        <td>
                            <div class="image-container">
                                <img src="image4.jpg" alt="Image 4">
                            </div>
                            <div class="content">
                                <!-- 데이터베이스에서 가져온 내용 -->
                                <h3>Title 4</h3>
                                <p>Description 4</p>
                            </div>
                        </td>
                        <td>
                            <div class="image-container">
                                <img src="image4.jpg" alt="Image 4">
                            </div>
                            <div class="content">
                                <!-- 데이터베이스에서 가져온 내용 -->
                                <h3>Title 4</h3>
                                <p>Description 4</p>
                            </div>
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
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
</body>
</html>

