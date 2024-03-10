<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/include/common/bootstrap_common.jsp"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<form id="adoptForm" method="post" >
    <table class="table table-borderless">
        <thead>
        <tr>
            <th>동물이름</th>
            <th><input type="text" class="form-control" id="ADOPT_NM" name="ADOPT_NM" placeholder=></th>
        </tr>
        <tr>
            <th>생년월일</th>
            <th><input type="text" class="form-control" id="ADOPT_BDATE" name="ADOPT_BDATE" placeholder=></th>
        </tr>
        <tr>
            <th>축종</th>
            <th><input type="text" class="form-control" id="ADOPT_SPECIES" name="ADOPT_SPECIES" placeholder="개, 고양이, 토끼..."></th>
        </tr>
        <tr>
            <th>체중</th>
            <th><input type="text" class="form-control" id="ADOPT_WEIGHT" name="ADOPT_WEIGHT" placeholder="KG"></th>
        </tr>
        <tr>
            <th>성별</th>
            <th><input type="text" class="form-control" id="ADOPT_SEX" name="ADOPT_SEX"></th>
        </tr>
        <tr>
            <th>중성화</th>
            <th><input type="text" class="form-control" id="ADOPT_NEUT" name="ADOPT_NEUT"></th>
        </tr>
        <tr>
            <div class="row">
                <div class="col-3">
                    <th>신청자</th>
                    <th><input style="width:300px; margin-right: 5px;" type="text" class="form-control" id="MASTER_NM" placeholder="" name="MASTER_NM"></th>
                </div>
                <div class="col-3">
                    <th><button type="button" id="modalBtn2" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#selectForm2">입양자 선택</button></th>
                </div>
            </div>
        </tr>
        <tr>
            <th>유기번호</th>
            <th><input style="width:300px; margin-right: 5px;" type="text" class="form-control" id="DESERTION_NO" placeholder="" name="DESERTION_NO"></th>
            <th><button type="button" id="modalBtn1" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#selectForm1">유기번호 조회</button></th>

        </tr>
        <tr>
            <th>이유</th>
            <th><input type="text" class="form-control" id="ADOPT_REASON" placeholder="" name="ADOPT_REASON"></th>
        </tr>
        <tr>
            <th>품종</th>
            <th><input type="text" class="form-control" id="ADOPT_BREED" placeholder="" name="ADOPT_BREED"></th>
        </tr>
        <tr>
            <th><input type="hidden" class="form-control" id="MASTERPK" placeholder="" name="MASTERPK" value=""></th>
        </tr>
    </table>
</form>
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
<body>
<div id="contentwrite">
    <div id="modal">
    </div>
</div>
<!--modal start-->
<div class="modal" id="selectForm1">
    <div class="modal-dialog modal-dialog-centered modal-xl" id="dynamicModalSize">
        <div class="modal-content" style="width:1000px">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">유기동물 조회</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <div class="stockList">
                    <table class="table table-striped table-valign-middle" id="animalTable">
                        <thead>
                        <tr>
                            <td>유기번호</td>
                            <td>품종명</td>
                            <td>색</td>
                            <td>나이(출생연도)</td>
                            <td>몸무게</td>
                            <td>중성화</td>
                            <td>성별</td>
                            <td>사진</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>

                            </td>
                        </tr>
                        </tbody>
                        <tfoot>

                        </tfoot>
                    </table>
                    <input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="선택">
                </div>
            </div>
        </div>
    </div>
</div>
<!--modal start-->
<div class="modal" id="selectForm2">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">입양자 조회</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <!-- <form id="f_board" method="get" action="./boardInsert"> -->
                <div class="stockList">
                    <table class="table table-striped table-valign-middle" id="adopterTable">
                        <thead>
                        <tr>
                            <td>이름</td>
                            <td>전화번호</td>
                            <td>이메일</td>
                            <td>주소</td>
                            <td>번호</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="선택">
                </div>
            </div>
    </div>
    <%--</div>--%>
</body>
<!-- 모달(Modal) 창 추가 -->
<div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="imageModalLabel">이미지 미리보기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body text-center">
                <img id="previewImage" src="" alt="동물 사진" style="max-width: 100%; max-height: 80vh;">
            </div>
        </div>
    </div>
