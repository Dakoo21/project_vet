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

        const isChecked = [false, false, false, false, false, false, false, false];
        let checkList = [];
        let map = {};

        // Modal 열기
        function openModalwithForm() {
            var formData1 = new FormData(document.getElementById("diagForm1"));
            var request = new XMLHttpRequest();

            request.onload = function() {
                // 서버로의 전송이 완료된 후에 모달을 띄우는 코드
                var modal = document.getElementById("diagModal");
                modal.style.display = "block";
            };

            request.open("POST", "http://localhost:8000/diag/diagUpdate");
            request.send(formData1);
        }

        // Modal 닫기
        function closeModal() {
            var modal = document.getElementById("diagModal");
            modal.style.display = "none";
        }

        // Modal 닫기 버튼에 이벤트 리스너 추가
        var closeButton = document.getElementsByClassName("close")[0];
        closeButton.onclick = function() {
            closeModal();
        }

        // 모달 외부를 클릭하여도 모달이 닫히도록 설정
        window.onclick = function(event) {
            var modal = document.getElementById("diagModal");
            if (event.target == modal) {
                closeModal();
            }
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

            map["diagPk"] = "<%=rmap.get("diagPk")%>";
            map["servicePk"] = parameter+1;
            checkList.push(map);

        }

        function removeCheckList(parameter) {
            for (var i = checkList.length - 1; i >= 0; i--) {
                if (checkList[i]["servicePk"] === parameter) {
                    checkList.splice(i, 1);
                }
            }
        }
        // Form submit 함수
        function submitForm() {
            // checkList를 JSON 문자열로 변환
            document.getElementById("checkListInput").value = JSON.stringify(checkList);

            // formData2의 값들을 추가
            var formData2 = new FormData(document.getElementById("diagForm2"));
            formData2.submit();

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
            <form id="diagForm1" action="http://localhost:8000/diag/diagUpdate" method="POST">
                <div id="contents_box">
                    <div id="img_area">
                        <img alt="Avatar" class="table-avatar" src="../../img/dog1.jpeg">
                    </div>
                    <div id="table_area">
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
                    <table>
                        <tr>
                            <th>내과</th>
                            <td>
                                <input type="checkbox" id="checkbox1" name="digestiveSystem" value="1"
                                    <%if(rmap.get("digestiveSystem")=="0")
                                    {%>
                                        checked>
                                    <%
                                    }else{
                                    %>
                                        >
                                    <%
                                    }
                                    %>
                                <label for="checkbox1">소화계</label>
                                <input type="checkbox" id="checkbox2" name="circulatorySystem" value="1"
                                    <%if(rmap.get("circulatorySystem")=="0"){%>
                                       checked>
                                    <%
                                    }else{
                                    %>
                                >
                                    <%
                                    }
                                    %>
                                <label for="checkbox2">순환계</label>
                                <input type="checkbox" id="checkbox3" name="respiratorySystem" value="1"
                                    <%if(rmap.get("respiratorySystem")=="0"){%>
                                       checked>
                                    <%
                                    }else{
                                    %>
                                >
                                    <%
                                    }
                                    %>
                                <label for="checkbox3">호흡기</label>
                                <input type="checkbox" id="checkbox4" name="nervousSystem" value="1"
                                    <%if(rmap.get("nervousSystem")=="0"){%>
                                       checked>
                                    <%
                                    }else{
                                    %>
                                >
                                    <%
                                    }
                                    %>
                                <label for="checkbox4">신경계</label>
                                <input type="checkbox" id="checkbox5" name="endocrineSystem" value="1"
                                    <%if(rmap.get("endocrineSystem")=="0"){%>
                                       checked>
                                    <%
                                    }else{
                                    %>
                                >
                                    <%
                                    }
                                    %>
                                <label for="checkbox5">내분비</label><br>
                                <input type="checkbox" id="checkbox6" name="eyes" value="1"
                                    <%if(rmap.get("eyes")=="0"){%>
                                       checked>
                                    <%
                                    }else{
                                    %>
                                >
                                    <%
                                    }
                                    %>
                                <label for="checkbox6">안과</label>
                                <input type="checkbox" id="checkbox7" name="dermatology" value="1"
                                    <%if(rmap.get("dermatology")=="0"){%>
                                       checked>
                                    <%
                                    }else{
                                    %>
                                >
                                    <%
                                    }
                                    %>
                                <label for="checkbox5">피부과</label>

                        </tr>
                        <tr>
                            <th>외과</th>
                            <td><input type="checkbox" id="checkbox8" name="orthopedics" value="1"
                                <%if(rmap.get("orthopedics")=="0"){%>
                                       checked>
                                <%
                                }else{
                                %>
                                >
                                <%
                                    }
                                %>
                                <label for="checkbox8">정형외과</label>
                                <input type="checkbox" id="checkbox9" name="neurosurgery" value="1"
                                    <%if(rmap.get("neurosurgery")=="0"){%>
                                       checked>
                                <%
                                }else{
                                %>
                                >
                                <%
                                    }
                                %>
                                <label for="checkbox9">신경외과</label>
                                <input type="checkbox" id="checkbox10" name="abdominalSurgery" value="1"
                                    <%if(rmap.get("abdominalSurgery")=="0"){%>
                                       checked>
                                <%
                                }else{
                                %>
                                >
                                <%
                                    }
                                %>
                                <label for="checkbox10">복강외과</label>
                                <input type="checkbox" id="checkbox11" name="thoracicSurgery" value="1"
                                    <%if(rmap.get("thoracicSurgery")=="0"){%>
                                       checked>
                                <%
                                }else{
                                %>
                                >
                                <%
                                    }
                                %>
                                <label for="checkbox11">흉부외과</label>
                                <input type="checkbox" id="checkbox12" name="dental" value="1"
                                    <%if(rmap.get("dental")=="0"){%>
                                       checked>
                                <%
                                }else{
                                %>
                                >
                                <%
                                    }
                                %>
                                <label for="checkbox12">치과</label>
                            </td>
                        </tr>
                        <tr>
                            <th>의사소견</th>
                            <td>
                                <textarea id="textboxForPrescription" name="diagPrescription" placeholder="특기사항을 입력하세요..."></textarea>
                        </tr>
                        <input type="hidden" name="diagPk" value="<%=rmap.get("diagPk")%>"/>
                        <tr>
                            <td class="project-actions text-right">
                                <a class="btn btn-info btn-sm" onclick="openModalwithForm()">
                                    <i class="fas fa-pencil-alt">작성완료</i></a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div style="text-align: center;">

            </div>
            </form>
        </section>
    </section>
    <!-- /.content-wrapper -->

        <div id="diagModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <!-- 예약 양식 -->
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title">처방</h3>
                    </div>
                    <div class="card-body">
                            <form id ="diagForm2" action="http://localhost:8000/diag/diagServiceInsert" METHOD="post">

                            <!-- 서비스 종류 -->
                                <div class="form-group" style="display: inline-block; width: 100%;">
                                    <table>
                                        <tr>
                                            <td><label for="prescriptionCheckbox1"><input type="checkbox" id="prescriptionCheckbox1" onclick="toggleCheckbox(0)"> 항생제</label></td>
                                            <td><label for="prescriptionCheckbox2"><input type="checkbox" id="prescriptionCheckbox2" onclick="toggleCheckbox(1)"> 주사</label></td>
                                            <td><label for="prescriptionCheckbox3"><input type="checkbox" id="prescriptionCheckbox3" onclick="toggleCheckbox(2)"> 예방접종</label></td>
                                            <td><label for="prescriptionCheckbox4"><input type="checkbox" id="prescriptionCheckbox4" onclick="toggleCheckbox(3)"> 혈액검사</label></td>
                                        </tr>
                                        <tr>
                                            <td><label for="prescriptionCheckbox5"><input type="checkbox" id="prescriptionCheckbox5" onclick="toggleCheckbox(4)"> 건강검진</label></td>
                                            <td><label for="prescriptionCheckbox6"><input type="checkbox" id="prescriptionCheckbox6" onclick="toggleCheckbox(5)"> X-RAY</label></td>
                                            <td><label for="prescriptionCheckbox7"><input type="checkbox" id="prescriptionCheckbox7" onclick="toggleCheckbox(6)"> 중성화</label></td>
                                            <td><label for="prescriptionCheckbox8"><input type="checkbox" id="prescriptionCheckbox8" onclick="toggleCheckbox(7)"> 수술</label></td>
                                        </tr>
                                    </table>
                                </div>

                            <input type="hidden" id="checkListInput" name="checkList" value="">
                            <button id="diagSaveButton" onclick="submitForm()">저장</button>



                        </form>
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
