<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--<%@ include file="/include/session.jsp"%>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>전자결재</title>
    <%@ include file="/include/bootCommon.jsp"%>
    <%@ include file="/include/common/quill_common.jsp"%>
    <%--<%@include file="/include/common/bootstrap_common.jsp"%>--%>
    <%--<link rel="stylesheet" href="/css/style.css">--%>
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
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px; /* 모달 최대 너비 설정 */
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
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
                        <h1>기안서 작성</h1>
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
            <div class="card-body">
                <div class="content_title">
                    <fieldset style="max-width:90%;">
                        <span class="detail_select">
                            <a href="">기안하기</a>
                        </span>
                        <span class="detail_select">
                            <a href="">임시저장</a>
                        </span>
                    </fieldset>
                </div>
                <table class="table table-bordered">
                    <tr>
                        <th>문서 종류</th>
                        <td>
                            <input type="hidden" id="prevApprovalCategoryNo" value="6747">
                            <select name="approval_form_no" class="write-select" autocomplete="off">
                                <option value="">선택</option><option value="42768">지출 결의서</option><option value="42769">품의서</option><option value="42770">입양신청서</option>
                                <button class="weakblue" onclick="ApprovalDocument.getSelectApprovalForm();">문서보기</button>
                                <input type="hidden" id="prevApprovalFormNo" value="42771">
                                <input type="hidden" id="prevApprovalFormTitle" value="">
                            </select>
                        </td>
                        <th>작성자</th>
                        <td><%=username%></td>
                    </tr>
                    <tr>
                        <th scope="row">보존 연한</th>
                        <td>
                            <select name="preserved_term" class="fl write-select" id="set_preserved_term_y">
                                <option value="">보존 연한</option>
                                <option value="1">1년</option>
                                <option value="3">3년</option>
                                <option value="5">5년</option>
                                <option value="10">10년</option>
                                <option value="0">영구</option>
                            </select>
                            <span class="fl hide" id="set_preserved_term_n" style="display: none;">년</span>
                        </td>
                    </tr>
                </table>
                <div class="after" style="display: flex; align-items: center;">
                    <h4 class="fl mgr_20" style="margin-right: 10px;">결재선 선택 </h4>
                    <button id="addButtons">결재선 추가</button>
                </div>
                <table class="table table-bordered" id="myTable">
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
                                    <td class="team name" scope="row" id="cell1" >
<%--                                        <span class="stamp-step-num" id="cell1" style="display: inline"></span>--%>
                                    </td>
                                    <td class="team name" scope="row" id="cell2">
                                        <%--                                        <span class="stamp-step-num">관리자</span>--%>
                                    </td>
                                    <th></th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="stamp"></td>
                                    <td class="stamp"></td>
                                    <td class="stamp"></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="name gt-position-relative">
                                        <span class="stamp-step-num"><%=username%></span>
                                    </td>
                                    <td class="cell">
                                        <div class="after" style="display: flex; align-items: center;">
                                            <div id="modal1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cell">
                                        <div class="after" style="display: flex; align-items: center;">
                                        </div>
                                    </td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
                        </th>
                    </tr>
                    </thead>
                </table>
                <div id="drag_wrap">
                    <div id="drag" class="ui-draggable ui-draggable-handle" style="left:0px;"></div>
                </div>
                <div id="contents">
                    <form autocomplete="off" onsubmit="return false;">
                        <input type="submit" style="display:none;" onclick="return false;">
                        <div class="content_inbox">
                            <div class="cont_box write">
                                <div class="approval-wrap write">
                                    <div id="approvalDocumentLine">
                                        <%-- 이게 무슨용으로 만든 테이블인지 몰라서 일단 남겨놔요 --%>
                                        <table class="cal_table1 approve-write js-approval-line">
                                            <colgroup>
                                                <col style="width:12.09%;">
                                                <col style="width:37.62%;">
                                                <col style="width:9.02%;">
                                                <col style="width:41.27%;">
                                            </colgroup>
                                        </table>
                                    </div>
                                    <div id="textarea" style="width: 100%;">
                                        <div class="form-group">
                                            <label>제목</label>
                                            <input type="text" class="form-control" placeholder="제목을 입력하세요">
                                        </div>
                                        <div class="col-md-12" style="width: 100%">
                                            <!-- /.card-header -->
                                            <div class="card-body">
                                                <textarea id="summernote">
                                                    Place <em>some</em> <u>text</u> <strong>here</strong>
                                                </textarea>
                                            </div>
                                        </div>
                                        <!-- /.col-->
                                        <div id="writein">
                                            <%@include file="write.jsp"%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- Summernote -->
    <script src="/plugins/summernote/summernote-bs4.min.js"></script>
    <!--footer-->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp"%>
<!-- CodeMirror -->
<script src="/plugins/codemirror/codemirror.js"></script>
<script src="/plugins/codemirror/mode/css/css.js"></script>
<script src="/plugins/codemirror/mode/xml/xml.js"></script>
<script src="/plugins/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<!-- 모달 내용 -->
<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">라디오 버튼 선택</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="userForm">
                    <!-- 사용자 목록을 표시할 위치 -->
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="confirmButton">확인</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(document).ready(function() {
        // Summernote
        $('#summernote').summernote(
            {
                height: 300,
                minHeight: null,
                maxHeight: null,
                focus: true,
                lang: "ko-KR",
                placeholder: '최대 2048자까지 쓸 수 있습니다'
            });
        // CodeMirror
        CodeMirror.fromTextArea(document.getElementById("codeMirrorDemo"), {
            mode: "htmlmixed",
            theme: "monokai"
        });
    })
