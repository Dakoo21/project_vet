<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <script>
        const noticeInsertPage = (event) => {
          location.href = /* 컨트롤러에 연결하는 */
        }
    </script>
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
                        <h1>공지사항</h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <!--여기 -->
            <div class="board">
                <div class="board-body">
                    <div class="board-content">
                        <div class="container">
                            <!-- 검색기 끝 -->
                            <!-- 회원목록 시작 -->
                            <div class='board-list'>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th width="10%">등록일시</th>
                                        <th width="40%">제목</th>
                                        <th width="20%">작성자</th>
                                        <th width="15%">조회수</th>
                                        <th width="15%">구분</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                                <hr />
                                <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
                                <div style="display:flex;justify-content:center;">
                                    <ul class="pagination">

                                    </ul>
                                </div>
                                <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
                                <div class='board-footer'>
                                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardForm" onclick="noticeInsertPage()">
                                        기안하기
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /.board-body -->
            <!-- /.board -->
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

