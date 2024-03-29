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
                    <div class="search-top-area" style="right: auto">
                        <div class="search-box">
                          <form action="simple-results.html">
                              <div class="input-group">
                                  <input type="search" class="form-control form-control-lg" placeholder="고객명, 동물이름">
                                  <div class="input-group-append">
                                      <button type="submit" class="btn btn-lg btn-default">
                                        <i class="fa fa-search"></i>
                                      </button>
                                  </div>
                                   <div class="text-right">
                                 <div id="padding-right50" class="position-absolute top-0 end-20">
                                <button type="button" class="btn btn-primary" style="margin-left: 70px">등록</button>
                                 </div>
                                   </div>
                              </div>
                          </form>
                        </div>
                    </div>
                </div>
                <!-- /.content -->
                <div class ="table">
                    <table class="table table-striped table-bordered table-hover dt-responsive">
                        <thead>
                        <tr>
                            <th>고객명</th>
                            <th>ID</th>
                            <th>성별</th>
                            <th>생년월일</th>
                            <th>이메일</th>
                            <th>연락처</th>
                            <th>주소</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>서견주</td>
                            <td>seoul17</td>
                            <td>여</td>
                            <td>19770504</td>
                            <td>seoul17@hot.com</td>
                            <td>010-7575-5757</td>
                            <td>금천구 가산동 123-12</td>
                        </tr>
                        <tr>
                            <td>도레미</td>
                            <td>dododo11</td>
                            <td>여</td>
                            <td>19880704</td>
                            <td>sjsjqqk@hot.com</td>
                            <td>010-8547-7536</td>
                            <td>금천구 가산동 142</td>
                        </tr>
                        <tr>
                            <td>도레미</td>
                            <td>dododo11</td>
                            <td>여</td>
                            <td>19880704</td>
                            <td>sjsjqqk@hot.com</td>
                            <td>010-8547-7536</td>
                            <td>금천구 가산동 142</td>
                        </tr>
                        <tr>
                            <td>도레미</td>
                            <td>dododo11</td>
                            <td>여</td>
                            <td>19880704</td>
                            <td>sjsjqqk@hot.com</td>
                            <td>010-8547-7536</td>
                            <td>금천구 가산동 142</td>
                        </tr>
                        <tr>
                            <td>도레미</td>
                            <td>dododo11</td>
                            <td>여</td>
                            <td>19880704</td>
                            <td>sjsjqqk@hot.com</td>
                            <td>010-8547-7536</td>
                            <td>금천구 가산동 142</td>
                        </tr>
                        <tr>
                            <td>도레미</td>
                            <td>dododo11</td>
                            <td>여</td>
                            <td>19880704</td>
                            <td>sjsjqqk@hot.com</td>
                            <td>010-8547-7536</td>
                            <td>금천구 가산동 142</td>
                        </tr>
                        <tr>
                            <td>도레미</td>
                            <td>dododo11</td>
                            <td>여</td>
                            <td>19880704</td>
                            <td>sjsjqqk@hot.com</td>
                            <td>010-8547-7536</td>
                            <td>금천구 가산동 142</td>
                        </tr>
                        <tr>
                            <td>도레미</td>
                            <td>dododo11</td>
                            <td>여</td>
                            <td>19880704</td>
                            <td>sjsjqqk@hot.com</td>
                            <td>010-8547-7536</td>
                            <td>금천구 가산동 142</td>
                        </tr>
                        <tr>
                            <td>도레미</td>
                            <td>dododo11</td>
                            <td>여</td>
                            <td>19880704</td>
                            <td>sjsjqqk@hot.com</td>
                            <td>010-8547-7536</td>
                            <td>금천구 가산동 142</td>
                        </tr>
                        <tr>
                            <td>도레미</td>
                            <td>dododo11</td>
                            <td>여</td>
                            <td>19880704</td>
                            <td>sjsjqqk@hot.com</td>
                            <td>010-8547-7536</td>
                            <td>금천구 가산동 142</td>
                        </tr>
                        <tr>
                            <td>도레미</td>
                            <td>dododo11</td>
                            <td>여</td>
                            <td>19880704</td>
                            <td>sjsjqqk@hot.com</td>
                            <td>010-8547-7536</td>
                            <td>금천구 가산동 142</td>
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
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->

<!--footer-->

<%@ include file="/include/bootCommonFoot.jsp"%>

</body>
</html>

<style typeof="text/css">
    .search-top-area{
        display: flex;
        align-items: center;
        justify-content: flex-end;
        margin-bottom: 40px;
    }

    #padding-right50{
        padding-right: 50px;
    }

    .search-box{
        display: flex;
        width: 100%;
        align-items: center;
        justify-content: center;
    }

</style>
