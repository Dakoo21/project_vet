<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    List<Map<String, Object>> bList = (List)request.getAttribute("nList");
    Map<String,Object> rmap = bList.get(0);
    if(bList.size()==1){
        rmap = bList.get(0);
    }
    else{
        rmap = null;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <script>
        // Modal 열기
        function openModal() {
            var modal = document.getElementById("reservationModal");
            modal.style.display = "block";

            // 예약 디테일 모달이 열릴 때 이벤트를 감지하여 Ajax 요청을 보내고 데이터를 input 요소에 설정
                console.log("예약등록 수정모달 활성화.");



        // Modal 닫기
        function closeModal() {
            var modal = document.getElementById("reservationModal");
            modal.style.display = "none";
        }

        // Modal 닫기 버튼에 이벤트 리스너 추가
        var closeButton = document.getElementsByClassName("close")[0];
        closeButton.onclick = function() {
            closeModal();
        }

        // 모달 외부를 클릭하여도 모달이 닫히도록 설정
        window.onclick = function(event) {
            var modal = document.getElementById("reservationModal");
            if (event.target == modal) {
                closeModal();
            }
        }
}
    </script>
</head>
<body class="hold-transition sidebar-mini">
<section class="wrapper">
    <%@ include file="/include/sidebar.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <section class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="noto-sans">진료예약 상세페이지</h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <!--여기 -->
            <div id="contents_box">
                <div id="img_area">
                    <img alt="Avatar" class="table-avatar" src="/img/logo/logo_4.png" style="height:40%;width:40%;margin-left:200px">
                </div>
                <div id="table_area">
                    <table class="table table-borderless">
                        <tr>
                            <th>고객명</th>
                            <td><input class="form-control" type="text" value="<%= rmap != null ? rmap.get("masterNm") : "" %>" aria-label="readonly input example" readonly></td>

                            <th>연락처</th>
                            <td><input class="form-control" type="text" value="<%= rmap != null ? rmap.get("masterPnumber") : "" %>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("masterAddress")%>" aria-label="readonly input example" readonly></td>
                            <th>email</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("masterEmail")%>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>동물이름</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("animalName")%>" aria-label="readonly input example" readonly></td>
                            <th>종류</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("animalSpecies")%>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>품종</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("animalBreed")%>" aria-label="readonly input example" readonly></td>
                            <th>성별</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("animalSex")%>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("animalBirthDate")%>" aria-label="readonly input example" readonly></td>
                            <th>중성화</th>
                            <td><input class="form-control"  type="text" value="<%=rmap.get("animalNeut")%>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>진료예약</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("bookingDate")%> <%=rmap.get("bookingStart")%>" aria-label="bookingStart input example" readonly></td>
                            <th>몸무게</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("animalWeight")%>" aria-label="readonly input example" readonly></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div style="text-align: center;">
                <a id="deleteButton" onclick="deleteBooking(<%=rmap.get("bookingPk")%>)"><button>예약삭제</button></a>
                <script>
                    function animalSearch() {
                        const searchAnimalNm = document.getElementById("searchAnimalNm").value;
                        console.log(searchAnimalNm);
                        if (searchAnimalNm === "") {
                            // 클릭 이벤트의 기본 동작 방지
                            event.preventDefault();
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
                        // 클릭 이벤트의 기본 동작 방지
                        event.preventDefault();
                    }

                    // 선택바 검색 결과 표시 함수
                    function displaySearchResults(results) {
                        var select = document.getElementById('searchResult'); // 선택 바 엘리먼트를 가져옵니다.

                        // 기존 옵션을 모두 제거합니다.
                        select.innerHTML = '';

                        // JSON 데이터를 반복하여 옵션을 추가합니다.
                        results.forEach(results => {
                            var option = document.createElement('option');
                            option.value = results.ANIMALID; // 옵션의 값 설정
                            option.text = "(" + results.ANIMALBDATE + ")" + ": " + results.MASTER_NM; // 옵션의 텍스트 설정
                            select.appendChild(option); // 선택 바에 옵션을 추가합니다.
                        })
                    }
                    function deleteBooking(bookingPk) {

                            var form = document.createElement("form");
                            form.setAttribute("method", "POST");
                            form.setAttribute("action", "http://localhost:8000/booking/bookingDelete?bookingPK=<%=rmap.get("bookingPk")%>");

                            var hiddenField = document.createElement("input");
                            hiddenField.setAttribute("type", "hidden");
                            hiddenField.setAttribute("name", "bookingPk");
                            hiddenField.setAttribute("value", bookingPk);

                            form.appendChild(hiddenField);

                            document.body.appendChild(form);
                            form.submit();

                    }
                    function startDiag(bookingPk){

                            var form2 = document.createElement("form");
                            form2.setAttribute("method", "POST");
                            form2.setAttribute("action", "http://localhost:8000/diag/diagInsert");

                            var hiddenField = document.createElement("input");
                            hiddenField.setAttribute("type", "hidden");
                            hiddenField.setAttribute("name", "bookingPk");
                            hiddenField.setAttribute("value", bookingPk);

                            form2.appendChild(hiddenField);

                            document.body.appendChild(form2);
                            form2.submit();

                    }
                </script>

                <a id="updateButton" onclick="openModal()"><button>수정</button></a>
                <a id="diagStartButton" onclick="startDiag(<%=rmap.get("bookingPk")%>)"><button>진료 시작</button></a>

            </div>
        </section>
    </section>
<!-- /.content-wrapper -->
        <%@ include file="/include/footer.jsp" %>
        <div id="reservationModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <!-- 예약 양식 -->
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">고객진료예약</h3>
                    </div>
                    <div class="card-body">
                        <form id="reservationForm" action="bookingUpdate" method="POST">
                            <input type="hidden" name="bookingPk" value="<%=rmap.get("bookingPk")%>">
                            <input type="hidden" name="animalPk" value="<%=rmap.get("animalPk")%>">
                        <!-- 보호자명 -->

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                        <span class="input-group-text" id="searchIcon">
                                  <input type="text" class="form-control" id="searchAnimalNm" placeholder="동물명을 입력후 검색" aria-label="Search" aria-describedby="searchIcon" onkeyup="if (event.keyCode === 13) animalSearch()">
                            <button id="animalSearchButton" onclick="animalSearch()">검색</button>
                        </span>
                                </div>
                            </div>
                        <!-- 동물선택 -->
                        <div class="form-group" style="display: inline-block; width: 240px;">

                            <label style="display: inline-block; width: 70px;">환축명</label>
                            <select  class="form-control select2" id = "searchResult" style="display: inline-block; width: 150px;"  >
                                <option value="<%=rmap.get("animalName")%>" selected="selected"  ><%=rmap.get("animalName")%></option>
                            </select>
                        </div>
                        <!-- 예약일 -->
                            <script>
                                window.onload = function() {
                                    // 현재 날짜를 가져오는 함수
                                    function getCurrentDate() {
                                        const today = new Date();
                                        const year = today.getFullYear();
                                        let month = today.getMonth() + 1;
                                        let day = today.getDate();

                                        // 월과 일이 한 자리 숫자인 경우 앞에 0을 붙여 두 자리로 만듦
                                        month = month < 10 ? '0' + month : month;
                                        day = day < 10 ? '0' + day : day;

                                        return year + '-' + month + '-' + day;
                                    }

                                    // 3일 후의 날짜를 가져오는 함수
                                    function getThreeDaysLater() {
                                        const today = new Date();
                                        today.setDate(today.getDate() + 3); // 현재 날짜에서 3일을 더함

                                        const year = today.getFullYear();
                                        let month = today.getMonth() + 1;
                                        let day = today.getDate();

                                        // 월과 일이 한 자리 숫자인 경우 앞에 0을 붙여 두 자리로 만듦
                                        month = month < 10 ? '0' + month : month;
                                        day = day < 10 ? '0' + day : day;

                                        return year + '-' + month + '-' + day;
                                    }

                                    // 예약일 input 요소
                                    const reservationDateInput = document.getElementById('reservationdate');


                                    // 최소 날짜를 오늘로 설정
                                    const currentDate = getCurrentDate();
                                    reservationDateInput.min = currentDate;
                                };
                            </script>
                        <div class="form-group" style="display: inline-block; width: 240px;">
                            <label for="reservationdate" style="display: inline-block; width: 70px;" >예약일</label>
                            <input type="date" id="reservationdate" value="<%=rmap.get("bookingDate")%>" class="form-control" style="display: inline-block; width: 150px;" name="bookingDate">
                        </div>
                        <!-- 예약시간 -->
                        <div class="form-group" style="display: inline-block; width: 240px;">
                            <label style="display: inline-block; width: 70px;">예약시간</label>
                            <select class="form-control select2" style="display: inline-block; width: 150px;" name="bookingStart" id="start-time" onchange="setEndTime()">
                                <option value="<%=rmap.get("bookingStart")%>" selected="selected"  ><%=rmap.get("bookingStart")%></option>
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
                        </div>
                            <div class="input-group-prepend" style="display: none">
                                <select id="end-time" name="bookingEnd">
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

                            <script>
                                function setEndTime() {
                                    var endTimeIndex = document.getElementById("end-time");
                                    var startTimeIndex = document.getElementById("start-time").selectedIndex;


                                    // 선택한 start-time 이후의 end-time 옵션을 선택합니다.
                                    endTimeIndex.selectedIndex = startTimeIndex;
                                }
                            </script>
                        <!-- 예약구분 -->
                            <div class="form-group" style="display: inline-block; width: 240px;">
                                <label style="display: inline-block; width: 70px;">진료유형</label>
                                <select id="bookingTypeSelect" class="form-control select2" style="display: inline-block; width: 150px;" name="bookingType" >

                                    <option value="<%=rmap.get("bookingType")%>" selected="selected"  ><%=rmap.get("bookingType")%></option>
                                    <option value="진료">진료</option>
                                    <option value="검사">검사</option>
                                </select>
                            </div>

                            <div class="form-group" style="display: inline-block; width: 240px;">
                                <label style="display: inline-block; width: 70px;">담당자</label>
                                <select id="userPkSelect" class="form-control select2" style="display: inline-block; width: 150px;" name="userPk">

                                    <option value="<%=rmap.get("userPK")%>" selected="selected"  ><%=rmap.get("userNm")%></option>
                                    <option value="9999999">원장</option>
                                    <option value="9999998">부원장</option>
                                </select>
                            </div>

                            <button id="reservationSaveButton" onclick="submitForm()" >저장</button>

                            <script>
                                // 각 셀렉트 요소 가져오기
                                var bookingTypeSelect = document.getElementById("bookingTypeSelect");
                                var userPkSelect = document.getElementById("userPkSelect");
                                var reservationSaveButton = document.getElementById("reservationSaveButton");
                                var reservationdate =document.getElementById("reservationdate");


                                // 셀렉트 요소 변경 이벤트 리스너 추가
                                bookingTypeSelect.addEventListener("change", toggleSaveButton);
                                userPkSelect.addEventListener("change", toggleSaveButton);

                                // 저장 버튼 활성화/비활성화 함수
                                function toggleSaveButton() {
                                    if (bookingTypeSelect.value !== "" && userPkSelect.value !== "" && reservationdate.value !== "") {
                                        reservationSaveButton.disabled = false; // 선택된 경우 버튼 활성화

                                    } else {
                                        reservationSaveButton.disabled = true; // 선택되지 않은 경우 버튼 비활성화

                                    }
                                }

                                // Form submit 함수
                                function submitForm() {
                                    var form = document.getElementById("reservationForm");
                                    form.submit();
                                }
                            </script>


                        </form>
                    </div>
                </div>
                <!-- /.card -->
            </div>
            <!-- /.modal-content -->
        </div>


<!-- ./wrapper -->

<!--footer-->

<script>
    $.widget.bridge('uibutton', $.ui.button)

    // 페이지 로드 시 setMinDate 함수 호출하여 설정
    window.onload = function () {
        console.log("오늘날 최소값 설정");
        setMinDate();
        const facilityReserveDt = document.getElementById('facilityReserveDt');
        facilityReserveDt.value = getCurrentDate();
        dailyDate.value = getCurrentDate();
    };
    // 현재 날짜를 가져오는 함수
    function getCurrentDate() {
        const today = new Date();
        const year = today.getFullYear();
        let month = today.getMonth() + 1;
        let day = today.getDate();

        // 월과 일이 한 자리 숫자인 경우 앞에 0을 붙여 두 자리로 만듦
        month = month < 10 ? '0' + month : month;
        day = day < 10 ? '0' + day : day;
        console.log("day:",day);
        return year + '-' + month + '-' + day;
        console.log("year"-"month"-"day");
    }

    // 오늘 이후의e 날짜만 선택할 수 있도록 설정하는 함수
    function setMinDate() {
        const facilityReserveDt = document.getElementById('facilityReserveDt');
        const currentDate = getCurrentDate();
        facilityReserveDt.min = currentDate;
    }



</script>
</body>

<%@ include file="/include/bootCommonFoot.jsp" %>
<%--<%@ include file="/include/bootCommonFoot1.jsp"%>--%>
</html>
<style typeof="text/css">
    .form-control {
        width: 90%;
        text-align: center;
        line-height: 2.5;
    }

    #contents_box {
        display: flex;
        width: 100%;
        justify-content: space-evenly;
        align-items: center;
    }
    #contents_box > #img_area{
        width: 50%;
        height: 50%;
    }
    #contents_box > #table_area{
        width: 50%;
        height: 50%;
    }
    #contents_box > #img_area > img{
        width: 400px;
    }

    .btn btn-primary{
        display: inline-block;
        margin-top: 30px;
    }
    /* 모달 스타일 */
    .modal {
        display: none; /* 모달을 기본적으로 숨김 */
        position: fixed; /* 모달이 화면에 고정되도록 설정 */
        z-index: 1; /* 모달을 다른 요소들보다 위에 표시하기 위한 인덱스 설정 */
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto; /* 모달이 화면 크기를 벗어날 경우 스크롤 가능하도록 설정 */
        background-color: rgba(0, 0, 0, 0.4); /* 배경에 투명한 검은색을 입힘 */
    }

    /* 모달 콘텐츠 스타일 */
    .modal-content {
        margin: 15% auto; /* 콘텐츠를 화면의 중앙에 배치 */
        padding: 20px;
        border: 1px solid #888;
        width: 40%; /* 콘텐츠의 너비 설정 */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); /* 그림자 효과 추가 */
    }

    /* 모달 닫기 버튼 스타일 */
    .close {
        color: #aaaaaa; /* 닫기 버튼 색상 설정 */
        float: right; /* 우측에 배치 */
        font-size: 28px;
        font-weight: bold;
    }

    /* 닫기 버튼에 호버 효과 추가 */
    .close:hover,
    .close:focus {
        color: #000; /* 호버 시 색상 변경 */
        text-decoration: none; /* 밑줄 제거 */
        cursor: pointer; /* 커서를 포인터로 변경 */
    }
</style>
