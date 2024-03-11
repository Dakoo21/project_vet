<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    List<Map<String, Object>> diagDetailList = (List)request.getAttribute("diagDetail");
    Map<String, Object> rmap = null; // 기본적으로 null로 설정

    // dList가 비어 있지 않은 경우 첫 번째 맵을 가져옴
    if (diagDetailList != null) {
        rmap = diagDetailList.get(0);
    } else {
    };
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>진료 상세</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <script>
        let costSum = 0;
        let isChecked = [];
        for(let i = 0; i<22 ; i++){
            isChecked.push(false);
        }
        console.log(isChecked);


        let checkList = [];
        function closeModal() {
            //모달창 닫기
            var modal = document.getElementById("diagModal"); // 모달 요소 가져오기
            if (modal) {
                modal.style.display = "none";
                console.log("modal close");
            }
        }
        function closeDiagSelectedAllModal() {
            var modal = document.getElementById("diagSelectedAllModal"); // 모달 요소 가져오기
            if (modal) {
                modal.style.display = "none";
                console.log("modal close");
            }
            //모든 체크 해제
            for(let i = 0; i<isChecked.length;i++) {
                var checkIndex = document.getElementById("inlineCheckbox" + (i+1).toString());
                checkIndex.checked = false;
                //합계금액 초기화
                costSum = 0;
                var costSumDisplay = document.getElementById("costSumDisplay");

                // costSum 값을 div 요소의 내용으로 설정
                costSumDisplay.innerText = "Total Cost: " + costSum;


            }
            //checkList 초기화
            checkList =[];
        }
        function closeDiagSelecteNotModal() {
            //모달창 닫기
            var modal = document.getElementById("diagSelecteNotModal"); // 모달 요소 가져오기
            if (modal) {
                modal.style.display = "none";
                console.log("modal close");
            }
            //모든 체크 해제
            for(let i = 0; i<isChecked.length;i++) {
                var checkIndex = document.getElementById("inlineCheckbox" + (i+1).toString());
                checkIndex.checked = false;
                //합계금액 초기화
                costSum = 0;
                var costSumDisplay = document.getElementById("costSumDisplay");

                // costSum 값을 div 요소의 내용으로 설정
                costSumDisplay.innerText = "Total Cost: " + costSum;

            }
            checkList =[];
        }

        // Close 버튼에 클릭 이벤트 리스너 추가
        const closeButton = document.querySelector("#diagModal .close");
        closeButton.onclick = function() {
            closeModal();
        }

        // 모달 바깥쪽을 클릭하여도 모달이 닫히도록 설정
        window.onclick = function(event) {
            var modal = document.getElementById("diagModal"); // 모달 요소 가져오기
            if (event.target === modal) {
                closeModal();
            }
        }

        // Modal 열기
        function openModal() {
            if(isChecked[20] && isChecked[21]) {
                var modal = document.getElementById("diagSelectedAllModal"); // "초진과 재진 중 하나만 선택 가능합니다."
                modal.style.display = "block";

            }
            else if((!isChecked[20] && isChecked[21])||(isChecked[20] && !isChecked[21])){
                var modal = document.getElementById("diagModal"); // 모달 요소 가져오기
                modal.style.display = "block";
            }
            else{
                var modal = document.getElementById("diagSelecteNotModal"); // "진료 형태를 선택해 주세요."
                modal.style.display = "block";
            }

            // diagPrice 수집
            var diagPrice = document.getElementById('diagPrice').value;

            // diagPk 수집
            var diagPk = document.querySelector('input[name="diagPk"]').value;

            // 선택한 servicePk 수집
            var servicePk = document.getElementById('servicePk').value;

            // AJAX 요청 보내기
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '/diag/diagInsert', true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // 응답 처리
                        alert('저장되었습니다.');
                    } else {
                        // 오류 처리
                        alert('오류가 발생했습니다.');
                    }
                }
            };
            // 데이터 전송
            var data = JSON.stringify({
                diagPk: diagPk,
                servicePk: servicePk, // 선택한 servicePk 값 추가
                diagPrice: diagPrice
            });
            xhr.send(data);
        }

        function toggleCheckbox(index) {
            isChecked[index] = !isChecked[index]; // 체크박스 상태 변경
            if(isChecked[20] && isChecked[21]) {
                //진료 둘다선택했을때 막기
                var modal = document.getElementById("diagSelectedAllModal"); // 모달 요소 가져오기
                modal.style.display = "block";
            }
            else if((!isChecked[20] && isChecked[21])||(isChecked[20] && !isChecked[21])){
                if (isChecked[index]) {
                    // 체크박스가 체크된 상태이면 함수 실행
                    addCheckList(index); // 체크박스 인덱스는 0부터 시작하므로 1을 더해줌
                } else {
                    // 체크박스가 해제된 상태이면 함수 취소
                    removeCheckList(index);
                }
                // 선택한 서비스 pk를 얻어서 변수에 저장하는 예시 코드
                var selectedServicePk = getServicePkByIndex(index);
                // 선택한 서비스 pk를 숨은 입력 요소에 저장
                document.getElementById("servicePk").value = selectedServicePk;
            }
            else{
                //진료 선택 안했을 때 막기
                var modal = document.getElementById("diagSelecteNotModal"); // 모달 요소 가져오기
                modal.style.display = "block";

            }


            console.log(checkList)
        }





        function addCheckList(parameter) {
            var newMap = {}; // 새로운 map 객체 생성
            newMap["diagPk"] = "<%=rmap.get("diagPk")%>";
            newMap["servicePk"] = parameter + 1;
            checkList.push(newMap); // 새로운 map 객체를 checkList에 추가
            $.ajax({
                url: 'GetServiceCost?servicePk=' + (parameter + 1), // GET 요청을 보낼 다른 엔드포인트 URL
                type: 'GET',
                success: function(response) {
                    // GET 요청이 성공했을 때 실행되는 코드
                    console.log('GET 요청이 성공했습니다.');
                    console.log(response); // 받은 응답 데이터
                    costSum += response[0].SERVICE_PRICE;
                    console.log(costSum)
                    var costSumDisplay = document.getElementById("costSumDisplay");

                    // costSum 값을 div 요소의 내용으로 설정
                    costSumDisplay.innerText = "Total Cost: " + costSum;
                },
                error: function(xhr, status, error) {
                    // GET 요청이 실패했을 때 실행되는 코드
                    console.error('GET 요청이 실패했습니다.', error);
                }
            });
        }

        function removeCheckList(parameter) {
            for (var i = checkList.length - 1; i >= 0; i--) {
                if (checkList[i]["servicePk"] === parameter + 1) {
                    checkList.splice(i, 1);
                    $.ajax({
                        url: 'GetServiceCost?servicePk=' + (parameter + 1), // GET 요청을 보낼 다른 엔드포인트 URL
                        type: 'GET',
                        success: function(response) {
                            // GET 요청이 성공했을 때 실행되는 코드
                            console.log('GET 요청이 성공했습니다.');
                            console.log(response); // 받은 응답 데이터
                            costSum -= response[0].SERVICE_PRICE;
                            console.log(costSum)
                            var costSumDisplay = document.getElementById("costSumDisplay");

                            // costSum 값을 div 요소의 내용으로 설정
                            costSumDisplay.innerText = "Total Cost: " + costSum;

                        },
                        error: function(xhr, status, error) {
                            // GET 요청이 실패했을 때 실행되는 코드
                            console.error('GET 요청이 실패했습니다.', error);
                        }
                    });
                }
            }
        }
        // Form submit 함수
        function submitList() {
            // checkList를 JSON 문자열로 변환
            var jsonCheckList = JSON.stringify(checkList);
            // POST 요청 보내기
            $.ajax({
                url: 'diagServiceInsert',
                type: 'POST',
                contentType: 'application/json',
                data: jsonCheckList,
                success: function (response) {
                    // POST 요청이 성공했을 때 실행되는 코드
                    console.log('POST 요청이 성공했습니다.');
                    submitForm();
                },
                error: function (xhr, status, error) {
                    // POST 요청이 실패했을 때 실행되는 코드
                    console.error('POST 요청이 실패했습니다.', error);
                }
            });
        }

        //서비스 가격 합계
        document.addEventListener("DOMContentLoaded", function() {
            // costSum 값을 표시할 div 요소를 가져옴
            var costSumDisplay = document.getElementById("costSumDisplay");

            // costSum 값을 div 요소의 내용으로 설정
            costSumDisplay.innerText = "Total Cost: " + costSum;
            var diagPrice = document.getElementById("diagPrice");
            diagPrice.value = costSum;
            console.log(diagPrice.value);

        });
        function submitForm() {
            var diagPriceValue = document.getElementById("diagPrice");
            diagPriceValue.value = costSum;
            var form = document.getElementById("diagForm1");
            form.submit();
        }


        $.widget.bridge('uibutton', $.ui.button)

    </script>

