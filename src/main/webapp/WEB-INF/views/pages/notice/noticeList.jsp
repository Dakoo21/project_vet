<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>
<%@ page import="com.example.vet.model.Notice" %>
<%@ page import="com.util.BSPageBar" %>
<%
    List<Notice> noticeList = (List<Notice>) request.getAttribute("noticeList");
    int size = 0;
    if (noticeList != null) {
        size = noticeList.size();
    }
    int numPerPage = 10;
    int nowPage = 0;
    if(request.getParameter("nowPage")!=null){
        nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <script>
        const noticeInsertPage = (event) => {
          location.href = "/noticeInsertPage";
        }

        function noticeOneDetail (NOTICE_PK) {
            console.log("공지사항 디테일 조회 요청")
            location.href = "/noticeDetail?NOTICE_PK="+NOTICE_PK;
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
                        <h1 class="noto-sans">공지사항</h1>
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
                                        <th width="10%" style="text-align: center;">번호</th>
                                        <th width="40%" style="text-align: center;">제목</th>
                                        <th width="20%" style="text-align: center;">작성자</th>
                                        <th width="15%" style="text-align: center;">작성일자</th>
                                        <th width="15%" style="text-align: center;">조회수</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        int rownum = 0;
                                        for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
                                            if(i == size) break;
                                            Notice notice = noticeList.get(i);
                                    %>
                                    <tr onclick="noticeOneDetail('<%=notice.getNOTICE_PK()%>')">
                                        <%if(notice.getNOTICE_HIGHLIGHTED().equals(1)){%>
                                        <td width="10%" style="text-align: center;">📌</td>
                                        <%
                                            } else {
                                        %>
                                        <td width="10%" style="text-align: center;"><%=rownum += 1%></td>
                                        <%
                                            }
                                        %>
                                        <td width="40%" style="text-align: center;"><%=notice.getNOTICE_TITLE()%></td>
                                        <td width="20%" style="text-align: center;"><%=notice.getMEMBER_MEMBERNAME()%></td>
                                        <td width="15% style="text-align: center;"><%=notice.getNOTICE_TIME()%></td>
                                        <td width="15%" style="text-align: center;"><%=notice.getNOTICE_HITS()%></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                                <hr />
                                <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
                                <div style="display:flex;justify-content:center;">
                                    <ul class="pagination">
                                        <%
                                            String pagePath = "/noticeList";
                                            BSPageBar bspb = new BSPageBar(numPerPage,  size, nowPage, pagePath);
                                            out.print(bspb.getPageBar());
                                        %>
                                    </ul>
                                </div>
                                <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
                                <%
                                    if (isAdmin || isMaster) {
                                %>
                                <div class='board-footer'>
                                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardForm" onclick="noticeInsertPage()">
                                        글쓰기
                                    </button>
                                </div>
                                <%
                                    }
                                %>
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

