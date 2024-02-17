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
            <div class = "container">
                <div class="row">
                    <div class="search-top-area">
                        <div class="search-box">
                            <div class="row">
                                <div class="col-md-8 offset-md-2">
                                    <form action="simple-results.html">
                                        <div class="input-group">
                                            <input type="search" class="form-control form-control-lg" placeholder="Type your keywords here">
                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-lg btn-default">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                            <div class="search-icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.content -->
                <div class="text-right">
                    <div id="padding-right50" class="position-absolute top-0 end-70">
                        <button type="button" class="btn btn-primary">등록</button>
                    </div>
                </div>
                <div class ="table">
                    <table class="table table-striped table-bordered table-hover dt-responsive">
                        <thead>
                        <tr>
                            <th>고객명</th>
                            <th>동물이름</th>
                            <th>종류</th>
                            <th>품종</th>
                            <th>성별</th>
                            <th>중성화</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>서견주<a href="TotalDataDetail.jsp?고객명=<%="서견주"%>"></a></td>
                            <td>뭉치</td>
                            <td>개</td>
                            <td>불독</td>
                            <td>여</td>
                            <td>O</td>
                        </tr>
                        <tr>
                            <td>서견주</td>
                            <td>망치</td>
                            <td>개</td>
                            <td>불독</td>
                            <td>여</td>
                            <td>O</td>
                        </tr>
                        <tr>
                            <td>서견주</td>
                            <td>양치</td>
                            <td>개</td>
                            <td>불독</td>
                            <td>남</td>
                            <td>O</td>
                        </tr>
                        <tr>
                            <td>고영주</td>
                            <td>루루</td>
                            <td>고양이</td>
                            <td>코리안숏헤어</td>
                            <td>남</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td>김톨이</td>
                            <td>햄토리</td>
                            <td>햄스터</td>
                            <td> - </td>
                            <td>남</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td>김톨이</td>
                            <td>햄토리</td>
                            <td>햄스터</td>
                            <td> - </td>
                            <td>남</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td>김톨이</td>
                            <td>햄토리</td>
                            <td>햄스터</td>
                            <td> - </td>
                            <td>남</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td>김톨이</td>
                            <td>햄토리</td>
                            <td>햄스터</td>
                            <td> - </td>
                            <td>남</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td>김톨이</td>
                            <td>햄토리</td>
                            <td>햄스터</td>
                            <td> - </td>
                            <td>남</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td>김톨이</td>
                            <td>햄토리</td>
                            <td>햄스터</td>
                            <td> - </td>
                            <td>남</td>
                            <td>X</td>
                        </tr>
                        <tr>
                            <td>김톨이</td>
                            <td>햄토리</td>
                            <td>햄스터</td>
                            <td> - </td>
                            <td>남</td>
                            <td>X</td>
                        </tr>
                        </tbody>
                    </table>
                    <div style="display:flex; justify-content:center;">
                        <ul class="pagination"></ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- footer -->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->

<%@ include file="/include/bootCommonFoot.jsp"%>
<%--<%@ include file="/include/bootCommonFoot1.jsp"%>--%>

</body>
</html>
<style typeof="text/css">
    .search-top-area{
        display: flex;
        align-items: center;
        justify-content: flex-end;
        margin-bottom: 40px;
    }

    .search-icon{
        margin-left: 25px;
    }

    #padding-right50{
        padding-right: 50px;
    }

    .search-box{
        display: flex;
        width: 60%;
        align-items: center;
        justify-content: center;
    }

</style>
