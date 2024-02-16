<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/main.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.10/index.global.min.js'></script>
    <%--월간달력--%>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const calendarEl = document.getElementById('calendar')
            const calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth'
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
                ,customButtons: {
                    myCustomButton: {
                        text: '예약',
                        click: function() {
                            var modal = document.getElementById('ReserveModal');
                            modal.style.display = "block";
                        }
                    }
                }

                ,headerToolbar: {
                    left: 'prev',
                    center: 'title',
                    right: 'next today myCustomButton'
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
        })
    </script>
    <%--이건 일일현황--%>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarTimelineEl = document.getElementById('calendarTimeline');
            var calendarTimeline = new FullCalendar.Calendar(calendarTimelineEl, {
                initialView: 'resourceTimelineOneDay'
                ,schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives'
                ,views: {
                    resourceTimelineOneDay: {
                        type: 'resourceTimeline',
                        duration: { days: 1 }
                    }
                }
                ,locale: 'ko'
                ,slotMinTime: '10:00:00', // 시작 시간을 오전 10시로 설정
                slotMaxTime: '20:00:00' // 종료 시간을 오후 8시로 설정
                ,headerToolbar: {
                    left: '',
                    center: '',
                    right: ''

                },
            });
            calendarTimeline.render();
        });
        /*모달 관련*/
        /*        var modalBtn = document.getElementById("modalBtn");
                var modal = document.getElementById("modal");
                var closeBtn = document.getElementsByClassName("close")[0];

                modalBtn.onclick = function() {
                    modal.style.display = "block";
                }

                closeBtn.onclick = function() {
                    modal.style.display = "none";
                }
        */
        /*        window.onclick = function(event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }*///바탕화면 누르면 사라지는
        // 선택바 요소 가져오기
        var selectBox = document.getElementById("selectBox");
    </script>
    <style>
        /* CSS 코드를 여기에 작성합니다 */
        #calendar {
            height: 65vh;
            width: 70vw;
            margin: 0 auto;
        }

        #calendarTimeline{
            height: 40vh;
        }
        /*사이드바 */
        .main-sidebar {z-index: 2;}
        .main-header {z-index: 3;}
        /*모달 관련*/
        #ReserveModal {
            display: none;
            position: fixed;
            z-index: 3  ;
            right: 0;
            top: 0;
            width: 100%; /* 모달의 너비 설정 */
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4); /* 반투명 배경 */
        }

        .modal-content {
            background-color: white;
            left: 10%;
            margin: 3% auto;
            padding: 2%;
            border-radius: 15px; /* 둥근 모서리 설정 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 추가 */
            width: 60%;
            margin-left: 20%;
            height: 93%;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .reserveModal-header,
        .reserveModal-footer,
        .reserveModal-body ,
        .body{
            padding: 15px;

        }

        .reserveModal-body {
            font-size: 20px;
            heigt:100%;
            width:100%;
            line-height: 2.5; /* 기본 높이의 1.5배 */

        }

        /* 선택바 스타일 */
        .selectRoom-box {
            width: 130px;
            font-size: 25px;
        }
        .reserveModal-footer {
            position: absolute;
            bottom: 0;
            right: 0; /* 오른쪽에 위치하도록 설정 */
        }
        .select-box{
            width:100px;
        }
        /* 선택된 내용 출력 영역 스타일 */
        .output {
            margin-top: 10px;
            font-weight: bold;
            font-size: 38px;
        }

        .reservePicture img {
            margin-right: 5%;/* 이미지 사이의 우측 간격을 10px로 설정합니다. */
            max-width: 100%; /* 이미지의 최대 가로 너비를 부모 요소인 reservePicture의 너비에 맞게 조정합니다. */
            height: auto; /* 이미지의 비율을 유지하면서 자동으로 높이를 조정합니다. */
            float: right;
        }

        #r_content{
            width: 100%;
            padding: 0;
            font-size: 14px;
        }
        .reserveContent,
        .reservePicture {
            display: flex;
            align-items: center; /* 텍스트 수직 중앙 정렬 */

        }

        .textareaWrapper {
            margin-left: 10px; /* 내용과 텍스트 영역 사이의 간격 설정 */
        }

        .fixedtable{
            max-width: 100%;
        }
    </style>
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
            <div id='calendar'></div>
            <div id='calendarTimeline'></div>
            <!-- ========================== [[ 게시판 Modal ]] ========================== -->
            <div id="ReserveModal">
                <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="reserveModal-header">
                        <select id="selectRoomBox" class="selectRoom-box">
                            <option value="">수술실</option>
                            <option value="1">면회실</option>
                            <option value="2">방사선실</option>
                            <option value="3">미용실</option>
                            <!-- 필요한 만큼 옵션을 추가하세요 -->
                        </select>
                    </div>
                    <div class="body">
                        <table class="reserveModal-body">
                            <tr class="fixedtable">
                                <td>시설이미지</td>
                                <td class ="reservePicture">
                                    <img src="./62562747.PNG" alt="시설사진1" width=30%>
                                    <img src="./62562747.PNG" alt="시설사진2" width=30%>
                                </td>
                            </tr>
                            <tr>
                                <td>예약시간</td>
                                <td>
                                    <select id="selecStartTimetBox" class="select-box">
                                        <option value="">10:00</option>
                                        <option value="1">10:30</option>
                                        <option value="2">11:00</option>
                                        <option value="2">12:00</option>
                                        <!-- 오늘일경우 오늘 시간 이후 시간 셀렉트 -->
                                    </select>
                                    <span>~</span>
                                    <select id="selectEndTimeBox" class="select-box">
                                        <option value="">13:00</option>
                                        <option value="1">13:30</option>
                                        <option value="2">14:00</option>
                                        <option value="3">15:00</option>
                                        <!-- 선택 시작 시간 이후 시간 셀렉트 -->
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>예약자</td>
                                <td>내이름</td>
                            </tr>
                            <tr>
                                <td>보호자명</td>
                                <td>
                                    <button type="button" class="reserveSearchButton" onclick="모달열리게">#️⃣</button>
                                    <select id="customer" class="select-box">
                                        <option value="">꽁지</option>
                                        <option value="1">꽁꽁지</option>
                                        <!-- 선택 시작 시간 이후 시간 셀렉트 -->
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>
                                    <div class="reserveContent">
                                        <div class="textareaWrapper">
                                            <textarea rows="5" aria-label="With textarea" id="r_content" name="r_content"></textarea>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="reserveModal-footer">
                        <button class="reservation-button">예약수정</button>
                        <button class="reservation-button">예약취소</button>
                        <button class="reservation-button" onclick="window.location.href='http://localhost:8000/pages/reservespot/dailyReserve.jsp'">목록으로 돌아가기</button>
                    </div>
                </div>
            </div>
            <!-- footer end    -->
            <!-- ========================== [[ 검색창 Modal ]] ========================== -->
            <div class="modal" id="SerchForm"></div>
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

