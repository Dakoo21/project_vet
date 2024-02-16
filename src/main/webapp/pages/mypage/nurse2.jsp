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
    <%--월간달력--%>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const calendarEl = document.getElementById('calendar')
            const calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth'/* 세로줄 */
                , schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
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

                , headerToolbar: {//헤더 설정
                    left: 'prev',
                    center: 'title',
                    right: 'next today'
                },
                /*0000년 0월 0일 문제 왜 일이 +10을 해야하지?*/
                titleFormat: function (date) {
                    year = date.date.year;
                    month = date.date.month + 1;
                    day = date.date.day + 10;

                    return year + "-" + month + "월" + "-" + day + "일";
                },
            })

            calendar.render()

            /*2번째 */

            // document.addEventListener('DOMContentLoaded', function() {
            //     var calendarEl = document.getElementById('dayGridCalendar');
            //     var dayGridcalendar = new FullCalendar.Calendar(calendarEl, {
            //         initialView: 'dayGridMonth'
            //     });
            //     calendar.render();
            // });


            // document.addEventListener('DOMContentLoaded', function() {
            //     const calendarEl = document.getElementById('dayGridCalendar');
            //
            //     const dayGridCalendar = new FullCalendar.Calendar(calendarEl, {
            //         timeZone: 'UTC',
            //         initialView: 'timeGridFourDay',
            //         headerToolbar: {
            //             left: 'prev,next',
            //             center: 'title',
            //             right: 'timeGridDay,timeGridFourDay'
            //         },
            //         views: {
            //             timeGridFourDay: {
            //                 type: 'timeGrid',
            //                 duration: { days: 1},
            //                 buttonText: '4 day'
            //             }
            //         },
            //         events: '/api/demo-feeds/events.json'
            //     });
            //
            //     calendar.render();
            // });
            /*3번째*/

            var calendarE = document.getElementById('calendarDay');

            var calendarDay = new FullCalendar.Calendar(calendarE, { // 변수명 변경
                timeZone: 'UTC',
                initialView: 'timeGridFourDay',
                schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
                , locale: 'ko'
                , allDaySlot: false // 올데이 슬롯 비활성화
                , headerToolbar: {
                    left: 'prev',
                    center: 'title',
                    right: 'next'
                },
                slotMinTime: '10:00:00', // 시작 시간을 오전 10시로 설정
                slotMaxTime: '20:00:00', // 종료 시간을 오후 8시로 설정
                views: {
                    timeGridFourDay: {
                        type: 'timeGrid',
                        duration: {days: 1},
                        buttonText: '4 day'
                    }
                },
            });
            calendarDay.render(); // 변수명 변경
        });

        <%--이건 일일현황--%>
        document.addEventListener('DOMContentLoaded', function () {
            var calendarTimelineEl = document.getElementById('calendarTimeline');
            var calendarTimeline = new FullCalendar.Calendar(calendarTimelineEl, {
                initialView: 'resourceTimelineOneDay'
                , schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
                , views: {
                    resourceTimelineOneDay: {
                        type: 'resourceTimeline',
                        duration: {days: 1}
                    }
                }
                , locale: 'ko'
                , slotMinTime: '10:00:00', // 시작 시간을 오전 10시로 설정
                slotMaxTime: '20:00:00' // 종료 시간을 오후 8시로 설정
                , headerToolbar: {
                    left: '',
                    center: '',
                    right: ''

                },
            });
            calendarTimeline.render();
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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <!--영역1-->
                        <div class="card">
                            <div class="card-header border-0">
                                <div class="d-flex justify-content-between">
                                    <h3 class="card-title">월별캘린더</h3>
                                    <a href="javascript:void(0);">더보기</a>
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
                                <h3 class="card-title">일일에약현황</h3>
                                <a href="javascript:void(0);">더보기</a>
                            </div>
                            <div class="card-body table-responsive p-0">
                                <table class="table table-striped table-valign-middle">
                                    <thead>
                                    <tr>
                                        <th>제목</th>
                                        <th>작성일</th>
                                        <th>작성자</th>
                                        <th>조회수</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <img src="dist/img/default-150x150.png" alt="Product 1"
                                                 class="img-circle img-size-32 mr-2">
                                            Some Product
                                        </td>
                                        <td>$13 USD</td>
                                        <td>
                                            <small class="text-success mr-1">
                                                <i class="fas fa-arrow-up"></i>
                                                12%
                                            </small>
                                            12,000 Sold
                                        </td>
                                        <td>
                                            <a href="#" class="text-muted">
                                                <i class="fas fa-search"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="dist/img/default-150x150.png" alt="Product 1"
                                                 class="img-circle img-size-32 mr-2">
                                            Another Product
                                        </td>
                                        <td>$29 USD</td>
                                        <td>
                                            <small class="text-warning mr-1">
                                                <i class="fas fa-arrow-down"></i>
                                                0.5%
                                            </small>
                                            123,234 Sold
                                        </td>
                                        <td>
                                            <a href="#" class="text-muted">
                                                <i class="fas fa-search"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="dist/img/default-150x150.png" alt="Product 1"
                                                 class="img-circle img-size-32 mr-2">
                                            Amazing Product
                                        </td>
                                        <td>$1,230 USD</td>
                                        <td>
                                            <small class="text-danger mr-1">
                                                <i class="fas fa-arrow-down"></i>
                                                3%
                                            </small>
                                            198 Sold
                                        </td>
                                        <td>
                                            <a href="#" class="text-muted">
                                                <i class="fas fa-search"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <img src="dist/img/default-150x150.png" alt="Product 1"
                                                 class="img-circle img-size-32 mr-2">
                                            Perfect Item
                                            <span class="badge bg-danger">NEW</span>
                                        </td>
                                        <td>$199 USD</td>
                                        <td>
                                            <small class="text-success mr-1">
                                                <i class="fas fa-arrow-up"></i>
                                                63%
                                            </small>
                                            87 Sold
                                        </td>
                                        <td>
                                            <a href="#" class="text-muted">
                                                <i class="fas fa-search"></i>
                                            </a>
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
                                <h3 class="card-title">공지사항</h3>
                                <div class="card-tools">
                                    <a href="javascript:void(0);">더보기</a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="position-relative mb-4">
                                    <table class="bigTable">
                                        <tr>
                                            <td>
                                                <div class="box-title">
                                                    <div id='calendarDay'></div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="d-flex flex-row justify-content-end">
                                  <span class="mr-2">
                                    <i class="fas fa-square text-primary"></i> This year
                                  </span>
                                  <span>
                                    <i class="fas fa-square text-gray"></i> Last year
                                  </span>
                                </div>
                            </div>
                        </div>
                        <!-- /.card -->
                        <!--영역4-->
                        <div class="card">
                            <div class="card-header border-0">
                                <h3 class="card-title">시설 예약현황</h3>
                                <div class="card-tools">
                                    <a href="javascript:void(0);">더보기</a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                                    <p class="text-success text-xl">
                                        <i class="ion ion-ios-refresh-empty"></i>
                                    </p>
                                    <p class="d-flex flex-column text-right">
                                        <span class="font-weight-bold">
                                          <i class="ion ion-android-arrow-up text-success"></i> 12%
                                        </span>
                                        <span class="text-muted">CONVERSION RATE</span>
                                    </p>
                                </div>
                                <!-- /.d-flex -->
                                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                                    <p class="text-warning text-xl">
                                        <i class="ion ion-ios-cart-outline"></i>
                                    </p>
                                    <p class="d-flex flex-column text-right">
                                        <span class="font-weight-bold">
                                          <i class="ion ion-android-arrow-up text-warning"></i> 0.8%
                                        </span>
                                        <span class="text-muted">SALES RATE</span>
                                    </p>
                                </div>
                                <!-- /.d-flex -->
                                <div class="d-flex justify-content-between align-items-center mb-0">
                                    <p class="text-danger text-xl">
                                        <i class="ion ion-ios-people-outline"></i>
                                    </p>
                                    <p class="d-flex flex-column text-right">
                                        <span class="font-weight-bold">
                                          <i class="ion ion-android-arrow-down text-danger"></i> 1%
                                        </span>
                                        <span class="text-muted">REGISTRATION RATE</span>
                                    </p>
                                </div>
                                <!-- /.d-flex -->
                            </div>
                        </div>
                    </div>
                    <!-- /.col-md-6 -->
                </div>
                <!-- /.row -->
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

