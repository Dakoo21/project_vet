<%@ page import="com.example.vet.model.SignTotal" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    SignTotal signTotal = (SignTotal) request.getAttribute("eSignDetail");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
    <%@include file="/include/common/bootstrap_common.jsp"%>
    <%@ include file="/include/bootCommon.jsp"%>
    <%@include file="/include/common/quill_common.jsp"%>
    <style>
        .gray-background {
            background-color: #f0f0f0;
        }

        .white-background {
            background-color: #ffffff;
        }

        .centered-text {
            text-align: center;
        }
        .table-bordered th,
        .table-bordered td {
            padding: 5px;
        }
        .stamp {
            width: 120px;
            height: 120px;
        }
        .team.name,
        .team.position {
            max-height: 50px;
            overflow: hidden;
        }
    </style>
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
                        <h1>기안서</h1>
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
            <div class="card-body">
                <div class="content_title">
                    <fieldset style="max-width:90%;">
                        <span>기안서</span>
                    </fieldset>
                </div>
                <table class="table table-bordered">
                    <tr>
                        <th>문서 종류</th>
                        <td>지출결의서</td>
                        <th>작성자</th>
                        <td>김엘모</td>
                    </tr>
                    <tr>
                        <th scope="row">문서번호</th>
                        <td><%=signTotal.getSIGN_PK()%></td>
                        <th>보존연한</th>
                        <td><%=signTotal.getSIGN_RESERV_YEAR()%></td>
                    </tr>
                </table>
                <div class="after" style="display: flex; align-items: center;">
                    <h4 class="fl mgr_20" style="margin-right: 10px;">결재선</h4>
                </div>
                <%
                    if(role1.equals("ROLE_MASTER")){
                %>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="row" class="gray-background centered-text sign">
                                <div style="vertical-align: middle;">
                                    결재
                                </div>
                            </th>
                            <th class="white-background">
                                <table id="결재선" class="table table-bordered">
                                    <thead>
                                    <tr style="height: 20px;">
                                        <td class="team name" scope="row">
                                            <span class="stamp-step-num">사원</span>
                                        </td>
                                        <td class="team name" scope="row">
                                            <span class="stamp-step-num">부원장</span>
                                        </td>
                                        <td class="team name" scope="row">
                                            <span class="stamp-step-num">원장</span>
                                        </td>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="stamp">
                                            <img src="/img/img.png">
                                        </td>
                                        <td class="stamp">
                                            <%
                                                if(signTotal.getLV_2().equals(1)){
                                            %>
                                            <div id="modal">
                                                <img src="/img/img.png">
                                            </div>
                                            <%
                                                }
                                            %>
                                        </td>
                                        <td class="stamp">
                                            <% if(role1.equals("ROLE_ADMIN") && signTotal.getLV_2().equals(1)){
                                            %>
                                            <div id="modal1">
                                                <img id="approvalImage" src="/img/img.png" style="display: none;">
                                                <button type="button" class="btn btn-block btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#selectForm">
                                                    결재
                                                </button>
                                            </div>
                                            <%
                                                }
                                            %>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>김엘모</td>
                                        <td class="name gt-position-relative">
                                            <span class="stamp-step-num"></span>대표이사
                                        </td>
                                        <td class="name gt-position-relative">
                                            <span class="stamp-step-num"></span>대표이사
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </th>
                        </tr>
                    </thead>
                </table>
                <%
                    }
                %>
                <%
                    if(role1.equals("ROLE_ADMIN")){
                %>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th scope="row" class="gray-background centered-text sign">
                            <div style="vertical-align: middle;">
                                결재
                            </div>
                        </th>
                        <th class="white-background">
                            <table id="결재선" class="table table-bordered">
                                <thead>
                                <tr style="height: 20px;">
                                    <td class="team name" scope="row">
                                        <span class="stamp-step-num">사원</span>
                                    </td>
                                    <td class="team name" scope="row">
                                        <span class="stamp-step-num">부원장</span>
                                    </td>
                                    <td class="team name" scope="row">
                                        <span class="stamp-step-num">원장</span>
                                    </td>
                                    <th></th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="stamp">
                                        <img src="/img/img.png">
                                    </td>
                                    <td class="stamp">
                                        <%
                                            if(signTotal.getLV_2().equals(1)){
                                        %>
                                        <div id="modal">
                                            <img src="/img/img.png">
                                        </div>
                                        <%
                                            }
                                        %>
                                    </td>
                                    <td class="stamp">
                                        <% if(role1.equals("ROLE_ADMIN") && signTotal.getLV_2().equals(1)){
                                        %>
                                        <div id="modal1">
                                            <img id="approvalImage" src="/img/img.png" style="display: none;">
                                            <button type="button" class="btn btn-block btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#selectForm">
                                                결재
                                            </button>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>김엘모</td>
                                    <td class="name gt-position-relative">
                                        <span class="stamp-step-num"></span>대표이사
                                    </td>
                                    <td class="name gt-position-relative">
                                        <span class="stamp-step-num"></span>대표이사
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </th>
                    </tr>
                    </thead>
                </table>
                <%
                    }
                %>
            </div>
            <div class='book-header'>

                <div class="input-group mb-3">
                    <span class="board-title"><%=signTotal.getSIGN_TITLE()%>></span>
                </div>
                <div class="input-group mb-3">
                    <div class="board-content">
                        <%=signTotal.getSIGN_CONTENT()%>
                    </div>
                </div>
                <%@include file="selectAdoptDraft.jsp"%>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
<!-- 결재 승인/반려 모달-->
<div class="modal" id="selectForm">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">결재</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <!-- <form id="f_board" method="get" action="./boardInsert"> -->
                <form id="f_board" method="post" enctype="multipart/form-data" action="./boardInsert">
                    <div class="form-floating mb-3 mt-3">
                        <input type="radio" name="approvalStatus" value="accept" checked>승인
                        <input type="radio" name="approvalStatus" value="reject">반려
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-warning" data-bs-dismiss="modal" onclick="boardInsert()"  value="선택">
                <input type="button" class="btn btn-danger" data-bs-dismiss="modal" value="닫기">
            </div>
        </div>
    </div>
</div>
<!--footer-->
<%@ include file="/include/footer.jsp"%>
</body>
</html>

<script>
    // 모달이 닫힐 때 이벤트 처리
    $('#selectForm').on('hidden.bs.modal', function () {
        // 라디오 버튼의 선택 값을 가져오기
        var selectedValue = $('input[name="approvalStatus"]:checked').val();

        // 선택된 값에 따라 동작 수행
        if (selectedValue === 'accept') {
            // 기안일 때의 동작
            // 이미지 표시 및 버튼 숨김
            $('#approvalButton').hide();
            $('#approvalImage').show();

            // 비동기 처리 - LV_2 컬럼 값을 1로 업데이트
            updateLV2Column();
        } else if (selectedValue === 'reject') {
            // 반려일 때의 동작
            // 기안 이미지 숨김 및 버튼 표시
            $('#approvalButton').show();
            $('#approvalImage').hide();
        }
    });

    // 결재 버튼 클릭 이벤트 처리
    function boardInsert() {
        // 선택된 라디오 버튼 값 가져오기
        var selectedValue = $('input[name="approvalStatus"]:checked').val();

        // 선택된 값에 따라 동작 수행
        if (selectedValue === 'accept') {
            // 기안일 때의 동작
            // 이미지 표시 및 버튼 숨김
            $('#approvalButton').hide();
            $('#approvalImage').show();

            // 비동기 처리 - LV_2 컬럼 값을 1로 업데이트
            updateLV2Column();
        } else if (selectedValue === 'reject') {
            // 반려일 때의 동작
            // 기안 이미지 숨김 및 버튼 표시
            $('#approvalButton').show();
            $('#approvalImage').hide();
        }

        // 모달 닫기
        $('#selectForm').modal('hide');
    }

    // LV_2 컬럼 값을 1로 업데이트하는 함수
    function updateLV2Column() {
        // AJAX를 사용하여 서버에 업데이트 요청
        $.ajax({
            type: 'POST',
            url: '/eSignDraft/lv2Update', // 실제 업데이트를 수행하는 서버 엔드포인트
            data: {
                signPk: <%= signTotal.getSIGN_PK() %>
            },
            success: function(response) {
                console.log('LV_2 업데이트 성공:', response);
                // 업데이트 성공시 추가적인 작업 수행 가능
            },
            error: function(error) {
                console.error('LV_2 업데이트 실패:', error);
                // 업데이트 실패시 추가적인 작업 수행 가능
            }
        });
    }
</script>
