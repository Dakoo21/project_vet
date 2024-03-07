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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>고객 상세정보</title>
    <%@ include file="/include/bootCommon.jsp"%>
</head>
<script type ="text/javascript">
    const customerList = () => {
        location.href="/CustomerDB/TotalCustomerList";
    }
    const customerUpdate = () => {
        document.querySelector("#f_customerdata").submit();
    }

</script>

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
                        <h1>고객 상세정보</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
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
            <a href="http://localhost:8000/CustomerDB/" type="button" class="btn btn-warning" style="margin-right: 10px;">정보수정</a>
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
