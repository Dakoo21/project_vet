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
    int mysize = 0;// 예약 전체 레코드 수
    //xxx.java에서 생성된 자료구조를 jsp에서 사용하려면 forward scope를 사용한다. 그래야 null이 일어나지 않고 받아올 수 있다.
    List<Map<String, Object>> myList = (List)request.getAttribute("myList");
    List<SignTotal> esignList = (List<SignTotal>) request.getAttribute("esignList");
    if(myList !=null){//null이면 nullpointException발동할 수 있다 500번 에러 방지
        mysize = myList.size();
    }
    int size = 0;
    if (noticeList != null) {
        size = noticeList.size();
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
    <!--달력-->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/main.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.10/index.global.min.js'></script>
    <script src='fullcalendar-scheduler/dist/index.global.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/resource-timegrid@6.1.10/index.global.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>

    <%--    차트스크립트--%>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="jquery-1.8.1.js"></script>
    <script type="text/javascript" src="ajax-sample.js"></script>

<%--월간달력--%>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let events;
            const calendarEl = document.getElementById('calendar')
            const calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                eventLimit: true,
                eventLimitText: '더 보기',
                eventLimitClick: 'popover',
                schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
                locale: 'ko',
                fixedWeekCount: false,
                dayCellContent: function (info) {
                    if (info.view.type === "dayGridMonth") {
                        var number = document.createElement("a");
                        number.classList.add("fc-daygrid-day-number");
                        number.innerHTML = info.dayNumberText.replace("일", '').replace("日", "");
                        return {html: number.outerHTML};
                    }
                    return {};
                },
                headerToolbar: {
                    left: 'prev',
                    center: 'title',
                    right: 'next today'
                },
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

            /*2번째*/
            var calendarDayElement = document.getElementById('calendarDay');
            var calendarDayInstance = new FullCalendar.Calendar(calendarDayElement, {
                timeZone: 'UTC',
                initialView: 'timeGridDay',
                schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
                locale: 'ko',
                allDaySlot: false,
                headerToolbar: {
                    left: 'prev',
                    center: 'title',
                    right: 'next'
                },
                slotMinTime: '10:00:00',
                slotMaxTime: '20:00:00',
            });
            calendarDayInstance.render();

            <% SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
               for (int i = 0; i < bList.size(); i++) {
                   Map<String, Object> rmap = bList.get(i);
                   Date startDate = dateFormat2.parse(rmap.get("bookingDate").toString() + " " + rmap.get("bookingStart").toString());
                   Date endDate = dateFormat2.parse(rmap.get("bookingDate").toString() + " " + rmap.get("bookingEnd").toString());
            %>
            calendarDayInstance.addEvent({
                title: '<%= rmap.get("bookingType") %> 예약',
                start: '<%= dateFormat2.format(startDate) %>',
                end: '<%= dateFormat2.format(endDate) %>',
                url: 'bookingDetail?bookingPK=<%=Integer.parseInt(rmap.get("bookingPk").toString())%>',
                background: '000000',
            });
            <% } %>
        });
    </script>
    <style>
        hr {
            border-top: 3px solid black;
            width: 98%;
        }

        h1 small a {
            color: black;
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
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>마이페이지</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
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
                        <div class="card">
                            <div class="card-header border-0">
                                <h3 class="card-title">문서보관함</h3>
                                <div class="card-tools">
                                    <a href="/eSign/docsBox">더보기</a>
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
                                            for(int i=nowPage*5;i<(nowPage*5)+5;i++){
                                                if(i == size) break;
                                                SignTotal signTotal = esignList.get(i);
                                                String docState = null;
                                                if(signTotal.getSIGN_STATE()==0 || signTotal.getSIGN_STATE()==1 || signTotal.getSIGN_STATE()==2){
                                                    docState = "기안";
                                                }else if(signTotal.getSIGN_STATE()==3){
                                                    docState = "결재";
                                                }else if(signTotal.getSIGN_STATE()==-1){
                                                    docState = "반려";
                                                }
                                                int docNo = signTotal.getSIGN_PK();
                                                String docTitle = signTotal.getSIGN_TITLE();
                                                // String docContent = doc.getSign_content();
                                                // int signpk = doc.getSign_pk();
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
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-header border-0">
                                <h3 class="card-title">당일예약현황</h3>
                                <div class="card-tools">
                                    <a href="/booking/bookingList">더보기</a>
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
                    </div>
                </div>
            </div>
        </section>
    </div>
    <%@ include file="/include/footer.jsp" %>
</div>
<%@ include file="/include/bootCommonFoot.jsp" %>
<script>
    //동적 반영해보기
    google.charts.load('current', {'packages':['timeline']});
    google.charts.setOnLoadCallback(drawChart);


    function drawChart() {
        const container = document.getElementById('timeline');

        const chart = new google.visualization.Timeline(container);
        let dataTable = new google.visualization.DataTable();


        dataTable.addColumn({ type: 'string', id: 'Room' });
        dataTable.addColumn({ type: 'string', id: 'animalNM' }); // 막대라벨
        dataTable.addColumn({ type: 'date', id: 'Start' });
        dataTable.addColumn({ type: 'date', id: 'End' });


        const dailyDateInput = document.getElementById('dailyDate');
        dailyDateInput.addEventListener('change', function() {
            const facilityReserveDt = dailyDateInput.value; // 날짜 입력란에서 선택한 날짜
            console.log("선택날짜:" + dailyDateInput.value);

            console.log("조건문 전 dataTable:"+dataTable.getNumberOfRows());
            if (dataTable.getNumberOfRows()>0){
                console.log("조건문 처리후 dataTable:"+dataTable.getNumberOfRows());
                dataTable.removeRows(0,dataTable.getNumberOfRows());
            }

            fetch('/reservespot/dailyReserveAll?facilityReserveDt=' + facilityReserveDt)
                .then(response => response.json())
                .then(data => {

                    // 서버에서 받아온 데이터를 바탕으로 DataTable에 행 추가
                    data.forEach(function(allList) {
                        const room = allList.FACILITY_NM; //수술실,면회실,방사선실,미용실
                        const startTimeString = allList.START_TIME; // "10:00"와 같은 형식의 문자열
                        const endTimeString = allList.END_TIME; // "11:00"와 같은 형식의 문자열
                        const dateString = allList.FACILITY_RESERVE_DT; // "2024-03-31"와 같은 형식의 문자열
                        const facilityId = allList.FACILITY_RESERVE_ID;
                        let animalNM;

                        if (allList.MASTER_NM != "") {
                            animalNM = allList.ANIMAL_NM + "(" + allList.MASTER_NM + ")";
                        } else {
                            animalNM = allList.ANIMAL_NM;
                        }

                        // 시작 시간을 처리
                        let startHour = parseInt(startTimeString.split(":")[0]); // "10:00"에서 시간 부분 추출
                        let startMinute = parseInt(startTimeString.split(":")[1]); // "10:00"에서 분 부분 추출
                        const [year, month, day] = dateString.split("-").map(Number); // 년도, 월, 일 추출
                        const start = new Date(year, month - 1, day, startHour, startMinute); // 시작 시간을 생성

                        // 종료 시간을 처리
                        let endHour = parseInt(endTimeString.split(":")[0]); // "11:00"에서 시간 부분 추출
                        let endMinute = parseInt(endTimeString.split(":")[1]); // "11:00"에서 분 부분 추출
                        const end = new Date(year, month - 1, day, endHour, endMinute); // 종료 시간을 생성

                        // DataTable에 행 추가
                        dataTable.addRow([room, animalNM, start, end]);
                        console.log("데이터테이블 길이: "+dataTable.getNumberOfRows());

                        // 옵션 설정
                        const options = {
                            timeline: { colorByRowLabel: true },
                            backgroundColor: '#FFFFFF',
                            hAxis: {
                                format: 'HH:mm',
                                minValue: new Date(year, month - 1, day, 10, 0, 0),  // 10시
                                maxValue: new Date(year, month - 1, day, 20, 0, 0)  // 오후 8시
                            }
                        };

                        // 차트 그리기
                        chart.draw(dataTable, options);
                    });
                })
                .catch(error => {
                    console.error('Failed to fetch data:', error);
                });

        });

        // @CHS@
        var event = new Event('change');
        dailyDateInput.dispatchEvent(event);
        // @CHS@
    }
</script>
</body>
</html>
