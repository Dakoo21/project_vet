<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    List<Map<String, Object>> bList = (List)request.getAttribute("nList");
    Map<String,Object> rmap;
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
        }

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
                        <h1>진료예약 상세페이지</h1>
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
            <div id="contents_box">
                <div id="img_area">
                    <img alt="Avatar" class="table-avatar" src="../../img/dog1.jpeg">
                </div>
                <div id="table_area">
                    <table class="table table-borderless">
                        <tr>
                            <th>고객명</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("masterNm")%>" aria-label="readonly input example" readonly></td>
                            <th>연락처</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("masterPnumber")%>" aria-label="readonly input example" readonly></td>
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
                <a id="deleteButton" href="#" onclick="deleteBooking(<%=rmap.get("bookingPk")%>)"><button>예약삭제</button></a>
                <script>
                    function deleteBooking(bookingPk) {
                        if (confirm("예약을 삭제하시겠습니까?")) {
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
                    }
                </script>

                <a id="updateButton" onclick="openModal()"><button>수정</button></a>
            </div>
        </section>
    </section>
<!-- /.content-wrapper -->

        <div id="reservationModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <!-- 예약 양식 -->
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">고객진료예약등록</h3>
                    </div>
                    <div class="card-body">
                        <form id="reservationForm" action="http://localhost:8000/booking/bookingUpdate" method="POST">
                            <input type="hidden" name="bookingPk" value="<%=rmap.get("bookingPk")%>">
                        <!-- 보호자명 -->
                        <div class="form-group" style="display: inline-block; width: 240px;">
                            <label for="guardianName" style="display: inline-block; width: 70px;">보호자명</label>
                            <input type="text" id="guardianName" class="form-control" placeholder="김주인" style="display: inline-block; width: 150px;">
                        </div>
                        <!-- 동물선택 -->
                        <div class="form-group" style="display: inline-block; width: 240px;">

                            <label style="display: inline-block; width: 70px;">환축명</label>
                            <select class="form-control select2" style="display: inline-block; width: 150px;" name="animalPk">
                                <option selected="selected">선택</option>
                                <option value = "1">동물1</option>
                                <option value = "2">동물2</option>
                                <option value = "3">동물3</option>
                            </select>
                        </div>
                        <!-- 예약일 -->
                        <div class="form-group" style="display: inline-block; width: 240px;">
                            <label for="reservationdate" style="display: inline-block; width: 70px;">예약일</label>
                            <input type="date" id="reservationdate" class="form-control" style="display: inline-block; width: 150px;" name="bookingDate">
                        </div>
                        <!-- 예약시간 -->
                        <div class="form-group" style="display: inline-block; width: 240px;">
                            <label style="display: inline-block; width: 70px;">예약시간</label>
                            <select class="form-control select2" style="display: inline-block; width: 150px;" name="bookingStart" onchange="setEndTime(this.value)">
                                <option selected="selected">선택</option>
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
                                <option value="19:30">19:30</option>
                            </select>
                        </div>
                        <div class="input-group-prepend" style="display: none">
                            <label class="input-group-text" for="end-time">종료시간</label>
                            <select id="end-time" name="bookingEnd">
                            </select>
                        </div>

                        <script>
                            function setEndTime(startTime) {
                                var endTimeSelect = document.getElementById("end-time");
                                endTimeSelect.innerHTML = ""; // 이전에 추가된 옵션 제거

                                // 종료 시간을 설정합니다. 예를 들어, 시작 시간 + 30분
                                var endTime = addMinutes(startTime, 30);

                                // 옵션을 추가합니다.
                                var option = document.createElement("option");
                                option.value = endTime;
                                option.text = endTime;
                                endTimeSelect.add(option);
                            }

                            // 분을 더하는 함수
                            function addMinutes(time, minutes) {
                                var [hour, minute] = time.split(":").map(Number);
                                var date = new Date(0, 0, 0, hour, minute);
                                date.setMinutes(date.getMinutes() + minutes);
                                return (date.getHours().toString().padStart(2, "0") + ":" + date.getMinutes().toString().padStart(2, "0")).toString();
                            }
                        </script>
                        <!-- 예약구분 -->
                            <div class="form-group" style="display: inline-block; width: 240px;">
                                <label style="display: inline-block; width: 70px;">진료유형</label>
                                <select id="bookingTypeSelect" class="form-control select2" style="display: inline-block; width: 150px;" name="bookingType">
                                    <option value="">선택</option>
                                    <option value="진료">진료</option>
                                    <option value="검사">검사</option>
                                </select>
                            </div>

                            <div class="form-group" style="display: inline-block; width: 240px;">
                                <label style="display: inline-block; width: 70px;">담당의</label>
                                <select id="userPkSelect" class="form-control select2" style="display: inline-block; width: 150px;" name="userPk">
                                    <option value="">선택</option>
                                    <option value="9999999">원장</option>
                                    <option value="9999998">부원장</option>
                                </select>
                            </div>

                            <button id="reservationSaveButton" onclick="submitForm()" disabled>저장</button>

                            <script>
                                // 각 셀렉트 요소 가져오기
                                var bookingTypeSelect = document.getElementById("bookingTypeSelect");
                                var userPkSelect = document.getElementById("userPkSelect");
                                var reservationSaveButton = document.getElementById("reservationSaveButton");

                                // 셀렉트 요소 변경 이벤트 리스너 추가
                                bookingTypeSelect.addEventListener("change", toggleSaveButton);
                                userPkSelect.addEventListener("change", toggleSaveButton);

                                // 저장 버튼 활성화/비활성화 함수
                                function toggleSaveButton() {
                                    if (bookingTypeSelect.value !== "" && userPkSelect.value !== "") {
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
        <script>
            // Form submit 함수
            function submitForm() {
                var form = document.getElementById("reservationForm");
                form.submit();
            }
        </script>

<!-- ./wrapper -->

<!--footer-->

<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
</body>
<%@ include file="/include/footer.jsp"%>
<%@ include file="/include/bootCommonFoot.jsp"%>
<%--<%@ include file="/include/bootCommonFoot1.jsp"%>--%>
</html>
<style typeof="text/css">
    .form-control{
        width: 90%;
        text-align: center;
        line-height: 2.5;
    }

    #contents_box{
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

    .medical-checkbox-area{
        display: flex;
        gap: 20px;
    }

    .btn btn-primary{
        display: inline-block;
        margin-top: 30px;
    }
</style>
