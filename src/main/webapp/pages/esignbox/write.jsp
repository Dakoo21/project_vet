<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<head>
    <%@include file="/include/common/bootstrap_common.jsp"%>
    <style>
        table {
            margin: 0 auto; /* 가운데 정렬을 위해 왼쪽과 오른쪽 마진을 자동으로 설정합니다. */
            width: 80%; /* 표의 너비를 조절할 수 있습니다. */
            border-collapse: collapse; /* 셀의 테두리를 합쳐서 보이도록 설정합니다. */
        }
        th, td {
            border: 1px solid black; /* 각 셀의 테두리를 설정합니다. */
            padding: 8px; /* 셀의 안쪽 여백을 설정합니다. */
            text-align: center; /* 셀 내의 텍스트를 가운데 정렬합니다. */
        }
    </style>

</head>
<body>
<div id="contentwrite">
    <div id="modal">
        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#selectForm">검색</button>
    </div>
    <div>
        <form>
            <table>
                <thead>
                    <tr>
                        <td>재고명</td>
                        <td>입고가</td>
                        <td>입고수량</td>
                        <td>기타</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="text" value="주사기"></td>
                        <td><input type="text" value="10,000"></td>
                        <td><input type="text" value="100"></td>
                        <td><input type="text" value="기타"></td>
                    </tr>
                    <tr>
                        <td><input type="text" value=""></td>
                        <td><input type="text" value=""></td>
                        <td><input type="text" value=""></td>
                        <td><input type="text" value=""></td>
                    </tr>
                    <tr>
                        <td><input type="text" value=""></td>
                        <td><input type="text" value=""></td>
                        <td><input type="text" value=""></td>
                        <td><input type="text" value=""></td>
                    </tr>
                    <tr>
                        <td><input type="text" value=""></td>
                        <td><input type="text" value=""></td>
                        <td><input type="text" value=""></td>
                        <td><input type="text" value=""></td>
                    </tr>
                    <tr>
                        <td><input type="text" value=""></td>
                        <td><input type="text" value=""></td>
                        <td><input type="text" value=""></td>
                        <td><input type="text" value=""></td>
                    </tr>
                    <tr>
                        <td><input type="text" value=""></td>
                        <td><input type="text" value=""></td>
                        <td><input type="text" value=""></td>
                        <td><input type="text" value=""></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>

</div>
<div class="modal" id="selectForm">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">게시판</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <!-- <form id="f_board" method="get" action="./boardInsert"> -->
                <form id="f_board" method="post" enctype="multipart/form-data" action="./boardInsert">
                    <div class="col-6">
                        <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                               aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>
                    </div>
                    <div class="col-3">
                        <button id="btn_search" class="btn btn-danger" onClick="boardSearch()">검색</button>
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
</body>

