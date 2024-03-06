<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.example.vet.model.MasterVO" %>

<%
    List<Map<String,Object>> cList =(List) request.getAttribute("cList");
%>

<script type="text/javascript">
    function searchEnter(){
        if(window.enent.keyCode==13){
            customerDataSearch();
        }
    }

    function customerDataSearch(){
        if($("#keyword").val() === '' || $("#keyword").val() === null ){
            alert("검색어를 입력해주세요.");
            return;
        }
        let searchData = {
            keyword: $("#keyword").val(),
        }
        // AJAX 요청 보내기
        $.ajax({
            url: "/CustomerDB/TotalCustomerSelectedList",
            type: "GET",
            data: searchData,
            contentType: "application/json",
            success: function(data){
                updateTable(data);
            },
            error: function(xhr, status, error){
            }
        });
    }
    function updateTable(data) {
        console.log(data)
        // 받은 데이터를 사용하여 테이블을 업데이트하는 로직을 작성
        let tableContent = "";
        $('#boardCustomerList > td').remove();
        // 예를 들어, 받은 데이터를 사용하여 테이블의 각 행을 구성하는 HTML을 생성
        data.forEach(function(row) {
            tableContent += '<table class="table table-striped table-bordered table-hover dt-responsive">';
            tableContent += "<thead>";
            tableContent += "<tr>";
            tableContent += "<th>고객명</th>";
            tableContent += "<th>ID</th>";
            tableContent += "<th>성별</th>";
            tableContent += "<th>생년월일</th>";
            tableContent += "<th>이메일</th>";
            tableContent += "<th>연락처</th>";
            tableContent += "<th>주소</th>";
            tableContent += "</tr>";
            tableContent += "</thead>";
            tableContent += "<tr>";
            tableContent += "<td> <a href=javascript:customerDataDetail(" + row.masterPk + ')>' + row.master_nm + "</td>";
            tableContent += "<td>" + row.master_username + "</td>";
            tableContent += "<td>" + row.master_gender + "</td>";
            tableContent += "<td>" + row.master_bdate + "</td>";
            tableContent += "<td>" + row.master_email + "</td>";
            tableContent += "<td>" + row.master_pnumber + "</td>";
            tableContent += "<td>" + row.master_address + "</td>";
            // 이와 같이 필요한 만큼 테이블의 열을 추가
            tableContent += "</tr>";
        });
        // 테이블을 업데이트
        $("#boardCustomerList").html(tableContent);
    }

    const customerDataInsert = () => {
        document.querySelector("#f_customerdata").submit();
    }

    const customerDataDetail = (masterPk) =>{
      location.href = "/CustomerDB/TotalCustomerDetail?masterPk="+masterPk;
      //location.href = "/CustomerDB/TotalCustomerDetail/"+masterPk;
    }
</script>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>고객리스트</title>
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
            <div class = "container">
                <div class="row">
                    <div class="search-top-area" style="right: auto">
                        <div class="search-box">
                            <div class="input-group">
                                <input type="search" id="keyword" class="form-control form-control-lg" placeholder="고객명을 입력해주세요.">
                                <div class="input-group-append">
                                    <button type="submit" class="btn btn-lg btn-default" onClick="customerDataSearch()">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </div>
                                <div class="text-right">
                                <div id="padding-right50" class="position-absolute top-20 end-20">
                                <a href="/CustomerDB/TotalCustomerInsertPage" type="button" class="btn btn-warning" >등록</a>
                                 </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.content -->
                <div>
                    <table id="boardCustomerList" class="table table-striped table-bordered table-hover dt-responsive">
                        <thead>
                        <tr>
                            <th>고객명</th>
                            <th>ID</th>
                            <th>성별</th>
                            <th>생년월일</th>
                            <th>이메일</th>
                            <th>연락처</th>
                            <th>주소</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (int i =0; i < cList.size(); i++){
                                Map<String,Object> pmap = cList.get(i);
                        %>
                        <tr>
                            <td><a href="javascript:customerDataDetail('<%=pmap.get("masterPk")%>')"><%=pmap.get("master_nm")%></a></td>
                            <td><%=pmap.get("master_username")%></td>
                            <td><%=pmap.get("master_gender")%></td>
                            <td><%=pmap.get("master_bdate")%></td>
                            <td><%=pmap.get("master_email")%></td>
                            <td><%=pmap.get("master_pnumber")%></td>
                            <td><%=pmap.get("master_address")%></td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                    <div style="display:flex; justify-content:center;">
                        <ul class="pagination"></ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->

<!--footer-->

<%@ include file="/include/bootCommonFoot.jsp"%>

</body>
</html>

<style typeof="text/css">
    .search-top-area{
        display: flex;
        align-items: center;
        justify-content: flex-end;
        margin-bottom: 40px;
    }

    #padding-right50{
        padding-right: 50px;
    }

    .search-box{
        display: flex;
        width: 100%;
        align-items: center;
        justify-content: center;
    }

    #padding-right50 .btn {
        width: 70px; /* 원하는 가로 크기로 설정하세요 */
    }
    /*.search-top-area {*/
    /*    position: relative; !* 부모 요소를 상대적 위치로 설정합니다. *!*/
    /*}*/

    /*.search-top-area .text-right {*/
    /*    position: absolute; !* 등록 버튼을 절대적 위치로 설정합니다. *!*/
    /*    top: 0; !* 부모 요소의 상단에 배치합니다. *!*/
    /*    right: 0; !* 부모 요소의 오른쪽에 배치합니다. *!*/
    /*}*/
</style>
