<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    List<Map<String,Object>> diagList = (List)request.getAttribute("diagList");
%>

<script>
    function totalDataUpdate() {
        var modal = document.getElementById("totalDataUpdate");
        modal.style.display = "block";
    }
    // Modal 닫기
    function closeModal() {
        var modal = document.getElementById("totalDataUpdate");
        modal.style.display = "none";
        location.reload();
    }

    // Modal 닫기 버튼에 이벤트 리스너 추가
    var closeButton = document.getElementsByClassName("close")[0];
    closeButton.onclick = function() {
        closeModal();
    }

    function ModifyData() {
        $.ajax({
            url: "/CustomerDB/TotalDataUpdate",
            type: "POST",
            data: JSON.stringify({
                animalPk: $("#animalPk").val(),
                master_nm: $("#master_nm").val(),
                master_pnumber: $("#master_pnumber").val(),
                master_address: $("#master_address").val(),
                master_email: $("#master_email").val(),
                animal_nm: $("#animal_nm").val(),
                animal_species: $("#animal_species").val(),
                animal_breed: $("#animal_breed").val(),
                animal_sex: $("#animal_sex").val(),
                animal_bdate: $("#animal_bdate").val(),
                animal_neut: $("#animal_neut").val(),
                animal_weight: $("#animal_weight").val(),
                masterpk: $("#masterpk").val()
            }),
            contentType: "application/json",
            success: function(){
                alert("변경이 완료되었습니다.");
            },
            error: function(xhr, status, error){
                // 실패했을 때 실행할 코드
                alert("변경이 완료되었습니다.");
                closeModal();
            }
        });
    }
</script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>동물 데이터</title>
    <%@ include file="/include/bootCommon.jsp"%>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper" >
    <%@ include file="/include/sidebar.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" style="height: 800px;">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="noto-sans">동물 정보 상세</h1>
                    </div>
                    <div class="col-sm-6 text-right">
                        <div style="margin-left: auto;">
                            <button class="btn btn-warning" onclick="totalDataUpdate()" style="margin-right: 10px;">정보수정</button>
                        </div>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <div id="contents_box">
                <div id="table_area">
                    <table class="table table-borderless">
                        <tr>
                            <th>고객명</th>
                            <td><input class="form-control" type="text" value="${dList[0].master_nm}" aria-label="readonly input example" readonly></td>
                            <th>연락처</th>
                            <td><input class="form-control" type="tel" value="${dList[0].master_pnumber}" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>지역</th>
                            <td><input class="form-control" type="text" value="${dList[0].master_address}" aria-label="readonly input example" readonly></td>
                            <th>email</th>
                            <td><input class="form-control" type="email" value="${dList[0].master_email}" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>동물이름</th>
                            <td><input class="form-control" type="text" value="${dList[0].animal_nm}" aria-label="readonly input example" readonly></td>
                            <th>종류</th>
                            <td><input class="form-control" type="text" value="${dList[0].animal_species}" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>품종</th>
                            <td><input class="form-control" type="text" value="${dList[0].animal_breed}" aria-label="readonly input example" readonly></td>
                            <th>성별</th>
                            <td><input class="form-control" type="text" value="${dList[0].animal_sex}" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td><input class="form-control" type="date" value="${dList[0].animal_bdate}" aria-label="readonly input example" readonly></td>
                            <th>중성화</th>
                            <td><input class="form-control"  type="text" value="${dList[0].animal_neut}" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>진료구분</th>
                            <td><input class="form-control" type="text" value="진료" aria-label="readonly input example" readonly></td>
                            <th>몸무게</th>
                            <td><input class="form-control" type="text" value="${dList[0].animal_weight}kg" aria-label="readonly input example" readonly></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">최근 진료내역</label>
                <div id="diag_box">
                    <%
                        for (int i =0; i < diagList.size(); i++){
                            Map<String,Object> map = diagList.get(i);
                    %>
                    <div id="exampleFormControlTextarea1">
                        <div><%=map.get("BOOKING_DATE")%></div>
                        <div><%=map.get("BOOKING_START")%> ~</div>
                        <div><%=map.get("BOOKING_END")%></div>
                    </div>
                    <%
                        }
                    %>
                </div>
                <div class="text-center" style="margin-top:50px;margin-bottom: 200px">
                    <a href="http://localhost:8000/CustomerDB/TotalDataList" type="button" class="btn btn-primary" style="margin-right: 10px;">뒤로가기</a>
                    <a href="http://localhost:8000/booking/bookingRegister" type="button" class="btn btn-success">진료등록</a>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->

<%@ include file="/include/bootCommonFoot.jsp"%>
<%--<%@ include file="/include/bootCommonFoot1.jsp"%>--%>



