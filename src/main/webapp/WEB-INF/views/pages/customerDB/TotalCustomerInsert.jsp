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
                            <th>ID</th>
                            <th><input type="text" class="form-control" id="master_username"></th>
                        </tr>
                        <tr>
                            <th>성별</th>
                            <th><select id="master_gender" class="form-control" aria-label="default select example">
                                <option selected>성별</option>
                                <option value="F">F</option>
                                <option value="M">M</option>
                            </select></th>
                            <th>생년월일</th>
                            <th><input type="date" class="form-control" id="master_bdate"></th>
                        </tr>
                        <tr>
                            <th>email</th>
                            <th><input type="email" class="form-control" id="master_email"></th>
                            <th>연락처</th>
                            <th><input type="text" class="form-control" id="master_pnumber"></th>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <th><input type="text" class="form-control" id="master_address"></th>
                        </tr>
                    </table>
                </div>
            </div>
            </div>

        <!-- /.content -->
        <div class="text-center">
            <button type="button" class="btn btn-primary" style="margin-right: 10px;" onclick="customerList()">취소</button>
            <button type="button" class="btn btn-primary" style="margin-right: 10px;" onclick="insert()">등록</button>
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
