<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
    <%@ include file="/include/bootCommon.jsp" %>
    <!--달력-->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/main.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.10/index.global.min.js'></script>
    <script src='fullcalendar-scheduler/dist/index.global.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/resource-timegrid@6.1.10/index.global.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>

    <%--월간달력--%>
    <script>

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
                    year = date.date.year;
                    month = date.date.month + 1;

                    return year + " - " + month + "월";
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
        /* 두 번째 열 스타일 */
        .animalTable tr td:nth-child(2) {
            background-color: ghostwhite; /* 두 번째 열 배경색 */
        }
        .animalTable th, .animalTable td {
            border: 2px;
            padding: 5px; /* 셀 내 여백 설정 */
            text-align: center;
            border-bottom: 10px solid white; /*배경색*/
        }
        img {
            max-width: 45mm;
            max-height: 35mm;
            width: auto;
            height: auto;
        }
        .image-container{
            display: flex;
            margin: 15px  40px 15px 15px;
        }
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
                                    <h3 class="card-title">나의 반려동물</h3>
                                    <a href="javascript:void(0);">>더보기</a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="position-relative mb-4">
                                    <div class="image-container">
                                        <img src="your-image.png" alt="이미지">
                                        <table class="animalTable">
                                            <tr>
                                                <td>동물 이름</td>
                                                <td>꽁지</td>
                                            </tr>
                                            <tr>
                                                <td>종류</td>
                                                <td>개</td>
                                            </tr>
                                            <tr>
                                                <td>품종</td>
                                                <td>불독</td>
                                            </tr>
                                            <tr>
                                                <td>성별/중성화</td>
                                                <td>여 / 중성화</td>
                                            </tr>
                                            <tr>
                                                <td>생년월일</td>
                                                <td>2022.02.02</td>
                                            </tr>
                                            <tr>
                                                <td>몸무게</td>
                                                <td>5.4kg</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="d-flex flex-row justify-content-end">

                                </div>
                            </div>
                        </div>
                        <!-- /.card -->
                        <!--영역2-->
                        <div class="card">
                            <div class="card-header border-0">
                                <h3 class="card-title">최근 결제내역</h3>
                                <div class="card-tools">
                                    <a href="javascript:void(0);">>더보기</a>
                                </div>
                            </div>
                            <div class="card-body table-responsive p-0">
                                <table class="table table-striped table-valign-middle">
                                    <thead>
                                    <tr>
                                        <th>결제일시</th>
                                        <th>결제내역</th>
                                        <th>결제금액</th>
                                        <th>영수증</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            2020-01-22
                                        </td>
                                        <td>0000...외 2건</td>
                                        <td>
                                            40,000
                                        </td>
                                        <td>
                                            <button class="checkBtn"><a href="#">확인</a></button>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            2020-01-22
                                        </td>
                                        <td>0000...외 2건</td>
                                        <td>
                                            40,000
                                        </td>
                                        <td>
                                            <button class="checkBtn"><a href="#">확인</a></button>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            2020-01-22
                                        </td>
                                        <td>0000...외 2건</td>
                                        <td>
                                            40,000
                                        </td>
                                        <td>
                                            <button class="checkBtn"><a href="#">확인</a></button>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <%--                                            <img src="dist/img/default-150x150.png" alt="Product 1"--%>
                                            <%--                                                 class="img-circle img-size-32 mr-2">--%>
                                            <%--    이미지--%>
                                            2020-01-22
                                        </td>
                                        <td>0000...외 2건</td>
                                        <td>
                                            40,000
                                        </td>
                                        <td>
                                            <button class="checkBtn"><a href="#">확인</a></button>
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
                                <h3 class="card-title">월별 캘린더</h3>
                                <div class="card-tools">
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
                            </div>
                        </div>
                        <!-- /.card -->
                        <!--영역4-->


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

