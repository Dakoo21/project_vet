<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>통합데이터 상세정보</title>
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
            </div><!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <div class="text-right">
            <div id="padding-right50" class="position-absolute top-0 end-70">
                <button id="margin-right20" type="button" class="btn btn-warning">정보수정</button>
            </div>
        </div>
        <section class="content">
            <div id="contents_box">
                <div id="img_area">
                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="...">
                </div>
                <div id="table_area">
                    <table class="table table-borderless">
                        <tr>
                            <th>고객명</th>
                            <td><form id="modifyForm" action="/CustomerDB/TotalDataUpdate" method="post">
                                <input class="form-control" type="text" value="${dList[0].master_nm}"></form></td>
                            <th>연락처</th>
                            <td><input class="form-control" type="tel" value="${dList[0].master_pnumber}" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>주소</th>
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
                            <th>진료예약</th>
                            <td><input class="form-control" type="text" value="진료" aria-label="readonly input example" readonly></td>
                            <th>몸무게</th>
                            <td><input class="form-control" type="text" value="${dList[0].animal_weight}kg" aria-label="readonly input example" readonly></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">최근 진료내역</label>
                <textarea class="form-control" id="exampleFormControlTextarea1"  aria-label="readonly input example" readonly style="width: 100%" rows="3"></textarea>
            </div>
        </section>
        <!-- /.content -->
        <div class="text-center">
            <a href="http://localhost:8000/CustomerDB/TotalDataList" type="button" class="btn btn-primary" style="margin-right: 10px;">뒤로가기</a>
            <a href="http://localhost:8000/booking/bookingRegister" type="button" class="btn btn-success">진료등록</a>
        </div>
    </div>
    <!-- /.content-wrapper -->
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
<%--<%@ include file="/include/bootCommonFoot1.jsp"%>--%>

</body>
</html>



<style typeof="text/css">
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

</style>