</div>
<script>
    // 이미지를 팝업 창에서 열기 위한 함수
    function openImagePopup(imageUrl) {
        // 팝업 창을 열고 이미지를 표시하는 코드
        var popup = window.open('', '_blank');
        popup.document.write('<html><head><title>이미지 팝업</title></head><body style="text-align: center;"><img src="' + imageUrl + '" alt="동물 사진" style="max-width: 100%; max-height: 100%;"></body></html>');
    }

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

        $("#animalTable tbody").on("click", "tr", function(event){
            event.stopPropagation();
            var rowData = $(this).find("td").map(function(){
                return $(this).text();
            }).get();
            var selectedRowData = {
                유기번호 : rowData[0],
                품종명 : rowData[1],
                색 : rowData[2],
                나이 : rowData[3],
                몸무게 : rowData[4],
                중성화 : rowData[5],
                성별 : rowData[6],
                사진 : rowData[7]
            };
            const modalbtn11 = document.getElementById('modalBtn1');
            var selectedAnimalId = $(this).data("animal-id");
            var inputString = selectedRowData.품종명;

            var regexPattern = /\[([^\]]+)\]\s*([^]+)/;
            var matches = inputString.match(regexPattern);

            if (matches) {
                var species = matches[1];
                var breed = matches[2];
                console.log("종류: " + species);
                console.log("품종: " + breed);
            } else {
                console.log("패턴을 찾을 수 없습니다.");
            }
            $("#selectedAnimalIdDisplay").text(species);

            console.log("Selected Animal ID:" + selectedAnimalId);
            $("#ADOPT_SPECIES").val(species);
            $("#ADOPT_BREED").val(breed);
            $("#ADOPT_NEUT").val(selectedRowData.중성화);
            $("#ADOPT_WEIGHT").val(selectedRowData.몸무게);
            $("#ADOPT_BDATE").val(selectedRowData.나이);
            $("#DESERTION_NO").val(selectedRowData.유기번호);
            $("#ADOPT_SEX").val(selectedRowData.성별);

            $("#modal").hide();
        });

        $(".close").click(function(){
            $("#modal").hide();
        })

        function displayAnimalList(abandonList){
            var tableBody = $("#animalTable tbody")
            tableBody.empty();
            for (var i=0; i<abandonList.length; i++) {
                var imageUrl = abandonList[i].popfile;

                // 이미지 URL이 존재하면 이미지를 팝업 창에서 열기, 아니면 '사진 없음' 문자열 출력
                var imageCellContent = imageUrl
                    ? '<a href="#" onclick="openImagePopup(\'' + imageUrl + '\')"><img src="' + imageUrl + '" alt="동물 사진" style="max-width: 100px;"></a>'
                    : '사진 없음';

                console.log(abandonList[i].kindcd);
                var row = "<tr data-animal-id='" + abandonList[i].kindcd + "'>" +
                    "<td>" + abandonList[i].desertion_no + "</td>" +
                    "<td>" + abandonList[i].kindcd + "</td>" +
                    "<td>" + abandonList[i].colorcd + "</td>" +
                    "<td>" + abandonList[i].age + "</td>" +
                    "<td>" + abandonList[i].weight + "</td>" +
                    "<td>" + abandonList[i].neuteral_yesorno + "</td>" +
                    "<td>" + abandonList[i].sex + "</td>" +
                    "<td>" + imageCellContent + "</td>" +
                    "</tr>";
                tableBody.append(row);
            }

            var parsedData = JSON.parse(JSON.stringify(abandonList));
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
            번호 : rowData[4]
        };
        var selectedAdopterId = $(this).data("adopter-id");
        $("#selectedAdopterDisplay").text(JSON.stringify(selectedRowData, null, 2));
        console.log("Selected Adopter ID:" + selectedAdopterId);
        $("#MASTERPK").val(selectedRowData.번호);
        $("#MASTER_NM").val(selectedRowData.이름);

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
            var row = "<tr data-adopter-id='" + data[i].master_nm + "'>" +
                "<td>" + data[i].master_nm + "</td>" +
                "<td>" + data[i].master_pnumber + "</td>" +
                "<td>" + data[i].master_email + "</td>" +
                "<td>" + data[i].master_address + "</td>" +
                "<td>" + data[i].masterPk + "</td>" +
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
<!--모달창 사이즈 조절 스크립트 -->
<%--<script>--%>
<%--    function WindowModalResize(){--%>
<%--        window.dialogWidth = $(document).width() + 'px';--%>
<%--        window.dialogHeight = $(document).height() + 20 + 'px';--%>
<%--    }--%>
<%--</script>--%>
<script>
    // 모달 창의 크기를 동적으로 조절
    $(document).ready(function() {
        $("#selectForm1").on("show.bs.modal", function () {
            var modalBodyHeight = $("#selectForm1 .modal-body").height();
            $("#dynamicModalSize").css("max-height", modalBodyHeight + "px");
        });
    });
</script>