<%-- 수정 모달 시작 --%>
<div class="modal" id="totalDataUpdate">
    <div class="modal-dialog modal-dialog-centered">
        <span class="close" onclick="closeModal()">&times;</span>
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">정보 수정</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                    <input type="hidden" id="animalPk" name="animalPk" value="${dList[0].animalPk}">
                    <div id="table_area_M">
                        <table class="table table-borderless">
                            <tr>
                                <th>고객명</th>
                                <td><input class="form-control" id= "master_nm" type="text" value="${dList[0].master_nm}" readonly></td>
                                <th>연락처</th>
                                <td><input class="form-control" id="master_pnumber" type="tel" value="${dList[0].master_pnumber}" readonly></td>
                            </tr>
                            <tr>
                                <th>지역</th>
                                <td><input class="form-control" id="master_address" type="text" value="${dList[0].master_address}" readonly></td>
                                <th>email</th>
                                <td><input class="form-control" id="master_email" type="email" value="${dList[0].master_email}" readonly></td>
                            </tr>
                            <tr>
                                <th>동물이름</th>
                                <td><input class="form-control" id="animal_nm" type="text" value="${dList[0].animal_nm}" ></td>
                                <th>종류</th>
                                <td><input class="form-control" id="animal_species" type="text" value="${dList[0].animal_species}"></td>
                            </tr>
                            <tr>
                                <th>품종</th>
                                <td><input class="form-control" id="animal_breed" type="text" value="${dList[0].animal_breed}"></td>
                                <th>성별</th>
                                <td><select class="form-control" id="animal_sex" type="text" >
                                    <option selected>${dList[0].animal_sex}</option>
                                    <option value="F">F</option>
                                    <option value="M">M</option>
                                </select></td>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <td><input class="form-control" id="animal_bdate" type="date" value="${dList[0].animal_bdate}"></td>
                                <th>중성화</th>
                                <td><select class="form-control" id="animal_neut" type="text">
                                <option selected>${dList[0].animal_neut}</option>
                                <option value="O">O</option>
                                <option value="X">X</option></select>
                                </td>
                            </tr>
                            <tr>
                                <th>진료구분</th>
                                <td><input class="form-control"  type="text" value="진료"></td>
                                <th>몸무게</th>
                                <td><input class="form-control" id="animal_weight" type="text" value="${dList[0].animal_weight}"></td>
                            </tr>
                        </table>
                    </div>
                </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="ModifyData()">저장</button>
                <input type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="closeModal()" value="닫기">
            </div>
        </div>
    </div>
</div>
<%-- 수정 모달 끝 --%>

</body>
</html>

<style typeof="text/css">
    #diag_box{
        border: 1px solid #efefef;
        border-radius: 5px;
        background-color: #efefef;
        height: 300px;
    }
    #exampleFormControlTextarea1{
        display: flex;
        gap: 5px;
        margin: 0 20px;
    }

    /* 수정된 CSS 코드 */
    .modal-dialog {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 100vw; /* 모달 창의 너비를 뷰포트의 너비로 설정합니다. */
        height: 100vh; /* 모달 창의 높이를 뷰포트의 높이로 설정합니다. */
        margin: 0;
        padding: 0;
        max-width: none;
    }
    .modal-content {
        height: 100%; /* 모달 내용의 높이를 100%로 설정합니다. */
        border: none; /* 테두리 없이 스타일링합니다. */
    }
    .modal-body {
        overflow-y: auto; /* 세로 스크롤이 필요한 경우 자동으로 스크롤이 생성됩니다. */
        max-height: calc(100vh - 120px); /* 모달 창의 높이에서 헤더와 푸터의 높이를 뺀 나머지 공간을 설정합니다. */
    }
    .modal-footer {
        display: flex;
        justify-content: center;
        padding: 15px;
    }

    .form-control{
        width: 50%;
        text-align: center;
        line-height: 2.5;
    }

    #padding-right50{
        padding-right: 50px;
    }
    #margin-right20{
        margin-right: 20px;
    }

    #hr_style{
        width:100%;height:1px;
        border:none;
        background-color:dimgrey;
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
    #contents_box > #img_area > .img-fluid img-thumbnail{
        width: 95%;
        padding-top: 50%;
    }

    .form-control {
        width: 98%; /* 입력 필드의 너비를 98%로 설정합니다. */
        text-align: center;
        line-height: 2.5;
    }

    input[name="master_pnumber"],
    input[name="master_email"],
    input[name="animal_species"],
    select[name="animal_sex"],
    select[name="animal_neut"],
    input[name="animal_weight"] {
        width: 100%; /* 각 필드의 너비를 100%로 설정합니다. */
    }

    /* 진료 내역 칸의 CSS */
    #diag_box {
        border: 1px solid #efefef;
        border-radius: 5px;
        background-color: #efefef;
        max-height: 200px; /* 원하는 높이로 설정하세요 */
        overflow-y: auto; /* 내용이 넘칠 경우 스크롤이 생성되도록 설정합니다. */
    }

    #exampleFormControlTextarea1 {
        display: flex;
        gap: 5px;
        margin: 0 20px;
    }


</style>
