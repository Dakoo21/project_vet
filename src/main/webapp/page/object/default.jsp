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
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">
                        <i class="fas fa-chart-pie mr-1"></i>
                        Sales
                    </h3>
                    <div class="card-tools">
                        <ul class="nav nav-pills ml-auto">
                            <li class="nav-item">
                                <a class="nav-link active" href="#revenue-chart" data-toggle="tab">Area</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#sales-chart" data-toggle="tab">Donut</a>
                            </li>
                        </ul>
                    </div>
                </div><!-- /.card-header -->
                <div class="card-body">
                    <div class="tab-content p-0">
                        <!-- Morris chart - Sales -->
                        <div class="chart tab-pane active" id="revenue-chart"
                             style="position: relative; height: 300px;">
                            <div class="widget padding" data-height="28" style="margin-top:0px; margin-bottom:0px;">
                                <div id="padding_table" style="width:100%; min-height:1px; height:28px;"></div>
                            </div>
                            <table class="table table-striped table-bordered table-hover dt-responsive">
                                <thead>
                                <tr>
                                    <th>사진</th>
                                    <th>동물이름</th>
                                    <th>종류</th>
                                    <th>성별</th>
                                    <th>중성화</th>
                                    <th>생년월일</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td> <div id="img_area1">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area2">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area3">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_are4">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area5">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area6">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area7">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area8">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area9">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area10">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;">
                            <div class="widget padding" data-height="28" style="margin-top:0px; margin-bottom:0px;">
                                <div id="padding_table" style="width:100%; min-height:1px; height:28px;"></div>
                            </div>
                            <table class="table table-striped table-bordered table-hover dt-responsive">
                                <thead>
                                <tr>
                                    <th>테</th>
                                    <th>스</th>
                                    <th>트</th>
                                    <th>테</th>
                                    <th>이</th>
                                    <th>블</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td> <div id="img_area1">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area2">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area3">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_are4">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area5">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area6">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area7">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area8">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area9">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                <tr>
                                    <td> <div id="img_area10">
                                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                    <td>마루</td>
                                    <td>개</td>
                                    <td>여</td>
                                    <td>O</td>
                                    <td>2022 추정</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
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

