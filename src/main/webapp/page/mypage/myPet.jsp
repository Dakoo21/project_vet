<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Dashboard</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="../../iCheck/flat/blue.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="plugins/morris/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/sidebar.jsp"%>
<div class="wrapper">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                마이페이지
            </h1>
            <h3>
                나의 반려동물
            </h3>
        </section>


        <!-- Main content -->
        <section class="content">
    <%--리스트 테이블--%>
    <div class="box">

        <table class="table">
            <thead>
            <tr>
                <th>예약시설</th>
                <th>예약자</th>
                <th>환자명</th><!-- 고민 -->
                <th>예약시간</th>
                <th>취소</th>
            </tr>
            </thead>
            <tbody>
            <%--                <%
                                for(int i=0;i<size;i++){
                                    if(i==size) break;//NullPointerException방어
                                    Map<String,Object> rmap = rList.get(i);
                            %>--%>
            <tr>
                <%--                    <td><a href="javascript:roomDetail('<%=rmap.get("R_NO")%>')"><%=rmap.get("예약시설")%></td>
                                    <td><%=rmap.get("예약자")%></td>
                                    <td><%=rmap.get("환자명")%></td><!-- 고민 -->
                                    <td><%=rmap.get("예약시간")%></td>--%><td>예약시설</td>
                <td>예약자</td>
                <td>환자명</td>
                <td>예약시간</td>
                <td><button onclick="cancle()" id="cancle" title="cancle">취소</button></td>
            </tr>
            <%--          <%
                          }
                      %>--%>
            </tbody>
        </table>

        </section>
        <button onclick="newPet()" id="newPet" title="newPet">등록</button>
        <!-- /.content -->
    </div>
</div>
<!-- /.content-wrapper -->

<%@ include file="/include/footer.jsp"%>
</body>
</html>
