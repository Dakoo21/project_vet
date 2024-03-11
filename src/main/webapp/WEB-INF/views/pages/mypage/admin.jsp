<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.example.vet.model.Notice" %>
<%@ page import="com.example.vet.model.SignTotal" %>
<%
    List<Map<String, Object>> bList = (List)request.getAttribute("bList");
    List<Notice> noticeList = (List<Notice>) request.getAttribute("noticeList");
    List<Map<String, Object>> employList = (List) request.getAttribute("employList");
    // 전자결재
    List<SignTotal> esignList = (List<SignTotal>) request.getAttribute("esignList");
    int size = 0;
    int size1 = 0;
    int size2 = 0;
    if (noticeList != null) {
        size = noticeList.size();
    }
    if (employList != null) {
        size1 = employList.size();
    }
    if (esignList != null) {
        size2 = employList.size();
    }
    int numPerPage = 3;
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
    <title>마이 페이지</title>
    <%@ include file="/include/bootCommon.jsp" %>
    <!-- Google Charts 라이브러리 로드 -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

    <!--달력-->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/main.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.10/index.global.min.js'></script>
    <script src='fullcalendar-scheduler/dist/index.global.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/resource-timegrid@6.1.10/index.global.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>

    <%--월간달력--%>

    <script>
        // Google Charts 라이브러리 로드 완료 후 실행
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawCharts);

        function drawCharts() {
// 차트 6 - 스택된 세로 막대 그래프
            var data6 = google.visualization.arrayToDataTable([
                ['연도', '매출', '비용', '이익'],
                ['2019', 1000, 600, 400],
                ['2020', 1200, 700, 500],
                ['2021', 1400, 800, 600],
                ['2022', 1600, 900, 700]
            ]);

            var options6 = {
                isStacked: true
            };

            var chart6 = new google.visualization.ColumnChart(document.getElementById('chart_div6'));
            chart6.draw(data6, options6);

        }

        document.addEventListener('DOMContentLoaded', function() {
            let events;
            const calendarEl = document.getElementById('calendar')
            const calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                eventLimit: true, // 더보기 버튼 활성화
                eventLimitText: '더 보기', // 더보기 버튼 텍스트
                eventLimitClick: 'popover' // 더보기 버튼 클릭 시 팝오버 형태로 표시
                ,schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
                , locale: 'ko'
                , fixedWeekCount: false
                , dayCellContent: function (info) {
                    if (info.view.type === "dayGridMonth") {
                        var number = document.createElement("a");
                        number.classList.add("fc-daygrid-day-number");
                        number.innerHTML = info.dayNumberText.replace("일", '').replace("日", "");
                        return {html: number.outerHTML};
                    }
                    return {};
                }


                , headerToolbar: {
                    left: 'prev',
                    center: 'title',
                    right: 'next today'
                },
                /*0000년 0월 0일 문제 왜 일이 +10을 해야하지?*/
                titleFormat: function (date) {
                    let currentDate = new Date();
                    let dayOfMonth = currentDate.getDate();
                    year = date.date.year;
                    month = date.date.month + 1;
                    day = dayOfMonth;

                    return year + "-" + month + "월" + "-" + day + "일";
                },

                events:[
                    <% SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm"); %>
                    <%
                        for (int i = 0; i < bList.size(); i++) {
                            Map<String, Object> rmap = bList.get(i);
                            Date startDate = dateFormat.parse(rmap.get("bookingDate").toString() + " " + rmap.get("bookingStart").toString());
                            Date endDate = dateFormat.parse(rmap.get("bookingDate").toString() + " " + rmap.get("bookingEnd").toString());
                    %>
                    {
                        title: '<%= rmap.get("bookingType") %> 예약',
                        start: '<%= dateFormat.format(startDate) %>',
                        end: '<%= dateFormat.format(endDate) %>',
                        url: 'redirect:/bookingDetail?bookingPK=<%=Integer.parseInt(rmap.get("bookingPk").toString())%>',
                        background: '000000',
                    }
                    <% if (i < bList.size() - 1) { %>,<% } %>
                    <% } %>
                ]
            });

            calendar.render()
        });
    </script>
    <![endif]-->
    <style>
        hr {
            border-top: 3px solid black; /* 굵기 조절 */
            width: 98%; /* 가로 길이 조절 */
        }

        /* 더보기 링크 스타일 */
        h1 small a {
            color: black; /* 링크 색을 검정으로 설정 */
        }

        table {
            width: 100%;
            text-align: center;
        }
    </style>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <%@ include file="/include/sidebar.jsp" %>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="noto-sans">마이페이지</h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <!--여기 -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <!--영역1-->
                        <div class="card">
                            <div class="card-header border-0">
                                <div class="d-flex justify-content-between">
                                    <h3 class="card-title">월별 캘린더</h3>
                                    <a href="/booking/bookingList">더보기</a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="position-relative mb-4">
                                    <table class="bigTable">
                                        <tr>
                                            <td>
                                                <div class="box-title">
                                                    <div id='calendar'></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="d-flex flex-row justify-content-end">
                                  <span class="mr-2">
                                    <i class="fas fa-square text-primary"></i> This Week
                                  </span><span>
                                    <i class="fas fa-square text-gray"></i> Last Week
                                  </span>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->
                        <!--영역2-->
                        <div class="card">
                            <div class="card-header border-0">
                                <h3 class="card-title">진행중인 문서함</h3>
                                <div class="card-tools">
                                    <a href="/eSign/progressDocs">더보기</a>
                                </div>
                            </div>
                            <div class="card-body table-responsive p-0">
                                <div class ="table">
                                    <table class="table table-hover dt-responsive">
                                        <thead>
                                        <tr>
                                            <th>문서번호</th>
                                            <th>문서 제목</th>
                                            <th>결재 기안일</th>
                                            <th>결재 상태</th>
                                            <th>문서 구분</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            for(int i=nowPage*8;i<(nowPage*8)+8;i++){
                                                if(i == size) break;
                                                SignTotal signTotal = esignList.get(i);
                                                String docState = null;
                                                if(signTotal.getSIGN_STATE()==3){
                                                    docState = "진행";
                                                    int docNo = signTotal.getSIGN_PK();
                                                    String docTitle = signTotal.getSIGN_TITLE();
                                                    String docDate = signTotal.getSIGN_DATE();
                                                    String docType = signTotal.getSIGN_DOCTYPE();
                                        %>
                                        <tr onclick="signOneDetail('<%=signTotal.getSIGN_PK()%>')">
                                            <td><%=docNo%></td>
                                            <td><%=docTitle%></td>
                                            <td><%=docDate%></td>
                                            <td><%=docState%></td>
                                            <td><%=docType%></td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col-md-6 -->
                    <div class="col-lg-6">
                        <!--영역3-->
                        <div class="card">
                            <div class="card-header border-0">
                                <h3 class="card-title">월별매출차트</h3>
                                <div class="card-tools">
                                    <a href="javascript:void(0);">더보기</a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="chart">
                                    <div id="chart_div6" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></div>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->
                        <!--영역4-->
                        <div class="card">
                            <div class="card-header border-0">
                                <h3 class="card-title">공지사항</h3>
                                <div class="card-tools">
                                    <a href="/notice">더보기</a>
                                </div>
                            </div>
                            <div class="card-body table-responsive p-0">
                                <table class="table table-striped table-valign-middle">
                                    <thead>
                                    <tr>
                                        <th width="15%" style="text-align: center;">번호</th>
                                        <th width="40%" style="text-align: center;">제목</th>
                                        <th width="20%" style="text-align: center;">작성자</th>
                                        <th width="15%" style="text-align: center;">작성일자</th>
                                        <th width="15%" style="text-align: center;">조회수</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
                                            if(i == size) break;
                                            Notice notice = noticeList.get(i);
                                    %>
                                    <tr onclick="noticeOneDetail('<%=notice.getNOTICE_PK()%>')">
                                        <%if(notice.getNOTICE_HIGHLIGHTED().equals(1)){%>
                                        <td width="10%" style="text-align: center;">✅</td>
                                        <%
                                        } else {
                                        %>
                                        <td width="10%" style="text-align: center;"><%=notice.getNOTICE_PK()%></td>
                                        <%
                                            }
                                        %>
                                        <td width="40%" style="text-align: center;"><%=notice.getNOTICE_TITLE()%></td>
                                        <td width="20%" style="text-align: center;"><%=notice.getMEMBER_MEMBERNAME()%></td>
                                        <td width="15%" style="text-align: center;"><%=notice.getNOTICE_TIME()%></td>
                                        <td width="15%" style="text-align: center;"><%=notice.getNOTICE_HITS()%></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header border-0">
                                <h3 class="card-title">사원관리</h3>
                                <div class="card-tools">
                                    <a href="employeeList">더보기</a>
                                </div>
                            </div>
                            <div class="card-body table-responsive p-0">
                                <table class="table table-striped table-valign-middle">
                                    <thead>
                                    <tr>
                                        <th>사원 번호</th>
                                        <th>사원 이름</th>
                                        <th>사원 권한</th>
                                        <th>사원 메일</th>
                                        <th>사원 연락처</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        //스크립틀릿 - 지변이다, 메소드 선언불가, 생성자 선언불가, 실행문
                                        //n건을 조회하는 경우이지만 resultType에는 map이나 vo패턴을 주는게 맞다
                                        //주의사항 - 자동으로 키값을 생성함 - 디폴트가 대문자이다
                                        //myBatis연동시 resultType=map{한행}으로 줌 -> selectList("noticeList", pMap)
                                        for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
                                            if(i == size1) break;
                                            Map<String,Object> rmap = employList.get(i);
                                    %>
                                    <tr onclick="employeeOneDetail('<%=rmap.get("MEMBER_PK")%>')">
                                        <td><%=rmap.get("MEMBER_PK")%></td>
                                        <td><%=rmap.get("MEMBER_MEMBERNAME")%></td>
                                        <td>
                                            <%
                                                String user_role = null;
                                                if ("ROLE_ADMIN".equals(rmap.get("MEMBER_ROLE"))) {
                                                    user_role = "관리자";
                                                } else if ("ROLE_MASTER".equals(rmap.get("MEMBER_ROLE"))) {
                                                    user_role = "부관리자";
                                                } else if ("ROLE_NURSE".equals(rmap.get("MEMBER_ROLE"))) {
                                                    user_role = "간호사";
                                                } else if ("ROLE_INFO".equals(rmap.get("MEMBER_ROLE"))) {
                                                    user_role = "데스크";
                                                } else {
                                                    user_role = "임시 사용자";
                                                }
                                            %>
                                            <%=user_role%>
                                        </td>
                                        <td><%=rmap.get("MEMBER_EMAIL")%></td>
                                        <td><%=rmap.get("MEMBER_PHONE")%></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!--footer-->
    <%@ include file="/include/footer.jsp" %>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp" %>
</body>
</html>

