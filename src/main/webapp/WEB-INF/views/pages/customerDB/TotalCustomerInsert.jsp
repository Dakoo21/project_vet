<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%
    int size = 0;
    List<Map<String,Object>> cList = (List)request.getAttribute("cList");
    Map<String, Object> rmap = null;
    if(cList != null){
        size = cList.size();
        if(size==1){
            rmap = cList.get(0);
        }
    }
    System.out.println("페이지");
%>
<script>
    function insert(){
        // AJAX 요청 보내기
        $.ajax({
            url: "/CustomerDB/TotalCustomerInsert",
            type: "POST",
            data: JSON.stringify({
                master_nm: $("#master_nm").val(),
                master_username: $("#master_username").val(),
                master_pw: $("#master_pw").val(),
                master_email: $("#master_email").val(),
                master_pnumber: $("#master_pnumber").val(),
                master_address: $("#master_address").val(),
                master_bdate: $("#master_bdate").val(),
                master_gender: $("#master_gender").val(),
            }),
            contentType: "application/json",
            success: function(response){
                // 성공했을 때 실행할 코드
                alert("저장되었습니다.");
                location.href="/CustomerDB/TotalCustomerList";
            },
            error: function(xhr, status, error){
                // 실패했을 때 실행할 코드
            }
        });
    }
    const customerList = () => {
        location.href="/CustomerDB/TotalCustomerList";
    }
</script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>고객 상세정보</title>
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
            <div class="mb-3 row">
            <div id="contents_box">
                <div id="table_area" >
                    <table class="table table-borderless" id="customerdataForm">
                        <tr>
                            <th>고객명</th>
                            <th><input type="text" class="form-control" id="master_nm"></th>
                            <th>성별</th>
                            <th><select id="master_gender" class="form-control" aria-label="default select example">
                                <option selected>성별</option>
                                <option value="F">F</option>
                                <option value="M">M</option>
                            </select></th>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <th><input type="date" class="form-control" id="master_bdate"></th>
                            <th>연락처</th>
                            <th><input type="text" class="form-control" id="master_pnumber"></th>
                        </tr>
                        <tr>
                            <th>email</th>
                            <th><input type="email" class="form-control" id="master_email"></th>
                            <th>주소</th>
                            <th><input type="text" class="form-control" id="master_address"></th>
                        </tr>
                    </table>
                </div>
            </div>
                <div class="wrap">
                    <div class="contents">
                        <form action="/" method="POST" id="form__wrap">
                            <ul class="terms__list">
                                <li class="terms__box">
                                    <div class="input__check">
                                        <input type="checkbox" name="agreement" id="privacyPolicy" value="privacyPolicy" required />
                                        <label for="privacyPolicy" class="required">개인정보 수집 및 이용 동의</label>
                                    </div>
                                    <div class="terms_content1">
                                        개인정보보호법에 따라 동물생심에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및
                                        이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니
                                        자세히 읽은 후 동의하여 주시기 바랍니다. 1. 수집하는 개인정보는 동물생심 진료에 필요한 기록용의 목적외에
                                        절대 사용하지 않습니다. 2. 이용자가 진료시 편의성,
                                        블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 등록할 경우, 동물생심은 서비스 이용을
                                        위해 필요한 최소한의 개인정보를 수집합니다.
                                    </div>
                                </li>
                                <li class="terms__box">
                                    <div class="input__check">
                                        <input type="checkbox" name="agreement" id="allowPromotions" value="allowPromotions" />
                                        <label for="allowPromotions">프로모션 정보 수신 동의</label>
                                    </div>
                                    <div class="terms_content2">
                                        동물생심에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(문자), 이메일로 받아보실 수
                                        있습니다. 일부 서비스(별도 회원 체계로 운영하거나 동물생심 등록 이후 추가 가입하여 이용하는 서비스 등)의
                                        경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며, 이때에도 수신 동의에 대해 별도로 안내하고
                                        동의를 받습니다.
                                    </div>
                                </li>
                            </ul>
                        </form>
                    </div>
                </div>


            </div>

        <!-- /.content -->

        <div class="text-center">
            <button type="button" class="btn btn-primary" style="margin-right: 10px;" onclick="customerList()">취소</button>
            <button type="button" class="btn btn-success" style="margin-right: 10px;" onclick="insert()">등록</button>
        </div>
        </section>
    </div>
    <%@ include file="/include/footer.jsp"%>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
<%--<%@ include file="/include/bootCommonFoot1.jsp"%>--%>
</body>
</html>

<style typeof="text/css">
    .wrap > .terms_content1{
        width: 500px;
        height: 100px;
        border: 1px solid black;
        overflow-y: scroll;
    }
    .wrap{
        margin-top: 90px;

        padding: 0;
        box-sizing: border-box;
    }

    .text-center{
        margin-top: 180px;
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

</style>
