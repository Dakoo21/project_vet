<%@ page import="com.example.vet.model.adopt.MissedAnimal" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    List<MissedAnimal> animalList = null;
    animalList = (List<MissedAnimal>)request.getAttribute("mAnimalList");
%>
<head>
    <%@include file="/include/common/bootstrap_common.jsp"%>
    <style>
        table {
            margin: 0 auto; /* 가운데 정렬을 위해 왼쪽과 오른쪽 마진을 자동으로 설정합니다. */
            width: 80%; /* 표의 너비를 조절할 수 있습니다. */
            border-collapse: collapse; /* 셀의 테두리를 합쳐서 보이도록 설정합니다. */
        }
        th, td {
            border: 1px solid black; /* 각 셀의 테두리를 설정합니다. */
            padding: 8px; /* 셀의 안쪽 여백을 설정합니다. */
            text-align: center; /* 셀 내의 텍스트를 가운데 정렬합니다. */
        }
        input {
            width: 96%;
        }
        .modal {

        }
    </style>
</head>
<body>
<div id="contentwrite">
    <div id="modal">

    </div>
    <div>
        <form>
            <p>선택된 유기번호: <span id="selectedAnimalIdDisplay"></span></p>
            <table style="border-collapse: collapse; width: 50%;">
                <tr>
                    <th>유기동물</th>
                    <td><input type="button" id="modalBtn1" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#selectForm1"></td>
                </tr>
                <tr>
                    <th>신청자</th>
                    <td><input type="button" id="modalBtn2" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#selectForm2">검색</td>
                </tr>
            </table>
        </form>
    </div>
</div>
<!--modal start-->
<div class="modal" id="selectForm1">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">유기동물 조회</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <!-- <form id="f_board" method="get" action="./boardInsert"> -->
                <form id="f_board1" method="post" enctype="multipart/form-data" action="./boardInsert">
                    <div class="col-6">
                        <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                               aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>
                    </div>
                    <div class="col-3">
                        <button id="btn_search" class="btn btn-danger">검색</button>
                    </div>
                </form>
                <div class="stockList">
                    <table class="table table-striped table-valign-middle" id="animalTable">
                        <thead>
                        <tr>
                            <td>유기번호</td>
                            <td>품종명</td>
                            <td>색</td>
                            <td>나이(출생연도)</td>
                            <td>몸무게</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>

                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <input type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="boardInsert()"  value="선택">
            <input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="닫기">
        </div>
    </div>
</div>
<!--modal start-->
<div class="modal" id="selectForm2">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">입양자 조회</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <!-- <form id="f_board" method="get" action="./boardInsert"> -->
                <form id="f_board" method="post" enctype="multipart/form-data" action="./boardInsert">
                    <div class="col-6">
                        <input type="text" id="keyword1" class="form-control" placeholder="검색어를 입력하세요"
                               aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>
                    </div>
                    <div class="col-3">
                        <button id="btn_search1" class="btn btn-danger">검색</button>
                    </div>
                </form>
                <div class="stockList">
                    <table class="table table-striped table-valign-middle" id="adopterTable">
                        <thead>
                        <tr>
                            <td>이름</td>
                            <td>전화번호</td>
                            <td>이메일</td>
                            <td>주소</td>
                            <td>생일</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>

                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <input type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="boardInsert()"  value="선택">
            <input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="닫기">
        </div>
    </div>
    <%--</div>--%>
