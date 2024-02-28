<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    List<Map<String, Object>> dList = (List)request.getAttribute("dList");
    Map<String, Object> rmap = null; // 기본적으로 null로 설정

    // dList가 비어 있지 않은 경우 첫 번째 맵을 가져옴
    if (dList != null && !dList.isEmpty()) {
        rmap = dList.get(0);
    } else {
        // dList가 비어 있는 경우 처리할 내용 추가 가능
        // 여기서는 간단히 "dList is empty" 메시지 출력
        out.println("dList is empty");
    };
    out.println(rmap.get(""));
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <script>
        let costSum = 0;
        let isChecked = [];
        for(let i = 0; i<20 ; i++){
            isChecked.push(false);
        }
        console.log(isChecked);


        let checkList = [];
        function closeModal() {
            var modal = document.getElementById("diagModal"); // 모달 요소 가져오기
            if (modal) {
                modal.style.display = "none";
                console.log("modal close");
            }
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
            var modal = document.getElementById("diagModal"); // 모달 요소 가져오기
            modal.style.display = "block";
        }




        function toggleCheckbox(index) {
            isChecked[index] = !isChecked[index]; // 체크박스 상태 변경

            if (isChecked[index]) {
                // 체크박스가 체크된 상태이면 함수 실행
                addCheckList(index); // 체크박스 인덱스는 0부터 시작하므로 1을 더해줌

            } else {
                // 체크박스가 해제된 상태이면 함수 취소
                removeCheckList(index);

            }
            console.log(checkList)
        }





        function addCheckList(parameter) {
            var newMap = {}; // 새로운 map 객체 생성
            newMap["diagPk"] = "<%=rmap.get("diagPk")%>";
            newMap["servicePk"] = parameter + 1;
            checkList.push(newMap); // 새로운 map 객체를 checkList에 추가
            $.ajax({
                url: 'http://localhost:8000/diag/GetServiceCost?servicePk=' + (parameter + 1), // GET 요청을 보낼 다른 엔드포인트 URL
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
                        url: 'http://localhost:8000/diag/GetServiceCost?servicePk=' + (parameter + 1), // GET 요청을 보낼 다른 엔드포인트 URL
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
                url: 'http://localhost:8000/diag/diagServiceInsert',
                type: 'POST',
                contentType: 'application/json',
                data: jsonCheckList,
                success: function(response) {
                    // POST 요청이 성공했을 때 실행되는 코드
                    console.log('POST 요청이 성공했습니다.');
                },
                error: function(xhr, status, error) {
                    // POST 요청이 실패했을 때 실행되는 코드
                    console.error('POST 요청이 실패했습니다.', error);
                }
            });

// GET 요청 보내기
            $.ajax({
                url: 'http://localhost:8000/diag/GetServiceCost', // GET 요청을 보낼 다른 엔드포인트 URL
                type: 'GET',
                success: function(response) {
                    // GET 요청이 성공했을 때 실행되는 코드
                    console.log('GET 요청이 성공했습니다.');
                    console.log(response); // 받은 응답 데이터
                },
                error: function(xhr, status, error) {
                    // GET 요청이 실패했을 때 실행되는 코드
                    console.error('GET 요청이 실패했습니다.', error);
                }
            });


        }
        document.addEventListener("DOMContentLoaded", function() {
            // costSum 값을 표시할 div 요소를 가져옴
            var costSumDisplay = document.getElementById("costSumDisplay");

            // costSum 값을 div 요소의 내용으로 설정
            costSumDisplay.innerText = "Total Cost: " + costSum;
        });
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
            <form id="diagForm1" action="http://localhost:8000/diag/diagUpdate" method="POST">
                <div id="contents_box">
                    <div id="img_area">
                        <img alt="Avatar" class="table-avatar" src="../../img/dog1.jpeg">
                    </div>
                    <a id="table_area">
                        <table class="table table-borderless">
                            <tr>
                                <th>고객명</th>
                                <td><input class="form-control" type="text" value="<%=rmap.get("masterNM")%>" aria-label="readonly input example" readonly></td>
                            <th>연락처</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("masterPhoneNumber")%>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("masterAddress")%>" aria-label="readonly input example" readonly></td>
                            <th>email</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("masterEmail")%>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>동물이름</th>
                            <td><input class="form-control" type="text" value="<%=rmap.get("animalNM")%>" aria-label="readonly input example" readonly></td>
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
                    <input type="hidden" id="bookingPk" name="bookingPk" value="<%=rmap.get("bookingPk")%>">


                        <p>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-record-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 13A5 5 0 1 0 8 3a5 5 0 0 0 0 10z"/>
                            </svg>서비스
                        </p>
                        <div class="medical-checkbox-area">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox1" onclick="toggleCheckbox(0)">
                                <label class="form-check-label" for="inlineCheckbox1">항생제</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox2" onclick="toggleCheckbox(1)">
                                <label class="form-check-label" for="inlineCheckbox2">주사</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox3" onclick="toggleCheckbox(2)">
                                <label class="form-check-label" for="inlineCheckbox3">예방접종</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox4" onclick="toggleCheckbox(3)">
                                <label class="form-check-label" for="inlineCheckbox4">혈액검사</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox5" onclick="toggleCheckbox(4)">
                                <label class="form-check-label" for="inlineCheckbox5">건강검진</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox6" onclick="toggleCheckbox(5)">
                                <label class="form-check-label" for="inlineCheckbox6">X-Ray</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox7" onclick="toggleCheckbox(6)">
                                <label class="form-check-label" for="inlineCheckbox7">중성화</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox8" onclick="toggleCheckbox(7)">
                                <label class="form-check-label" for="inlineCheckbox8">수술</label>
                            </div>
                        </div>
                        <hr style="width:100%;height:1px;border:none;background-color:dimgrey;">
                        <p>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-record-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 13A5 5 0 1 0 8 3a5 5 0 0 0 0 10z"/>
                            </svg>내과
                        </p>
                        <div class="medical-checkbox-area">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox9" onclick="toggleCheckbox(8)">
                                <label class="form-check-label" for="inlineCheckbox9">소화계</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox10" onclick="toggleCheckbox(9)">
                                <label class="form-check-label" for="inlineCheckbox10">순환계</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox11" onclick="toggleCheckbox(10)">
                                <label class="form-check-label" for="inlineCheckbox11">호흡기</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox12" onclick="toggleCheckbox(11)">
                                <label class="form-check-label" for="inlineCheckbox12">신경계</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox13" onclick="toggleCheckbox(12)">
                                <label class="form-check-label" for="inlineCheckbox13">내분비계</label>
                            </div>

                        </div>
                        <hr style="width:100%;height:1px;border:none;background-color:dimgrey;">
                        <p>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-record-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 13A5 5 0 1 0 8 3a5 5 0 0 0 0 10z"/>
                            </svg>외과
                        </p>
                        <div class="medical-checkbox-area">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox14" onclick="toggleCheckbox(13)">
                                <label class="form-check-label" for="inlineCheckbox14">안과</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox15" onclick="toggleCheckbox(14)">
                                <label class="form-check-label" for="inlineCheckbox15">피부과</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox16" onclick="toggleCheckbox(15)">
                                <label class="form-check-label" for="inlineCheckbox16">정형외과</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox17" onclick="toggleCheckbox(16)">
                                <label class="form-check-label" for="inlineCheckbox17">신경외과</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox18" onclick="toggleCheckbox(17)">
                                <label class="form-check-label" for="inlineCheckbox18">복강외과</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox19" onclick="toggleCheckbox(18)">
                                <label class="form-check-label" for="inlineCheckbox19">흉부외과</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" id="inlineCheckbox20" onclick="toggleCheckbox(19)">
                                <label class="form-check-label" for="inlineCheckbox20">치과</label>
                            </div>
                        </div>
                        <hr style="width:100%;height:1px;border:none;background-color:dimgrey;"/>

                        <table>
                            <thead>
                            <th>의사소견</th>
                            </thead>
                            <tbody>
                            <tr>

                            </td>
                                <td>
                                    <textarea id="textboxForPrescription" name="diagPrescription" placeholder="특기사항을 입력하세요..." style="width: 500px; height: 150px;"></textarea>
                                </td>
                            </tr>
                            <input type="hidden" name="diagPk" value="<%=rmap.get("diagPk")%>"/>

                            <tr>
                                <td class="project-actions text-right">
                                    <a id="costSumDisplay"></a>
                                    <a class="btn btn-info btn-sm" onclick="openModal()">
                                        <i class="fas fa-pencil-alt">작성완료</i>
                                    </a>
                                </td>
                            </tr>
                            <tr>

                            </tr>
                            </tbody>
                            <input type="hidden" id="checkListInput" name="checkList" value="">
                        </table>
                                <!-- 서비스 종류 -->

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
                            <button id="diagSaveButton" onclick="submitForm()">저장</button>
                    </div>
                </div>
                <!-- /.card -->
            </div>
        </div>
            <!-- /.modal-content -->

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