</script>
<script>
    $(document).ready(function () {
        $("#openModalBtn").click(function () {
            $.ajax({
                url: "/eSignDraft/selectLine",
                method: "GET",
                success: function (members) {
                    var form = $("#membersForm");
                    form.empty();
                    members.forEach(function (member) {
                        form.append('<label><input type="radio" name="member" value="' + member.id + '">' + member.name + '</label><br>');
                    });
                    $("#myModal").css("display", "block");
                }
            });
        });
        $("#closeModalBtn").click(function () {
            $("#myModal").css("display", "none");
        });
        $("#submitBtn").click(function () {
            // 선택된 멤버 값 가져오기
            var selectedMemberId = $('input[name=member]:checked').val();
            var selectedMemberName = $('input[name=member]:checked').next().text();
            // 선택된 멤버의 값을 사용하여 원하는 동작 수행
            console.log("Selected Member ID: " + selectedMemberId);
            console.log("Selected Member Name: " + selectedMemberName);
            // 모달 창 닫기
            $("#myModal").css("display", "none");
        });
    });
</script>
<!-- 추가된버튼 -->
<script>
    $(document).ready(function() {
        // 현재 선택된 셀을 저장하는 변수
        var selectedCell;

        // 버튼을 클릭했을 때의 동작을 정의합니다.
        $('#addButtons').on('click', function() {
            // 테이블의 각 셀에 대해 반복합니다.
            $('#myTable .cell').each(function(index) {
                // 현재 셀에 버튼이 이미 생성되어 있는지 확인합니다.
                if ($(this).children('.dynamicButton').length === 0) {
                    // 현재 셀에 새로운 버튼을 생성합니다.
                    var newButton = $('<button>', {
                        text: '버튼',
                        class: 'dynamicButton btn btn-primary',
                        // 모달을 띄우기 위한 이벤트를 추가합니다.
                        click: function() {
                            // 현재 선택된 셀 저장
                            selectedCell = this;
                            // 모달을 띄웁니다.
                            loadUserListAndShowModal();
                        }
                    });
                    // 현재 셀에 생성한 버튼을 추가합니다.
                    $(this).append(newButton);
                    // 한 번에 한 개의 버튼만 생성되도록 하기 위해 각 셀에 대한 반복을 종료합니다.
                    return false;
                }
            });
        });

        // 모달에서 확인 버튼을 눌렀을 때의 동작
        function confirmSelection() {
            // 모달에서 선택한 라디오 버튼의 값을 가져옴
            var selectedValue = $("input[name='userRadio']:checked").val();

            // 선택한 라디오 버튼의 값을 현재 선택된 셀에 버튼 대신 텍스트로 대체
            if (selectedCell) {
                $(selectedCell).children('.dynamicButton').hide();
                // 새로운 버튼 대신 텍스트로 대체
                var newText = $('<span>', {
                    text: selectedValue
                });
                $(selectedCell).empty().append(newText);
            }

            // 선택한 라디오 버튼의 값이 "토마토"인 경우 1행 1열에 "관리자" 텍스트 추가
            if (selectedValue === "토마토" && selectedCell) {
                // idSpan.style.display = 'none';
                // $(selectedCell).children('.dynamicButton').hide();
            }
            // 선택한 라디오 버튼의 값이 "토마토"인 경우 1행 1열에 "관리자" 텍스트 추가
            if (selectedValue === "사과" && selectedCell) {
                $('#cell2').text('원장');
            }
            // 모달 닫기
            // 선택한 라디오 버튼의 값을 서버로 전송
            if (selectedValue) {
                $.ajax({
                    type: 'POST',  // 또는 'GET'에 따라서 서버 요청 방식 선택
                    url: '/eSignDraft/submitSelectedValue',  // 컨트롤러의 URL
                    data: { selectedValue: selectedValue },  // 전송할 데이터
                    success: function(response) {
                        console.log('전송 성공:', response);
                    },
                    error: function(error) {
                        console.error('전송 실패:', error);
                    }
                });
            }
            $('#myModal').modal('hide');
        }

        // 모달에 사용자 목록을 불러와서 표시하는 함수
        function loadUserListAndShowModal() {
            // AJAX를 통해 서버에서 사용자 목록을 가져옵니다.
            $.ajax({
                type: 'GET',
                url: '/eSignDraft/selectLine',
                success: function(data) {
                    // 성공적으로 데이터를 받아왔을 때 모달 창에 라디오 버튼을 추가합니다.
                    var form = $('#userForm');
                    form.empty(); // 기존의 내용을 비웁니다.

                    for (var i = 0; i < data.length; i++) {
                        var user = data[i];
                        console.log(data[i]);
                        console.log('User Name:', user.member_MEMBERNAME); // 확인용 로그

                        // Member 클래스의 인스턴스가 아닌 경우 직접 속성에 접근
                        var memberName = (user && user.member_MEMBERNAME) ? user.member_MEMBERNAME : 'Unknown';

                        var radioButton = $('<input>', {
                            type: 'radio',
                            name: 'userRadio',
                            value: memberName,
                            id: 'userRadio' + user.member_PK
                        });
                        var label = $('<label>', {
                            text: memberName,
                            for: 'userRadio' + user.member_PK
                        });
                        form.append(radioButton, label, '<br>');
                    }

                    // 모달에 확인 버튼 클릭 시 실행할 함수를 설정
                    $('#myModal .btn-primary').off('click').on('click', function() {
                        confirmSelection();
                        // 추가로 확인 버튼 클릭 시 실행할 코드를 넣을 수 있습니다.
                        // 예: 다른 작업 수행, 서버로 전송 등
                    });

                    // 모달을 띄웁니다.
                    $('#myModal').modal('show');
                },
                error: function() {
                    // 에러가 발생했을 때의 처리를 여기에 추가할 수 있습니다.
                }
            });
        }
    });
</script>
