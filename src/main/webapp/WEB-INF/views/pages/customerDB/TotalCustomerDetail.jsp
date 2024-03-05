<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.vet.model.MasterVO" %>
<%--<%--%>
<%--    int size = 0;--%>
<%--    List<MasterVO> cList = (List)request.getAttribute("cList");--%>
<%--    out.print("++++"+cList);--%>
<%--    MasterVO masterVO = new MasterVO();--%>
<%--    if(cList != null){--%>
<%--        size = cList.size();--%>
<%--        if(size==1){--%>
<%--            masterVO = cList.get(0);--%>
<%--        }--%>
<%--    }--%>
<%--    out.print("++++"+masterVO);--%>
<%--%>--%>

<%

    MasterVO masterVO = (MasterVO) request.getAttribute("cList");


%>
<script type ="text/javascript">
    const customerList = () => {
        location.href="/CustomerDB/TotalCustomerList";
    }
    const customerUpdate = () => {
        document.querySelector("#f_customerdata").submit();
    }

    //모달 열기
    function totalCustomerUpdate() {
        var modal = document.getElementById("totalCustomerUpdate");
        modal.style.display = "block";
    }
    // Modal 닫기
    function closeModal() {
        var modal = document.getElementById("totalCustomerUpdate");
        modal.style.display = "none";
    }

    // Modal 닫기 버튼에 이벤트 리스너 추가
    var closeButton = document.getElementsByClassName("close")[0];
    closeButton.onclick = function() {
        closeModal();
    }

    function ModifyData() {
        $.ajax({
            url: "/CustomerDB/TotalCustomerUpdate",
            type: "POST",
            data: JSON.stringify({
                master_nm: $("#master_nm").val(),
                master_username: $("#master_username").val(),
                master_gender: $("#master_gender").val(),
                master_bdate: $("#master_bdate").val(),
                master_email: $("#master_email").val(),
                master_pnumber: $("#master_pnumber").val(),
                master_address: $("#master_address").val()
            }),
            contentType: "application/json",
            success: function(){
                alert("변경이 완료되었습니다.");
            },
            // success: function(response){
            //     // 성공했을 때 실행할 코드
            //     console.log("요청이 성공했습니다.");
            //     console.log("서버에서 받은 응답: ", response);
            // },
            error: function(xhr, status, error){
                // 실패했을 때 실행할 코드
                console.error("요청이 실패했습니다.");
                console.error("에러: ", error);
            }
        });
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
                <div id="table_area">
                    <table class="table table-borderless">
                        <tr>
                            <th>고객명</th>
                            <td><input class="form-control" type="text" value="<%=masterVO.getMaster_nm()%>" aria-label="readonly input example" readonly></td>
                            <th>ID</th>
                            <td><input class="form-control" type="text" value="<%=masterVO.getMaster_username()%>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>성별</th>
                            <td><input class="form-control" type="text" value="<%=masterVO.getMaster_gender()%>" aria-label="readonly input example" readonly></td>
                            <th>생년월일</th>
                            <td><input class="form-control" type="text" value="<%=masterVO.getMaster_bdate()%>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>email</th>
                            <td><input class="form-control" type="text" value="<%=masterVO.getMaster_email()%>" aria-label="readonly input example" readonly></td>
                            <th>연락처</th>
                            <td><input class="form-control" type="text" value="<%=masterVO.getMaster_pnumber()%>" aria-label="readonly input example" readonly></td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td><input class="form-control" type="text" value="<%=masterVO.getMaster_address()%>" aria-label="readonly input example" readonly></td>
                        </tr>
                    </table>
                </div>
        </section>
        <!-- /.content -->
        <div class="text-center">
            <button class="btn btn-warning" style="margin-right: 10px;" onclick="totalCustomerUpdate()">정보수정</button>
            <a href="http://localhost:8000/CustomerDB/TotalCustomerList" type="button" class="btn btn-primary" style="margin-right: 10px;">뒤로가기</a>
        </div>
    </div>
    <!-- /.content-wrapper -->
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
<%--<%@ include file="/include/bootCommonFoot1.jsp"%>--%>

<%-- 수정 모달 시작 --%>
<div class="modal" id="totalCustomerUpdate">
    <div class="modal-dialog modal-dialog-centered">
        <span class="close" onclick="closeModal()">&times;</span>
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">정보 수정</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                    <input type="hidden" id="masterPk" name="masterPk" value="<%=masterVO.getMasterPk()%>">
                        <div id="table_area_M">
                            <table class="table table-borderless">
                                <tr>
                                    <th>고객명</th>
                                    <td><input class="form-control" id="master_nm" type="text" value="<%=masterVO.getMaster_nm()%>"></td>
                                    <th>ID</th>
                                    <td><input class="form-control" id="master_username"  type="text" value="<%=masterVO.getMaster_username()%>"></td>
                                </tr>
                                <tr>
                                    <th>성별</th>
                                    <td><input class="form-control" id="master_gender" type="text" value="<%=masterVO.getMaster_gender()%>"></td>
                                    <th>생년월일</th>
                                    <td><input class="form-control" id="master_bdate" type="date" value="<%=masterVO.getMaster_bdate()%>"></td>
                                </tr>
                                <tr>
                                    <th>email</th>
                                    <td><input class="form-control" id="master_email" type="text" value="<%=masterVO.getMaster_email()%>"></td>
                                    <th>연락처</th>
                                    <td><input class="form-control" id="master_pnumber" type="text" value="<%=masterVO.getMaster_pnumber()%>"></td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td><input class="form-control" id="master_address" type="text" value="<%=masterVO.getMaster_address()%>"></td>
                                </tr>
                            </table>
                        </div>
            </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="ModifyData()">저장</button>
                        <input type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="closeModal()" value="닫기">
                    </div>
        </div>
    </div>
</div>
    <%-- 수정 모달 끝 --%>
</body>
</html>

<style typeof="text/css">
    .modal-dialog {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 100vw; /* 모달 창의 너비를 뷰포트의 너비로 설정합니다. */
        height: 100vh; /* 모달 창의 높이를 뷰포트의 높이로 설정합니다. */
        margin: 0;
        padding: 0;
        max-width: none;
    }
    .modal-content {
        height: 100%; /* 모달 내용의 높이를 100%로 설정합니다. */
        border: none; /* 테두리 없이 스타일링합니다. */
    }
    .modal-body {
        overflow-y: auto; /* 세로 스크롤이 필요한 경우 자동으로 스크롤이 생성됩니다. */
        max-height: calc(100vh - 120px); /* 모달 창의 높이에서 헤더와 푸터의 높이를 뺀 나머지 공간을 설정합니다. */
    }
    .modal-footer {
        display: flex;
        justify-content: center;
        padding: 15px;
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
