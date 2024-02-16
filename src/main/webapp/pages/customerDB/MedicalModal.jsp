<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>약 처방하기</title>
</head>
<body>
<div class="modal" id="selectForm">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
                <script src="   https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                <h4 class="modal-title">약 처방하기</h4>
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
                    <div>
                        <form>
                            <table>
                                <thead>
                                <tr>
                                    <td>제품명</td>
                                    <td>제품영문명</td>
                                    <td>업체명</td>
                                    <td>품목코드</td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input type="text" value="지디 콴텔"></td>
                                    <td><input type="text" value="GD-Quantel"></td>
                                    <td><input type="text" value="(주)우성양행"></td>
                                    <td><input type="text" value="A00200N0098"></td>
                                </tr>
                                <tr>
                                    <td><input type="text" value="팜팜-1000"></td>
                                    <td><input type="text" value="Farmfarm-1000"></td>
                                    <td><input type="text" value="(주)우성양행"></td>
                                    <td><input type="text" value="B00200N0104"></td>
                                </tr>
                                <tr>
                                    <td><input type="text" value="밀베마이신A정"></td>
                                    <td><input type="text" value="Milbemycin"></td>
                                    <td><input type="text" value="한국엘랑코동물약품(주)"></td>
                                    <td><input type="text" value="A11110N0036"></td>
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
</html>
