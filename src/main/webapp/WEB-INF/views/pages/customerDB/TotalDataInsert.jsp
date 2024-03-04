<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script>
    function insert(){
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
            success: function(response){
                // 성공했을 때 실행할 코드
                console.log("요청이 성공했습니다.");
                console.log("서버에서 받은 응답: ", response);
            },
            error: function(xhr, status, error){
                // 실패했을 때 실행할 코드
                console.error("요청이 실패했습니다.");
                console.error("에러: ", error);
            }
        });

    //모달
    // function searchEnter() {
    //     $("#customerSearchForm .modal-content").load("CustomerDB/Popup");
    //     $("#customerSearchForm ").modal();
    }


    // var modal = document.getElementById("customerSearchForm");
    // var master_btn_search = document.getElementById("master_btn_search");
    // var SearchMaster_nm = document.getElementById("SearchMaster_nm");
    // // 검색 버튼 클릭 시
    // master_btn_search.onclick = function() {
    //     // 사용자가 입력한 검색어 가져오기
    //     var searchTerm = SearchMaster_nm.value;
    //
    //     // 결과 출력 등 추가 처리 가능
    //     console.log("검색 결과:", resultList);
    //
    // }

    // function CustomerList() {
    //     $.ajax({
    //         url: "/CustomerDB/Popup",
    //         type: "POST",
    //         data: JSON.stringify({
    //             master_nm: $("#master_nm").val(),
    //         }),
    //         contentType: "application/json",
    //         success: function(response){
    //             // 성공했을 때 실행할 코드
    //             console.log("요청이 성공했습니다.");
    //             searchEnter();
    //         },
    //         error: function(xhr, status, error){
    //             // 실패했을 때 실행할 코드
    //             console.error("요청이 실패했습니다.");
    //             console.error("에러: ", error);
    //         }
    //     });
    // }

</script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>통합데이터 등록</title>
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
            <table class="table table-borderless" id = "DataForm">
                <tr>
                    <th>고객명</th>
                    <th>
                        <input type="text" class="form-control" id="master_nm" placeholder="">
<%--                        <div class="col-6">--%>
<%--                            <button id="btn_search" class="btn btn-dark" onClick="CustomerList()" data-toggle="modal" data-target="#customerSearchForm">검색</button>--%>
<%--                        </div>--%>
                   </th>
                    <th>연락처</th>
                    <th><input type="tel" class="form-control" id="master_pnumber" placeholder="- 포함"></th>
                </tr>
                <tr>
                    <th>주소</th>
                    <th><input type="text" class="form-control" id="master_address" placeholder=></th>
                    <th>email</th>
                    <th><input type="email" class="form-control" id="master_email" placeholder=></th>
                </tr>
                <tr>
                    <th>동물이름</th>
                    <th><input type="text" class="form-control" id="animal_nm" placeholder=></th>
                    <th>축종</th>
                    <th><input type="text" class="form-control" id="animal_species" placeholder="개, 고양이, 토끼..."></th>
                </tr>
                <tr>
                    <th>품종</th>
                    <th><input type="text" class="form-control" id="animal_breed" placeholder=></th>
                    <th>성별</th>
                    <th><select id="animal_sex" class="form-select" aria-label="default select example">
                        <option selected>성별</option>
                        <option value=1>F</option>
                        <option value=2>M</option>
                    </select></th>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <th><input type="date" class="form-control" id="animal_bdate" placeholder="8자리"></th>
                    <th>중성화</th>
                    <th><select class="form-select" id="animal_neut" aria-label="default select example">
                        <option selected>중성화 여부</option>
                        <option value=1>O</option>
                        <option value=2>X</option>
                    </select></th>
                </tr>
                <tr>
                    <th>몸무게</th>
                    <th><input type="text" class="form-control" id="animal_weight" placeholder="kg"></th>
                </tr>
            </table>
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">최근 진료내역</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
            <div class="text-center">
                <button type="button" class="btn btn-danger" style="margin-right: 10px;">취소</button>
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