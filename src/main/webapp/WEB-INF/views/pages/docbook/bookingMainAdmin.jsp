<%@ page import="java.util.List" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    List<Map<String, Object>> bList = (List)request.getAttribute("bList");



%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>고객예약페이지</title>
    <%@include file="/include/common/bootstrap_common.jsp"%>
    <link rel="stylesheet" href="/css/reserveInsert1.css">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/main.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.10/index.global.min.js'></script>
    <%--월간달력--%>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let events;
            const calendarEl = document.getElementById('calendar')
            const calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth'
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
                        url: 'bookingDetail?bookingPK=<%=Integer.parseInt(rmap.get("bookingPk").toString())%>',
                        background: '000000',
                    }
                    <% if (i < bList.size() - 1) { %>,<% } %>
                    <% } %>
                ]
            });
            calendar.render();

            console.log(events); // 여기서 events를 사용합니다.

        })

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
        /* 선택바 스타일 */
        .selectRoom-box {
            width: 130px;
            font-size: 25px;
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
                        <h1>진료조회(직원)</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Icons</li>
                        </ol>
                    </div>
                    <div id='calendar'></div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <div style="text-align: center;">

            <a id="reservationButton" href="http://localhost:8000/booking/bookingRegister"><button style="right: 150px">예약</button></a>
        </div>
    </div>
    <!-- /.content-wrapper -->
    <!--footer-->

</div>




<!-- ./wrapper -->
<%@ include file="/include/footer.jsp"%>
<%@ include file="/include/bootCommonFoot.jsp"%>
</body>
</html>
<!--예약 모달 script-->
<script>
    // 예약 버튼 요소 가져오기
    var reservationButton = document.getElementById("reservationButton");

    // 모달 요소 가져오기
    var reserveModal = document.getElementById("reservationModal");

    // 모달의 닫기 버튼 요소 가져오기
    var closeButton = document.querySelector(".close");

    // 예약 버튼을 클릭하면 모달 창 표시
    reservationButton.addEventListener("click", function() {
        reserveModal.style.display = "block";
    });

    // 모달의 닫기 버튼을 클릭하면 모달 창 닫기
    closeButton.addEventListener("click", function() {
        reserveModal.style.display = "none";
    });

    // 모달 외부를 클릭하면 모달 창 닫기
    window.addEventListener("click", function(event) {
        if (event.target == modal) {
            reserveModal.style.display = "none";
        }
    });
    <!--Date picker-->
    $('#reservationdate').datetimepicker({
        format: 'L'
    });

    <!-- 조회 모달 -->
    // 예약 버튼 요소 가져오기
    var reservationDetailButton = document.getElementById("reservationDetailButton");

    // 모달 요소 가져오기
    var detailModal = document.getElementById("reserveDetailModal");

    // 모달의 닫기 버튼 요소 가져오기
    var detailCloseButton = document.querySelector(".detailclose");

    // 예약 버튼을 클릭하면 모달 창 표시
    reservationDetailButton.addEventListener("click", function() {
        detailModal.style.display = "block";
    });

    // 모달의 닫기 버튼을 클릭하면 모달 창 닫기
    detailCloseButton.addEventListener("click", function() {
        detailModal.style.display = "none";
    });
</script>
