<%@ page import="java.util.List" %>
<%@ page import="com.example.vet.model.AnimalInsertMasterVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    List<AnimalInsertMasterVO> masterInfo = (List)request.getAttribute("masterInfo");
%>

<script>
    function insert(){
        if(!/\d/.test($("#animal_weight").val())){
            alert("숫자를 입력해주세요.");
            return;
        }
        // AJAX 요청 보내기
        $.ajax({
            url: "/CustomerDB/TotalDataInsert",
            type: "POST",
            data: JSON.stringify({
                animal_Nm: $("#animal_Nm").val(),
                animal_bdate: $("#animal_bdate").val(),
                animal_species: $("#animal_species").val(),
                animal_breed: $("#animal_breed").val(),
                animal_weight: $("#animal_weight").val(),
                animal_sex: $("#animal_sex").val(),
                animal_neut: $("#animal_neut").val(),
                masterPk: $("#masterPk").val()
            }),
            contentType: "application/json",
            success: function(){
            },
            error: function(xhr, status, error){
                alert("저장되었습니다.");
                window.history.back()
            }
        });
    }
</script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>동물 데이터 등록</title>
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
                        <h1>동물 데이터 등록</h1>
                    </div>

                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <!--여기 -->
            <table class="table table-borderless" id = "DataForm">
                <tr>
                    <th>고객명</th>
                    <th>
                        <select class="form-control select2" name="dropdown" id="masterPk">
                            <%
                                for (int i =0; i < masterInfo.size(); i++){
                                    AnimalInsertMasterVO animalInsertMasterVO = masterInfo.get(i);
                            %>
                            <option value="<%=animalInsertMasterVO.getMasterpk()%>"><%=animalInsertMasterVO.getMaster_nm()%></option>
                            <%
                                }
                            %>
                        </select>
                   </th>
                    <th>동물이름</th>
                    <th><input type="text" class="form-control" id="animal_Nm" placeholder=></th>
                </tr>
                <tr>
                    <th>축종</th>
                    <th><input type="text" class="form-control" id="animal_species" placeholder="개, 고양이, 토끼..."></th>
                    <th>품종</th>
                    <th><input type="text" class="form-control" id="animal_breed" placeholder=></th>
                </tr>
                <tr>
                    <th>성별</th>
                    <th><select id="animal_sex" class="form-control" aria-label="default select example">
                        <option selected>성별</option>
                        <option value="F">F</option>
                        <option value="M">M</option>
                    </select></th>
                    <th>생년월일</th>
                    <th><input type="date" class="form-control" id="animal_bdate" placeholder="8자리"></th>
                </tr>
                <tr>
                    <th>중성화</th>
                    <th>
                        <select class="form-control" id="animal_neut" aria-label="default select example">
                            <option selected>중성화 여부</option>
                            <option value="O">O</option>
                            <option value="X">X</option>
                        </select>
                    </th>
                    <th>몸무게</th>
                    <th><input type="text" class="form-control" id="animal_weight" placeholder="kg"></th>
                </tr>
            </table>
            <div class="text-center">
                <button type="button" class="btn btn-danger" style="margin-right: 10px;" onclick="window.history.back()">취소</button>
                <button type="button" class="btn btn-primary" onclick="insert()">등록</button>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
<%--<%@ include file="/include/bootCommonFoot1.jsp"%>--%>
</body>
</html>

<style typeof="text/css">
    .form-group.row .col {
        margin-right: -80px;
    }

    .form-control{
        width: 50%;
        text-align: center;
        line-height: 2.5;
    }

    #exampleFormControlTextarea1{
        width: 100%;
    }

    #contents_box > #img_area{
        width: 50%;
        height: 50%;
    }
    #contents_box > #table table-borderless{
        width: 50%;
        height: 50%;
    }
    #contents_box > #img_area > img{
        width: 95%;
        padding-top: 50%;
    }
</style>
<script>
    $(document).ready(function(){
        // 고객명이 변경될 때 이벤트 처리
        $('#masterPk').change(function(){
            var selectedMasterPk = $(this).val(); // 선택된 고객의 ID 가져오기

            // 선택된 고객의 정보 가져오기
            var selectedMasterInfo = masterInfo.find(function(master){
                return master.getMasterpk() === selectedMasterPk;
            });

            // 고객 정보를 해당 필드에 자동으로 채우기
            if(selectedMasterInfo){
                $('#master_pnumber').val(selectedMasterInfo.getMaster_address);
                $('#master_address').val(selectedMasterInfo.getMaster_address());
                $('#master_email').val(selectedMasterInfo.getMaster_email());
            }
        });
    });
</script>