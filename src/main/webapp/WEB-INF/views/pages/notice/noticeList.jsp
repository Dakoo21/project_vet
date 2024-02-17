<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<%--%>
<%--    List<Map<String,Object>> nVO = (List)request.getAttribute("nList");--%>
<%--    int size = nVO.size();--%>

<%--%>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
<%--    <script>--%>
<%--        const insertNotice =() =>{--%>
<%--            window.location.href="./noticeWriter";--%>
<%--        }--%>
<%--        $(function () {--%>
<%--            $("#example1").DataTable();--%>
<%--            $('#example2').DataTable({--%>
<%--                "paging": true,--%>
<%--                "lengthChange": false,--%>
<%--                "searching": false,--%>
<%--                "ordering": true,--%>
<%--                "info": true,--%>
<%--                "autoWidth": false--%>
<%--            });--%>
<%--        });--%>
<%--    </script>--%>
    <%@ include file="/include/bootCommon.jsp"%>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <%@ include file="/include/sidebar.jsp"%>

        <!-- Main content -->
        <div class="wrapper">
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <section class="content-header">
                        <div class="container-fluid">
                            <div class="row mb-2">
                                <div class="col-sm-6">
                                    <h1>공지사항</h1>
                                </div>
                                <div class="col-sm-6">
                                    <ol class="breadcrumb float-sm-right">
                                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                                        <li class="breadcrumb-item active">Notice</li>
                                    </ol>
                                </div>
                            </div>
                        </div><!-- /.container-fluid -->
                    </section>

                    <!-- Main content -->
                    <section class="content">

                        <!-- Default box -->
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">상세기록</h3>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body p-0">
                                <table id = "example2" class="table table-striped projects">
                                    <thead>
                                    <tr>
                                        <th style="width: 5%">
                                            등록일시
                                        </th>
                                        <th style="width: 10%">
                                            제목
                                        </th>
                                        <th style="width: 10%">
                                            작성자
                                        </th>
                                        <th style="width: 10%">
                                            조회수
                                        </th>
                                        <th style="width: 20%">
                                            게시판구분
                                        </th>

                                    </tr>
                                    </thead>
                                    <tbody>
<%--                                    <% for(int i = 0; i<size; i++){--%>
<%--                                        Map<String, Object> rmap = nVO.get(i);--%>
<%--                                    %>--%>

<%--                                    <tr>--%>
<%--                                        <td><%=rmap.get("NOTICE_TIME")%></td>--%>
<%--                                        <td><a href='noticeDetail?noticePK=<%=rmap.get("NOTICE_PK")%>'><%=rmap.get("NOTICE_TITLE")%></a></td>--%>
<%--                                        <td><%=rmap.get("NOTICE_WRITER")%></td>--%>
<%--                                        <td><%=rmap.get("NOTICE_HITS")%></td>--%>
<%--                                        <td><%=rmap.get("COMMON_CODE_PK")%></td>--%>


<%--                                    </tr>--%>
<%--                                    <%--%>
<%--                                        }--%>
<%--                                    %>--%>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                            <table style="margin: 0 auto;">
                                <tr>
                                    <td>
                                        <button type="button" class="btn btn-secondary btn-block"><a href="http://localhost:8000/noticeWriter.jsp" style="color: black">글쓰기</a></button>
                                    </td>

                                </tr>
                            </table>
                        </div>
                        <!-- /.card -->

                    </section>
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <!-- /.content -->
        </div>

    </div>
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

