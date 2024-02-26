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
            <div class="separator"></div>

            <form action="bookingInsert" method="post">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="animalSelect">동물명</label>
                    </div>
                    <select class="custom-select" id="animalSelect" name="animalPk">
                        <option selected>동물을 선택하세요...</option>
                        <%
                            for(int i = 0 ; i<aList.size();i++){
                                Map<String,Object> rmap = aList.get(i);
                        %>
                        <option value="<%=rmap.get("animalPk")%>"><%=rmap.get("animalNm")%>(<%=rmap.get("masterNm")%>)</option>
                        <%
                            }
                        %>
                    </select>
                    <div class="input-group-append">

                        <div class="input-group-text">

                                    <span class="fas fa-user">

                                    </span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text" for="animalSelect"><%= "서비스 이름" %></label>
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
                    <input type="text" class="form-control" id="datepicker1" name="bookingDate" style="opacity: 1;">

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
                            <option value="19:30">19:30</option>
                        </select>

                        <div class="input-group-prepend">
                            <label class="input-group-text" for="end-time">종료시간</label>
                        </div>
                        <select id="end-time" name="bookingEnd">
                        </select>
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


                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="icheck-primary">
                                <input type="checkbox" id="agreeTerms" name="terms" value="agree">
                                <label for="agreeTerms">
                                    <a href="#">이용약관</a>에 동의합니다.
                                </label>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-4" id="submitButtonWrapper" style="display: none;">
                            <button type="submit" class="btn btn-primary btn-block">예약</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </div>
            </form>
        </section>
    </div>
</div><!-- /.container-fluid -->
<!-- Main content -->
<section class="content">
    <!--여기 -->

</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<!--footer-->
<%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->
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
</html>

