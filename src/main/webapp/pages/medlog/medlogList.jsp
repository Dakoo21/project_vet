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
            <div class="content">
                <div class = "container">
                    <div class="row">
                        <div class="search-top-area">
                            <div class="search-box">
                                <div class = "col-lg-5">
                                    <input type="text" class="form-control" placeholder ="고객명, 동물이름"
                                           aria-label="고객명, 동물이름" aria-describedby="btn_search" onkeyup="searchEnter()"/>
                                </div>
                                <div class="search-icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                    </svg>
                                </div>
                            </div>
                            <div class="add-btn">
                                <button type="button" class="btn btn-primary">등록</button>
                            </div>
                        </div>
                    </div>
                    <!-- /.content -->
                    <div class ="">
                        <table class="table table-striped table-bordered table-hover dt-responsive">
                            <thead>
                            <tr>
                                <th>등록일시</th>
                                <th>축종</th>
                                <th>보호자</th>
                                <th>연락처</th>
                                <th>동물명</th>
                                <th>차트번호</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>2024.02.04</td>
                                <td>강아지</td>
                                <td>김보호</td>
                                <td>010-1234-5678</td>
                                <td>멍멍이1</td>
                                <td>20240204001</td>
                                <td><button>미수납</button></td>
                            </tr>
                            <tr>
                                <td>2024.02.04</td>
                                <td>강아지</td>
                                <td>김보호</td>
                                <td>010-1234-5678</td>
                                <td>멍멍이1</td>
                                <td>20240204001</td>
                                <td><button>미수납</button></td>
                            </tr>
                            <tr>
                                <td>2024.02.04</td>
                                <td>강아지</td>
                                <td>김보호</td>
                                <td>010-1234-5678</td>
                                <td>멍멍이1</td>
                                <td>20240204001</td>
                                <td><button>미수납</button></td>
                            </tr>
                            <tr>
                                <td>2024.02.04</td>
                                <td>강아지</td>
                                <td>김보호</td>
                                <td>010-1234-5678</td>
                                <td>멍멍이1</td>
                                <td>20240204001</td>
                                <td><button>미수납</button></td>
                            </tr>
                            <tr>
                                <td>2024.02.04</td>
                                <td>강아지</td>
                                <td>김보호</td>
                                <td>010-1234-5678</td>
                                <td>멍멍이1</td>
                                <td>20240204001</td>
                                <td><button>미수납</button></td>
                            </tr>
                            <tr>
                                <td>2024.02.04</td>
                                <td>강아지</td>
                                <td>김보호</td>
                                <td>010-1234-5678</td>
                                <td>멍멍이1</td>
                                <td>20240204001</td>
                                <td><button>수납완료</button></td>
                            </tr>
                            <tr>
                                <td>2024.02.04</td>
                                <td>강아지</td>
                                <td>김보호</td>
                                <td>010-1234-5678</td>
                                <td>멍멍이1</td>
                                <td>20240204001</td>
                                <td><button>수납완료</button></td>
                            </tr>
                            <tr>
                                <td>2024.02.04</td>
                                <td>강아지</td>
                                <td>김보호</td>
                                <td>010-1234-5678</td>
                                <td>멍멍이1</td>
                                <td>20240204001</td>
                                <td><button>수납완료</button></td>
                            </tr>
                            <tr>
                                <td>2024.02.04</td>
                                <td>강아지</td>
                                <td>김보호</td>
                                <td>010-1234-5678</td>
                                <td>멍멍이1</td>
                                <td>20240204001</td>
                                <td><button>수납완료</button></td>
                            </tr>
                            <tr>
                                <td>2024.02.04</td>
                                <td>강아지</td>
                                <td>김보호</td>
                                <td>010-1234-5678</td>
                                <td>멍멍이1</td>
                                <td>20240204001</td>
                                <td><button>수납완료</button></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
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

