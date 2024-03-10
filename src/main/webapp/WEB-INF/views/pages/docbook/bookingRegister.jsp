<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    List<Map<String, Object>> aList = (List)request.getAttribute("aList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <style>
        /* 추가한 스타일 */
        .separator {
            margin-top: 20px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
        }
    </style>
    <script>
        function animalSearch() {
            const searchAnimalNm = document.getElementById("searchAnimalNm").value;
            console.log(searchAnimalNm);
            if (searchAnimalNm === "") {
                return; // 검색어가 없으면 아무것도 하지 않음
            }
            // 서버에 검색을 수행하기 위해 AJAX 요청 보내기
            const xhr = new XMLHttpRequest();
            console.log("아작스"+searchAnimalNm);
            xhr.open("GET", `/reservespot/animalList?animalNm=`+searchAnimalNm);
            console.log("겟하고난뒤"+searchAnimalNm);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        console.log(xhr.responseText)
                        const response = JSON.parse(xhr.responseText);
                        // 검색 결과를 모달에 표시
                        displaySearchResults(response);
                    } else {
                        console.error("오류:", xhr.statusText);
                    }
                }
            };
            xhr.send();
            // // 검색어 입력창 초기화
            document.getElementById("searchAnimalNm").value = '';
        }
        // 선택바 검색 결과 표시 함수
        function displaySearchResults(results) {
            var select = document.getElementById('animalSelect'); // 선택 바 엘리먼트를 가져옵니다.

            // 기존 옵션을 모두 제거합니다.
            select.innerHTML = '';

            // JSON 데이터를 반복하여 옵션을 추가합니다.
            results.forEach(results => {
                var option = document.createElement('option');
                option.value = results.ANIMALID; // 옵션의 값 설정
                option.text = "("+results.ANIMALBDATE+")"+ ": "+ results.MASTER_NM; // 옵션의 텍스트 설정
                select.appendChild(option); // 선택 바에 옵션을 추가합니다.
            });
            // const searchResultsList = document.getElementById('searchResults');
            // // 이전에 표시된 결과를 모두 지우기
            // searchResultsList.innerHTML = '';
            // // 결과를 모달에 추가
            // results.forEach(result => {
            //     const listItem = document.createElement('li');
            //     console.log(result);
            //     console.log(Object.keys(result));
            //     listItem.textContent = " ("+result.ANIMALBDATE+") " + result.ANIMALNM + " : " + result.MASTER_NM ; // 결과에서 동물 이름과 날짜를 가져와서 li 요소에 표시
            //     // li 요소에 margin-bottom 스타일 추가
            //     console.log("리스트아이템"+listItem);
            //     listItem.style.marginBottom = '7px';
            //     searchResultsList.appendChild(listItem);
            //     // 클릭 이벤트 리스너 등록
            //     listItem.addEventListener('click', function() {
            //         // 다른 모달에 Nm 내용 추가
            //         document.getElementById('inputMasterNm').value = result.MASTER_NM;
            //         document.getElementById('animalNm').value = result.ANIMALNM;
            //         document.getElementById('animalPk').value = result.ANIMALID;
            //     });
            // });
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
                        <h1>예약신청</h1>
                    </div>

                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <!--여기 -->
            <div class="separator"></div>




                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="searchIcon">
                            <input type="text" class="form-control" id="searchAnimalNm" placeholder="동물명을 입력후 검색하세요." aria-label="Search" aria-describedby="searchIcon" onkeyup="if (event.keyCode === 13) animalSearch()">
                            <button onclick="animalSearch()">검색</button>
                        </span>
                    </div>


                </div>
            <form action="bookingInsert" method="post">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                <select class="custom-select" id="animalSelect" name="animalPk">
                    <option selected>동물을 선택하세요...</option>
                </select>
                    </div>
                </div>



                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="typeSelect"><%= "서비스 이름" %></label>
                    </div>
                    <select class="custom-select" id="typeSelect" name="bookingType">
                        <option selected>원하는 서비스를 선택하세요</option>
                        <option value="미용">미용</option>
                        <option value="진료">진료</option>

                    </select>
                    <div class="input-group-append">

                        <div class="input-group-text">

                                    <span class="fas fa-user">

                                    </span>
                        </div>
                    </div>
                </div>
                <div id="additionalInfo1" style="display: none;">
                    <!-- 미용 서비스를 선택했을 때 추가되는 내용 -->
                    <!-- 여기에 미용 서비스와 관련된 추가 정보를 입력하세요 -->
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="designerSelect">디자이너명</label>
                        </div>
                        <select class="custom-select" id="designerSelect" name="userPk">
                            <option value="99999997">미용사1</option>
                            <option value="99999996">미용사2</option>


                        </select>
                        <div class="input-group-append">

                            <div class="input-group-text">

                                    <span class="fas fa-user">

                                    </span>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="additionalInfo2" style="display: none;">
                    <!-- 진료 서비스를 선택했을 때 추가되는 내용 -->
                    <!-- 여기에 진료 서비스와 관련된 추가 정보를 입력하세요 -->
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="docterSelect">담당의</label>
                        </div>
                        <select class="custom-select" id="docterSelect" name="userPk">
                            <option value="99999999">원장</option>
                            <option value="99999998">의사2</option>


                        </select>
                        <div class="input-group-append">

                            <div class="input-group-text">

                                    <span class="fas fa-user">

                                    </span>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="datepicker1">날짜선택</label>
                    </div>
                    <input type="text" class="form-control" id="datepicker1" name="bookingDate" style="opacity: 1;" value="">

                </div>
                <div class="input-group mb-3">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="start-time">시작시간</label>
                        </div>
                        <select id="start-time" name="bookingStart" onchange="setEndTime(this.value)">
                            <option selected>시간 선택</option>
                            <option value="10:00">10:00</option>
                            <option value="10:30">10:30</option>
                            <option value="11:00">11:00</option>
                            <option value="11:30">11:30</option>
                            <option value="12:00">12:00</option>
                            <option value="12:30">12:30</option>
                            <option value="13:00">13:00</option>
                            <option value="13:30">13:30</option>
                            <option value="14:00">14:00</option>
                            <option value="14:30">14:30</option>
                            <option value="15:00">15:00</option>
                            <option value="15:30">15:30</option>
                            <option value="16:00">16:00</option>
                            <option value="16:30">16:30</option>
                            <option value="17:00">17:00</option>
                            <option value="17:30">17:30</option>
                            <option value="18:00">18:00</option>
                            <option value="18:30">18:30</option>
                            <option value="19:00">19:00</option>

                        </select>
                        <div>

                        </div>

                        <div class="input-group-prepend">
                            <select type="hidden" id="end-time" name="bookingEnd">
                                <option selected>시간 선택</option>
                                <option value="10:30">10:30</option>
                                <option value="11:00">11:00</option>
                                <option value="11:30">11:30</option>
                                <option value="12:00">12:00</option>
                                <option value="12:30">12:30</option>
                                <option value="13:00">13:00</option>
                                <option value="13:30">13:30</option>
                                <option value="14:00">14:00</option>
                                <option value="14:30">14:30</option>
                                <option value="15:00">15:00</option>
                                <option value="15:30">15:30</option>
                                <option value="16:00">16:00</option>
                                <option value="16:30">16:30</option>
                                <option value="17:00">17:00</option>
                                <option value="17:30">17:30</option>
                                <option value="18:00">18:00</option>
                                <option value="18:30">18:30</option>
                                <option value="19:00">19:00</option>
                                <option value="19:30">19:30</option>
                            </select>

                        </div>
                        <div class="col-4" id="submitButtonWrapper">
                            <button type="submit" class="btn btn-primary btn-block">예약</button>
                        </div>
                        <script>
                            window.onload = function() {
                                setDefaultDate();
                                setEarliestTime();
                                setEndTime();

                            };
                            function setEarliestTime() {
                                const startTimeSelect = document.getElementById("start-time");
                                const now = new Date();
                                const currentHour = now.getHours();
                                const currentMinute = now.getMinutes();
                                // 가장 이른 시간을 계산합니다.
                                let earliestTime = '';
                                if (currentMinute < 30) {
                                    earliestTime = currentHour + ":30";
                                } else {
                                    earliestTime = (currentHour + 1) + ":00";
                                }
                                // 선택한 시간이 시작 시간 select 요소에 있는지 확인하고, 없으면 모달을 표시합니다.
                                if (!startTimeSelect.querySelector("option[value='" + earliestTime + "']")) {
                                    showModal();
                                } else {
                                    // 기본값으로 가장 이른 시간을 선택합니다.
                                    startTimeSelect.value = earliestTime;
                                }
                            }

                            function showModal() {
                                $('#nextDayModal').modal('show');
                            }

                            function setDefaultDate() {
                                const datepicker1 = document.getElementById('datepicker1');
                                const currentDate = getCurrentDate();
                                datepicker1.value = currentDate; // 오늘의 날짜를 기본값으로 설정

                            }

                            function getCurrentDate() {
                                const today = new Date();
                                const year = today.getFullYear();
                                let month = today.getMonth() + 1;
                                let day = today.getDate();
                                month = month < 10 ? '0' + month : month;
                                day = day < 10 ? '0' + day : day;
                                return year + '-' + month + '-' + day;
                            }
                            function setEndTime() {
                                var endTimeSelect = document.getElementById("end-time");
                                var startTimeIndex = document.getElementById("start-time").selectedIndex;

                                // 시작 시간 인덱스부터 end-time 옵션을 변경합니다.
                                for (var i = startTimeIndex; i < endTimeSelect.options.length; i++) {
                                    endTimeSelect.options[i].style.display = "block";
                                }

                                // 선택한 start-time 이후의 end-time 옵션을 선택합니다.
                                endTimeSelect.selectedIndex = startTimeIndex;

                                // 종료 시간을 hidden input에 설정
                                document.getElementById("end-time").value = endTime;
                            }

                            // 분을 더하는 함수
                            function addMinutes(time, minutes) {
                                var [hour, minute] = time.split(":").map(Number);
                                var date = new Date(0, 0, 0, hour, minute);
                                date.setMinutes(date.getMinutes() + minutes);
                                return (date.getHours().toString().padStart(2, "0") + ":" + date.getMinutes().toString().padStart(2, "0")).toString();
                            }
                        </script>


                    </div>

                </div>
            </form>
        </section>
    </div>
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- /.container-fluid -->
<!-- Main content -->

<section class="content">
    <!--여기 -->
    <div class="modal" id="nextDayModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- 모달 헤더 -->
                <div class="modal-header">
                    <h4 class="modal-title">알림</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- 모달 본문 -->
                <div class="modal-body">
                    현재 시간으로 예약할 수 없습니다. 다른 시간을 선택해 주세요.
                </div>

                <!-- 모달 푸터 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                </div>

            </div>
        </div>
    </div>
</section>
<!-- /.content -->
<!-- /.content-wrapper -->
<!--footer-->

<%@ include file="/include/bootCommonFoot.jsp"%>
<script>

    document.getElementById("typeSelect").addEventListener("change", function() {
        var type = this.value;
        if (type === "미용") {
            document.getElementById("additionalInfo1").style.display = "block";
            document.getElementById("additionalInfo2").style.display = "none";
        } else if (type === "진료") {
            document.getElementById("additionalInfo1").style.display = "none";
            document.getElementById("additionalInfo2").style.display = "block";
        } else {
            document.getElementById("additionalInfo1").style.display = "none";
            document.getElementById("additionalInfo2").style.display = "none";
        }
    });
    $(document).ready(function(){
        $("#datepicker1").datepicker(


            {   minDate: 0,
                dateFormat: 'yy-mm-dd',
                beforeShow: function(input, inst) {

                    // datepicker의 배경색을 설정합니다.
                    inst.dpDiv.css("background-color", "lightblue")

                }
            });

    });
    document.getElementById("agreeTerms").addEventListener("change", function() {
        var buttonWrapper = document.getElementById("submitButtonWrapper");
        if (this.checked) {
            buttonWrapper.style.display = "block";
        } else {
            buttonWrapper.style.display = "none";
        }
    });


</script>
</body>
<style>
    /* 예약신청 폼의 너비를 조정 */
    .content {
        max-width: 600px; /* 원하는 최대 너비로 조정 */
        margin: 0; /* 가운데 정렬을 위해 왼쪽과 오른쪽 마진을 자동으로 설정 */
        margin-left: 20px;
    }
</style>
</html>