</body>
<script>
    // 유기동물 조회 모달
    // 검색 버튼 클릭 시 모달창 열고 데이터 조회
    $(document).ready(function() {
        $("#modalBtn1").click(function() {
            // Ajax를 사용하여 서버에 데이터 조회 요청
            $.ajax({
                type: "GET",
                url: "/eSignDraft/abandonList",
                data: { searchParam: "yourSearchParameter" },  // 필요한 검색 파라미터 전달
                success: function(abandonList) {
                    // 모달창에 받아온 데이터를 표시하는 코드
                    displayAnimalList(abandonList)
                    console.log("성공");
                },
                error: function() {
                    // 오류 처리
                    console.log("오류");
                }
            });
        });
        $("#animalTable tbody").on("click", "tr", function(){
            var rowData = $(this).find("td").map(function(){
                return $(this).text();
            }).get();
            var selectedRowData = {
                유기번호 : 1313131,
                품종명 : rowData[0],
                색 : rowData[1],
                나이_출생연도 : rowData[2],
                몸무게 : rowData[3]
            };
            const modalbtn11 = document.getElementById('modalBtn1');
            var selectedAnimalId = $(this).data("animal-id");
            // $("#modalBtn1").text(selectedRowData.row[0]);
            // $("#selectedAnimalIdDisplay").text(selectedRowData);
            $("#selectedAnimalIdDisplay").text(selectedRowData.색);

            console.log("Selected Animal ID:" + selectedAnimalId);
            // $("#modal").hide();
            // $('#modalBtn1').text('abandonList[i].kindcd');
            modalbtn11.type = 'text';
            modalbtn11.value = 'zzz';


        });
        // 모달창 닫기 버튼 클릭 이벤트
        $(".close").click(function(){
            // 모달창을 닫으면서 선택한 값을 전달하는 로직을 추가
            $("#modal").hide();
        })
        function displayAnimalList(abandonList){
            var tableBody = $("#animalTable tbody")
            tableBody.empty();
            for (var i=0; i<abandonList.length; i++) {
                console.log(abandonList[i]);
                console.log(abandonList[i].kindcd);
                // String kindCd = mList.getKindcd();
                // String colorCd = mList.getColorcd();
                // String age = mList.getAge();
                // String weight = mList.getWeight();
                var row = "<tr data-animal-id='" + abandonList[i].kindcd + "'>" +
                    "<td>" + "13131313" + "</td>" +
                    "<td>" + abandonList[i].kindcd + "</td>" +
                    "<td>" + abandonList[i].colorcd + "</td>" +
                    "<td>" + abandonList[i].age + "</td>" +
                    "<td>" + abandonList[i].weight + "</td>" +
                    "</tr>";
                tableBody.append(row);
            }
            // JSON 데이터를 JavaScript 객체로 파싱
            var parsedData = JSON.parse(JSON.stringify(abandonList));
            // 각 키와 값을 분리하여 출력
            for (var key in parsedData) {
                var value = parsedData[key];
                console.log("키: " + key + ", 값: " + value);
            }
        }
    });
</script>
<script>
    // 신청자 조회 모달
    // 검색 버튼 클릭 시 모달창 열고 데이터 조회
    $("#modalBtn2").click(function() {
        // Ajax를 사용하여 서버에 데이터 조회 요청
        $.ajax({
            type: "GET",
            url: "/eSignDraft/adopterList",
            data: { searchParam: "yourSearchParameter" },  // 필요한 검색 파라미터 전달
            success: function(data) {
                // 모달창에 받아온 데이터를 표시하는 코드
                displayAdopterList(data)
                console.log("신청자 조회 성공");
            },
            error: function() {
                // 오류 처리
                console.log("신청자 조회 실패");
            }
        });
    });
    $("#adopterTable tbody").on("click", "tr", function(){
        var rowData = $(this).find("td").map(function(){
            return $(this).text();
        }).get();
        var selectedRowData = {
            이름 : rowData[0],
            전화번호 : rowData[1],
            이메일 : rowData[2],
            주소 : rowData[3],
            생일 : rowData[4]
        };
        var selectedAdopterId = $(this).data("adopter-id");
        // $("#selectedAnimalIdDisplay").text(selectedRowData);
        $("#selectedAdopterDisplay").text(JSON.stringify(selectedRowData, null, 2));
        console.log("Selected Adopter ID:" + selectedAdopterId);
        // $("#modal").hide();
    });
    // 모달창 닫기 버튼 클릭 이벤트
    $(".close").click(function(){
        // 모달창을 닫으면서 선택한 값을 전달하는 로직을 추가
        $("#modal2").hide();
    })
    function displayAdopterList(data){
        var tableBody = $("#adopterTable tbody")
        tableBody.empty();
        for (var i=0; i<data.length; i++) {
            console.log(data[i]);
            // String kindCd = mList.getKindcd();
            // String colorCd = mList.getColorcd();
            // String age = mList.getAge();
            // String weight = mList.getWeight();
            var row = "<tr data-adopter-id='" + data[i].master_nm + "'>" +
                "<td>" + data[i].master_nm + "</td>" +
                "<td>" + data[i].master_pnumber + "</td>" +
                "<td>" + data[i].master_email + "</td>" +
                "<td>" + data[i].master_address + "</td>" +
                "<td>" + data[i].master_bdate + "</td>" +
                "</tr>";
            tableBody.append(row);
        }
        // JSON 데이터를 JavaScript 객체로 파싱
        var parsedData = JSON.parse(JSON.stringify(data));
        // 각 키와 값을 분리하여 출력
        for (var key in parsedData) {
            var value = parsedData[key];
            console.log("키: " + key + ", 값: " + value);
        }
    }
</script>