</head>
<body class="hold-transition sidebar-mini">
<section class="wrapper">
    <%@ include file="/include/sidebar.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <section class="content-wrapper" style="overflow-y: auto; max-height: calc(100vh - 150px);">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>진료 상세페이지</h1>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <!--여기 -->
            <form id="diagForm1" action="http://localhost:8000/diag/diagUpdate" method="POST">
                <div id="contents_box">
                    <div id="img_area">
                        <img alt="Avatar" class="table-avatar" src="/img/logo/logo_2.png" style="height:50%; width:50%; margin-left:100px; margin-bottom: 500px">
                    </div>
                    <a id="table_area" style="margin-bottom: 500px">
                        <table class="table table-borderless">
                            <tr>
                                <th>고객명</th>
                                <td><input class="form-control" type="text" value="<%=rmap.get("MASTER_NM")%>" aria-label="readonly input example" readonly></td>
                            <th>연락처</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("MASTER_PNUMBER")%>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("MASTER_ADDRESS")%>" aria-label="readonly input example" readonly></td>
                            <th>email</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("MASSTER_EMAIL")%>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>동물이름</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("ANIMAL_NM")%>" aria-label="readonly input example" readonly></td>
                            <th>종류</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("ANIMAL_SPECIES")%>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>품종</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("ANIMAL_BREED")%>" aria-label="readonly input example" readonly></td>
                            <th>성별</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("ANIMAL_SEX")%>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("ANIMAL_BDATE")%>" aria-label="readonly input example" readonly></td>
                            <th>중성화</th>
                            <td><input class="form-control"  type="text" value="<%=rmap.get("ANIMAL_NEUT")%>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>진료예약</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("BOOKING_DATE")%> <%=rmap.get("BOOKING_START")%>" aria-label="bookingStart input example" readonly></td>
                            <th>몸무게</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("ANIMAL_WEIGHT")%>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>진료비</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("DIAG_PRICE")%>" aria-label="readonly input example" readonly></td>
                        </tr>

                    </table>
                    <input type="hidden" id="bookingPk" name="bookingPk" value="<%=rmap.get("BOOKING_PK")%>"/>
                    </a>
                </div>
            </form>
        </section>
    </section>
    <!-- /.content-wrapper -->

        <div id="diagModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <!-- 예약 양식 -->
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">진료 결과를 저장하시겠습니까?</h3>
                    </div>
                    <div class="card-body">
                            <button id="diagSaveButton" onclick="submitList()">저장</button>
                    </div>
                </div>
                <!-- /.card -->
            </div>
        </div>
            <!-- /.modal-content -->
        <div id="diagSelectedAllModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeDiagSelectedAllModal()">&times;</span>
                <!-- 예약 양식 -->
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">초진과 재진 중 하나만 선택 가능합니다.</h3>
                    </div>

                </div>
                <!-- /.card -->
            </div>
        </div>
        <!-- /.modal-content -->
        <div id="diagSelecteNotModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeDiagSelecteNotModal()">&times;</span>
                <!-- 예약 양식 -->
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">진료 형태를 선택해 주세요.</h3>
                    </div>

                </div>
                <!-- /.card -->
            </div>
        </div>
        <!-- /.modal-content -->

    <!-- ./wrapper -->

    <!--footer-->

    <script>

    </script>
</body>
<%@ include file="/include/footer.jsp"%>
<%@ include file="/include/bootCommonFoot.jsp"%>
<%--<%@ include file="/include/bootCommonFoot1.jsp"%>--%>
</html>

<style typeof="text/css">


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
    .modal {
        position: fixed;
        z-index: 1;
        padding-top: 100px; /* 모달이 화면 상단에서 100px 내려와 있도록 설정 */
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4); /* 모달 외의 영역이 어둡게 보이도록 설정 */
    }

    .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 30%; /* 모달의 너비를 조정 */
    }

    .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

</style>
