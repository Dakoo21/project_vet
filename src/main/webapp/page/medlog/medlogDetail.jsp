<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
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
                        <h1>진료기록 상세페이지</h1>
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
                            <td><input class="form-control" type="text" value="서견주" aria-label="readonly input example" readonly></td>
                            <th>연락처</th>
                            <td><input class="form-control" type="text" value="010-7575-5757" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td><input class="form-control" type="text" value="금천구 가산동 123-12" aria-label="readonly input example" readonly></td>
                            <th>email</th>
                            <td><input class="form-control" type="text" value="seoul17@hot.com" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>동물이름</th>
                            <td><input class="form-control" type="text" value="뭉치" aria-label="readonly input example" readonly></td>
                            <th>종류</th>
                            <td><input class="form-control" type="text" value="개" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>품종</th>
                            <td><input class="form-control" type="text" value="불독" aria-label="readonly input example" readonly></td>
                            <th>성별</th>
                            <td><input class="form-control" type="text" value="여" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td><input class="form-control" type="text" value="2012.02" aria-label="readonly input example" readonly></td>
                            <th>중성화</th>
                            <td><input class="form-control"  type="text" value="O" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>진료예약</th>
                            <td><input class="form-control" type="text" value="2024.02.8 - 15:00" aria-label="readonly input example" readonly></td>
                            <th>몸무게</th>
                            <td><input class="form-control" type="text" value="5.4kg" aria-label="readonly input example" readonly></td>
                        </tr>
                    </table>
                </div>
            </div>
            <label for="exampleFormControlTextarea1" class="form-label">진료기록</label>
            <hr style="width:100%;height:1px;border:none;background-color:dimgrey;">
            <p>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-record-fill" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M8 13A5 5 0 1 0 8 3a5 5 0 0 0 0 10z"/>
                </svg>내과
            </p>
            <div class="medical-checkbox-area">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1" checked>
                    <label class="form-check-label" for="inlineCheckbox1">소화기</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">
                    <label class="form-check-label" for="inlineCheckbox2">순환기</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox" value="option3" checked>
                    <label class="form-check-label" for="inlineCheckbox">호흡기</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3">
                    <label class="form-check-label" for="inlineCheckbox3">신경</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox4" value="option3">
                    <label class="form-check-label" for="inlineCheckbox4">내분비</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox5" value="option3">
                    <label class="form-check-label" for="inlineCheckbox4">안과</label>
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
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox6" value="option1">
                    <label class="form-check-label" for="inlineCheckbox1">정형외과</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox7" value="option2">
                    <label class="form-check-label" for="inlineCheckbox2">흉부외과</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox8" value="option3">
                    <label class="form-check-label" for="inlineCheckbox">치과</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox9" value="option3" checked>
                    <label class="form-check-label" for="inlineCheckbox3">X-ray</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox10" value="option3">
                    <label class="form-check-label" for="inlineCheckbox4">중성화</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="inlineCheckbox11" value="option3">
                    <label class="form-check-label" for="inlineCheckbox4">일반수술</label>
                </div>
            </div>
        </section>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">증상 기록</label>
            <div>
                <hr style="width:100%;height:1px;border:none;background-color:dimgrey;">
                <textarea class="form-control" id="exampleFormControlTextarea1" style="width: 100%; text-align: left;" rows="3">
            음식을 먹으면 구토 증세가 일어나고 수시로 호흡이 가빠짐.
        </textarea>
            </div>
        </div>
        <div class="mb-3">
            <div style="display: flex; align-items: center;">
                <label for="exampleFormControlTextarea1" class="form-label">처방 기록</label>
                <div id="modal">
                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#selectForm" onclick="medicalmodal()">약 처방내역</button>
                </div>
            </div>
            <div id="content write">
                <hr style="width:100%;height:1px;border:none;background-color:dimgrey;">
                <textarea class="form-control" id="exampleFormControlTextarea2" style="width: 100%; text-align: left;" rows="3">
                    약물처방. x-ray 촬영 후 상태 추적관찰
                </textarea>
            </div>
            <div class="text-center">
                <button type="button" class="btn btn-primary">수정</button>
            </div>
        </div>
    </div>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->



<!-- ./wrapper -->

<!--footer-->
<%@ include file="/include/footer.jsp"%>
<script>
    $.widget.bridge('uibutton', $.ui.button)
</script>
<%@ include file="/include/bootCommonFoot.jsp"%>
<%--<%@ include file="/include/bootCommonFoot1.jsp"%>--%>

</body>
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
