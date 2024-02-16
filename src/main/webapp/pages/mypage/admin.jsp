<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
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
            const calendarEl = document.getElementById('calendar')
            const calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth'/* 세로줄 */
                ,schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
                ,locale: 'ko'
                ,fixedWeekCount: false
                ,dayCellContent: function(info) {
                    if (info.view.type === "dayGridMonth") {
                        var number = document.createElement("a");
                        number.classList.add("fc-daygrid-day-number");
                        number.innerHTML = info.dayNumberText.replace("일", '').replace("日","");
                        return { html: number.outerHTML };
                    }
                    return {};
                }

                ,headerToolbar: {//헤더 설정
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

                    return year + "-" + month + "월"+"-"+day+"일";
                },
            })

            calendar.render()


            /*2번째*/

            var calendarE = document.getElementById('calendarDay');

            var calendarDay = new FullCalendar.Calendar(calendarE, { // 변수명 변경
                timeZone: 'UTC',
                initialView: 'timeGridFourDay',
                schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
                ,locale: 'ko'
                ,allDaySlot: false // 올데이 슬롯 비활성화
                ,headerToolbar: {
                    left: 'prev',
                    center: 'title',
                    right: 'next'
                },
                slotMinTime: '10:00:00', // 시작 시간을 오전 10시로 설정
                slotMaxTime: '20:00:00', // 종료 시간을 오후 8시로 설정
                views: {
                    timeGridFourDay: {
                        type: 'timeGrid',
                        duration: { days: 1},
                        buttonText: '4 day'
                    }
                },
            });
            calendarDay.render() // 변수명 변경


            // 세변쨰

            var calendarEll = document.getElementById('calendar');

            var calendarRoom = new FullCalendar.Calendar(calendarEll, {
                timeZone: 'UTC',
                initialView: 'resourceTimeGridDay',
                schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
                locale: 'ko',
                slotMinTime: '10:00:00', // 시작 시간을 오전 10시로 설정
                slotMaxTime: '20:00:00', // 종료 시간을 오후 8시로 설정
                allDaySlot: false, // 올데이 슬롯 비활성화
                dayMinWidth: 50,

                headerToolbar: {
                    left: 'prev',
                    center: 'title',
                    right: 'next'
                },
                resources: [
                    { id: 'a', title: 'Room A' },
                    { id: 'b', title: 'Room B'},
                    { id: 'c', title: 'Room C' },
                    { id: 'd', title: 'Room D' }
                ],
                events: [
                    { id: '1', resourceId: 'a', start: '2024-02-16T09:00:00', end: '2024-02-17T09:00:00', title: 'event 1' },
                    { id: '2', resourceId: 'a', start: '2023-11-07T09:00:00', end: '2023-11-07T14:00:00', title: 'event 2' },
                    { id: '3', resourceId: 'b', start: '2023-11-07T12:00:00', end: '2023-11-08T06:00:00', title: 'event 3' },
                    { id: '4', resourceId: 'c', start: '2023-11-07T07:30:00', end: '2023-11-07T09:30:00', title: 'event 4' },
                    { id: '5', resourceId: 'd', start: '2023-11-07T10:00:00', end: '2023-11-07T15:00:00', title: 'event 5' }
                ],
            });

            calendarRoom.render();
        });
        <%--        &lt;%&ndash;이건 일일현황&ndash;%&gt;--%>
        <%--        document.addEventListener('DOMContentLoaded', function() {--%>
        <%--            var calendarTimelineEl = document.getElementById('calendarTimeline');--%>
        <%--            var calendarTimeline = new FullCalendar.Calendar(calendarTimelineEl, {--%>
        <%--                initialView: 'resourceTimelineOneDay'--%>
        <%--                ,schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'--%>
        <%--                ,views: {--%>
        <%--                    resourceTimelineOneDay: {--%>
        <%--                        type: 'resourceTimeline',--%>
        <%--                        duration: { days: 1 }--%>
        <%--                    }--%>
        <%--                }--%>
        <%--                ,locale: 'ko'--%>
        <%--                ,slotMinTime: '10:00:00', // 시작 시간을 오전 10시로 설정--%>
        <%--                slotMaxTime: '20:00:00' // 종료 시간을 오후 8시로 설정--%>
        <%--                ,headerToolbar: {--%>
        <%--                    left: 'prev',--%>
        <%--                    center: 'title',--%>
        <%--                    right: 'next'--%>

        <%--                },--%>
        <%--            });--%>
        <%--            calendarTimeline.render();--%>
        <%--        });--%>
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
                        <h1>마이페이지</h1>
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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <!--영역1-->
                        <div class="card">
                            <div class="card-header border-0">
                                <div class="d-flex justify-content-between">
                                    <h3 class="card-title">월별 캘린더</h3>
                                    <a href="javascript:void(0);">>더보기</a>
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
                                <h3 class="card-title">전자결재</h3>
                                <div class="card-tools">
                                    <a href="javascript:void(0);">>더보기</a>
                                </div>
                            </div>
                            <div class="card-body table-responsive p-0">
                                <table class="table table-striped table-valign-middle">
                                    <thead>
                                    <tr>
                                        <th>제목</th>
                                        <th>기안일</th>
                                        <th>구분</th>
                                        <th>상태</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            제모과과고가ㅗ가곽
                                        </td>
                                        <td>2024.02.02</td>
                                        <td>
                                            기안서
                                        </td>
                                        <td>
                                            진행
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            제모과과고가ㅗ가곽
                                        </td>
                                        <td>2024.02.02</td>
                                        <td>
                                            기안서
                                        </td>
                                        <td>
                                            진행
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            제모과과고가ㅗ가곽
                                        </td>
                                        <td>2024.02.02</td>
                                        <td>
                                            기안서
                                        </td>
                                        <td>
                                            진행
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            제모과과고가ㅗ가곽
                                        </td>
                                        <td>2024.02.02</td>
                                        <td>
                                            기안서
                                        </td>
                                        <td>
                                            진행
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
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
                                    <a href="javascript:void(0);">>더보기</a>
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
                                    <a href="javascript:void(0);">>더보기</a>
                                </div>
                            </div>
                            <div class="card-body table-responsive p-0">
                                <table class="table table-striped table-valign-middle">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>카테고리</th>
                                        <th>제목</th>
                                        <th>작성일</th>
                                        <th>조회수</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            ✅
                                        </td>
                                        <td>공지</td>
                                        <td>
                                            국가지원 광견병 접종 안내
                                        </td>
                                        <td>
                                            2024-01-19
                                        </td>
                                        <td>
                                            76
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            ✅
                                        </td>
                                        <td>공지</td>
                                        <td>
                                            국가지원 광견병 접종 안내
                                        </td>
                                        <td>
                                            2024-01-19
                                        </td>
                                        <td>
                                            76
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            ✅
                                        </td>
                                        <td>공지</td>
                                        <td>
                                            국가지원 광견병 접종 안내
                                        </td>
                                        <td>
                                            2024-01-19
                                        </td>
                                        <td>
                                            76
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            ✅
                                        </td>
                                        <td>공지</td>
                                        <td>
                                            국가지원 광견병 접종 안내
                                        </td>
                                        <td>
                                            2024-01-19
                                        </td>
                                        <td>
                                            76
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header border-0">
                                <h3 class="card-title">직원관리</h3>
                                <div class="card-tools">
                                    <a href="javascript:void(0);">>더보기</a>
                                </div>
                            </div>
                            <div class="card-body table-responsive p-0">
                                <table class="table table-striped table-valign-middle">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th>이름</th>
                                        <th>직무</th>
                                        <th>이메일</th>
                                        <th>전화번호</th>
                                        <th>생년원일</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            😉
                                        </td>
                                        <td>김엘머</td>
                                        <td>
                                            간호
                                        </td>
                                        <td>
                                            jang6831728@naver.com
                                        </td>
                                        <td>
                                            010-1234-1234
                                        </td>
                                        <td>
                                            2023-02-20
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            😉
                                        </td>
                                        <td>김엘머</td>
                                        <td>
                                            간호
                                        </td>
                                        <td>
                                            jang6831728@naver.com
                                        </td>
                                        <td>
                                            010-1234-1234
                                        </td>
                                        <td>
                                            2023-02-20
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            😉
                                        </td>
                                        <td>김엘머</td>
                                        <td>
                                            간호
                                        </td>
                                        <td>
                                            jang6831728@naver.com
                                        </td>
                                        <td>
                                            010-1234-1234
                                        </td>
                                        <td>
                                            2023-02-20
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            😉
                                        </td>
                                        <td>김엘머</td>
                                        <td>
                                            간호
                                        </td>
                                        <td>
                                            jang6831728@naver.com
                                        </td>
                                        <td>
                                            010-1234-1234
                                        </td>
                                        <td>
                                            2023-02-20
                                        </td>
                                    </tr>
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

