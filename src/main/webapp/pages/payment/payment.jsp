<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
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
            <%-- 조건검색 시작 --%>
            <div class="row">

                <%-- 구분 선택 --%>
                <div class="col-md-2">
                    <label>구분</label>
                    <select id="gubun" class="form-select" aria-label="분류선택">
                        <option value="none">전체</option>
                        <option value="stock_common_pk">용품</option>
                        <option value="stock_common_pk">식품</option>
                        <option value="drug_pk">약품</option>
                    </select>
                </div>

                <%-- 상품코드 검색 --%>
                <div class="col-md-3">
                    <label for="mCode_search">상품코드</label>
                    <input type="text" id="mCode_search" class="form-control" placeholder="상품코드를 입력하세요"
                           aria-describedby="btn_search" onkeyup="searchEnter('mCode')"/>
                    <div id="mCode_searchResults"></div> <!-- 검색 결과가 표시될 영역 -->
                </div>

                <%-- 상품명 검색 --%>
                <div class="col-md-4">
                    <label for="mName_search">상품명</label>
                    <input type="text" id="mName_search" class="form-control" placeholder="상품명을 입력하세요"
                           aria-describedby="btn_search" onkeyup="searchEnter('mName')"/>
                    <div id="mName_searchResults"></div> <!-- 검색 결과가 표시될 영역 -->
                </div>

                <div class="col-1">
                    <button id="btn_search" class="btn btn-outline-dark" onClick="mSearch()">검색</button>
                </div>

                <script>
                    function searchEnter(field) {
                        // 검색어 입력 필드에서 값을 가져옴
                        var keyword = "";
                        if (field === 'mCode') {
                            keyword = document.getElementById("mCode_search").value;
                            var searchResultsDiv = document.getElementById("mCode_searchResults");
                            searchResultsDiv.innerHTML = "상품 코드: " + keyword;
                        } else if (field === 'mName') {
                            keyword = document.getElementById("mName_search").value;
                            var searchResultsDiv = document.getElementById("mName_searchResults");
                            searchResultsDiv.innerHTML = "상품명: " + keyword;
                        }
                    }
                </script>
            </div> <%-- 조건검색 끝 --%>

            <%-- 정렬검색 시작 --%>
            <div class="array">

                <%-- 상품 정렬 --%>
                <div><%-- 페이지 크기 선택 드롭다운 메뉴 --%>
                    <form action="YourServletOrAction" method="get">
                        <select name="pageArray" id="pageArray">
                            <option value="10">상품명(ㄱ~ㄷ) ▼ </option>
                            <option value="20">상품명(ㄱ~ㄷ) ▲</option>
                            <option value="10">재고량 ▼ </option>
                            <option value="20">재고량 ▲</option>
                        </select>
                        <input type="submit" value="적용">
                    </form>
                </div>
                <%-- 상품 정렬 끝 --%>

                <%-- 페이지 10개씩 보기 옵션 --%>
                <%--<div class="col-md-10"></div>--%> <!-- 왼쪽 공간을 비움 -->
                <div class="col-md-2 d-flex justify-content-end"> <!-- 오른쪽 버튼을 가장 오른쪽에 배치 -->
                    <%-- 페이지 크기 선택 드롭다운 메뉴 --%>
                    <form action="YourServletOrAction" method="get">
                        <select name="pageSize" id="pageSize">
                            <option value="10">20개씩 보기</option>
                            <option value="20">30개씩 보기</option>
                            <option value="30">50개씩 보기</option>
                        </select>
                        <input type="submit" value="적용">
                    </form>
                </div>  <%-- 페이지 10개씩 보기 끝 --%>
                <%--</div>--%> <%-- 정렬검색 끝 --%>

                <!-- 공지사항 목록 -->
                <div class="box">
                    <%--<div class="box-header with-border">
                        <h3 class="box-title">공지사항 목록</h3>
                    </div>--%>

                    <!-- 결제페이지 목록 테이블 -->
                    <div class="payment-list">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th width="5%" style="text-align: center;"><input type="checkbox" id="selectAll"></th>
                                <th width="10%" style="text-align: center;">상품코드</th>
                                <th width="10%" style="text-align: center;">구분</th>
                                <th width="10%" style="text-align: center;">이미지</th>
                                <th width="30%" style="text-align: center;">상품명</th>
                                <th width="10%" style="text-align: center;">재고량</th>
                                <th width="10%" style="text-align: center;">선택량</th>
                                <th width="10%" style="text-align: center;">금액</th>
                                <th width="5%" style="text-align: center;"></th>
                            </tr>
                            </thead>

                            <%-- 게시물 리스트 --%>
                            <tbody>
                            <tr>
                                <td class="center-align"><input type="checkbox" class="itemCheckbox"></td>
                                <td class="center-align">AAAA001</td>
                                <td class="center-align">용품</td>
                                <td class="center-align">
                                    <img src="/static/css/dentaltoothpaste.jpeg" alt="덴탈 솔루션 치약" class="thumbnail-image">
                                </td>
                                <td>덴탈 솔루션 치약(멜론)</td>
                                <td class="center-align">5</td>
                                <td class="center-align">0</td>
                                <td class="center-align">14,900</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="center-align"><input type="checkbox" class="itemCheckbox"></td>
                                <td class="center-align">AAAA002</td>
                                <td class="center-align">용품</td>
                                <td class="center-align">
                                    <img src="/static/css/dentaltoothpaste.jpeg" alt="덴탈 솔루션 치약" class="thumbnail-image">
                                </td>
                                <td style="text-align: left;">덴탈 솔루션 치약(고구마)</td>
                                <td class="center-align">3</td>
                                <td class="center-align">0</td>
                                <td class="center-align">14,900</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="center-align"><input type="checkbox" class="itemCheckbox"></td>
                                <td class="center-align">AAAA003</td>
                                <td class="center-align">식품</td>
                                <td class="center-align"></td>
                                <td style="text-align: left;">불리츄 M</td>
                                <td class="center-align">15</td>
                                <td class="center-align">0</td>
                                <td class="center-align">16,900</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="center-align"><input type="checkbox" class="itemCheckbox"></td>
                                <td class="center-align">AAAA004</td>
                                <td class="center-align">식품</td>
                                <td class="center-align"></td>
                                <td style="text-align: left;">불리츄 S</td>
                                <td class="center-align">12</td>
                                <td class="center-align">0</td>
                                <td class="center-align">12,900</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="center-align"><input type="checkbox" class="itemCheckbox"></td>
                                <td class="center-align">AAAA005</td>
                                <td class="center-align">용품</td>
                                <td class="center-align"></td>
                                <td style="text-align: left;">힐링 브러쉬</td>
                                <td class="center-align">17</td>
                                <td class="center-align">0</td>
                                <td class="center-align">18,900</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="center-align"><input type="checkbox" class="itemCheckbox"></td>
                                <td class="center-align">AAAA006</td>
                                <td class="center-align">용품</td>
                                <td class="center-align"></td>
                                <td style="text-align: left;">스마일 패드(소형)</td>
                                <td class="center-align">22</td>
                                <td class="center-align">0</td>
                                <td class="center-align">12,900</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="center-align"><input type="checkbox" class="itemCheckbox"></td>
                                <td class="center-align">AAAA007</td>
                                <td class="center-align">용품</td>
                                <td class="center-align"></td>
                                <td style="text-align: left;">스마일 패드(대형)</td>
                                <td class="center-align">45</td>
                                <td class="center-align">0</td>
                                <td class="center-align">22,900</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="center-align"><input type="checkbox" class="itemCheckbox"></td>
                                <td class="center-align">AAAA008</td>
                                <td class="center-align">식품</td>
                                <td class="center-align"></td>
                                <td style="text-align: left;">크럼블 프리 카사바(1L)</td>
                                <td class="center-align">0</td>
                                <td class="center-align">0</td>
                                <td class="center-align">6,000</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="center-align"><input type="checkbox" class="itemCheckbox"></td>
                                <td class="center-align">AAAA009</td>
                                <td class="center-align">식품</td>
                                <td class="center-align"></td>
                                <td style="text-align: left;">크럼블 프리 카사바(6L)</td>
                                <td class="center-align">5</td>
                                <td class="center-align">0</td>
                                <td class="center-align">33,900</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="center-align"><input type="checkbox" class="itemCheckbox"></td>
                                <td class="center-align">AAAA010</td>
                                <td class="center-align">용품</td>
                                <td class="center-align"></td>
                                <td style="text-align: left;">2-WAY 웜테크 리버시블 패딩(레몬,L)</td>
                                <td class="center-align">0</td>
                                <td class="center-align">0</td>
                                <td class="center-align">69,900</td>
                                <td></td>
                            </tr>

                            <script>
                                // 페이지 로드 후 실행되는 함수
                                document.addEventListener("DOMContentLoaded", function() {
                                    // 모든 행을 선택합니다.
                                    var rows = document.querySelectorAll("tbody tr");

                                    // 각 행에 대해 반복합니다.
                                    rows.forEach(function(row) {
                                        // 마지막 열을 선택합니다.
                                        var lastCell = row.cells[row.cells.length - 1];

                                        // 버튼을 생성합니다.
                                        var button = document.createElement("button");
                                        button.className = "addToCartButton";
                                        button.textContent = "담기";
                                        button.onclick = function() {
                                            addToCart();
                                        };

                                        // 버튼을 열에 추가합니다.
                                        lastCell.appendChild(button);
                                    });
                                });

                                // 장바구니에 상품 추가하는 함수
                                function addToCart() {
                                    // 장바구니에 상품을 추가하는 로직을 여기에 추가하세요.
                                    console.log("상품이 장바구니에 추가되었습니다.");
                                }
                            </script>

                            <tfoot>
                            <tr>
                                <td colspan="8" style="text-align: right;">
                                    <button onclick="addToCart()">선택 담기</button>
                                </td>
                            </tr>
                            </tfoot>

<%--                            &lt;%&ndash; 페이징 처리 &ndash;%&gt;--%>
<%--                            <%--%>
<%--                                for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){--%>
<%--                                    if(i == size) break;--%>
<%--                                    Map<String,Object> rmap = nList.get(i);--%>
<%--                            %>--%>

<%--                            <tr>--%>
<%--                                <td><%=rmap.get("N_NO") %></td>--%>
<%--                                <td>--%>
<%--                                    <a href="javascript:noticeDetail('<%=rmap.get("N_NO")%>')"><%=rmap.get("N_TITLE") %></a>--%>
<%--                                </td>--%>
<%--                                <td><%=rmap.get("N_WRITER") %></td>--%>
<%--                            </tr>--%>
<%--                            <%--%>
<%--                                }--%>
<%--                            %>--%>
                            </tbody>

                        </table>
                    </div>
                    <script>
                        document.addEventListener("DOMContentLoaded", function() {
                            // 모든 담기 버튼을 선택합니다.
                            var addToCartButtons = document.querySelectorAll(".addToCartButton");

                            // 결제할 상품 리스트의 테이블을 선택합니다.
                            var paymentTable = document.getElementById("paymentTable").querySelector("tbody");

                            // 각 담기 버튼에 대해 반복합니다.
                            addToCartButtons.forEach(function(button) {
                                // 담기 버튼을 클릭했을 때 실행될 함수를 설정합니다.
                                button.addEventListener("click", function() {
                                    // 해당 행의 데이터를 가져옵니다.
                                    var row = button.closest("tr");
                                    var quantityCell = row.cells[6]; // 선택량이 표시되는 셀
                                    var currentQuantity = parseInt(quantityCell.textContent); // 현재 선택량
                                    var newQuantity = currentQuantity + 1; // 새로운 선택량

                                    // 선택량을 업데이트합니다.
                                    quantityCell.textContent = newQuantity;

                                    // 해당 행의 재고량을 가져옵니다.
                                    var stockCell = row.cells[5]; // 재고량이 표시되는 셀
                                    var currentStock = parseInt(stockCell.textContent); // 현재 재고량
                                    var newStock = currentStock - 1; // 새로운 재고량

                                    // 재고량을 업데이트합니다.
                                    stockCell.textContent = newStock;

                                    // 해당 행의 데이터를 가져옵니다.
                                    var productCode = row.cells[1].innerText;
                                    var category = row.cells[2].innerText;
                                    var productName = row.cells[4].innerText;
                                    var amount = row.cells[7].innerText;

                                    // 결제할 상품 리스트로 데이터를 복사합니다.
                                    var existingProductRow = null;

                                    // 이미 결제할 상품 리스트에 있는지 확인합니다.
                                    paymentTable.querySelectorAll("tr").forEach(function(paymentRow) {
                                        if (paymentRow.cells[0].innerText === productCode) {
                                            existingProductRow = paymentRow;
                                        }
                                    });

                                    if (existingProductRow) {
                                        // 이미 결제할 상품 리스트에 있는 경우 선택 수량만 증가시킵니다.
                                        var existingQuantityCell = existingProductRow.cells[3];
                                        var existingQuantity = parseInt(existingQuantityCell.textContent);
                                        existingQuantityCell.textContent = existingQuantity + 1;
                                    } else {
                                        // 결제할 상품 리스트에 추가합니다.
                                        var newRow = paymentTable.insertRow();
                                        var cell1 = newRow.insertCell(0);
                                        var cell2 = newRow.insertCell(1);
                                        var cell3 = newRow.insertCell(2);
                                        var cell4 = newRow.insertCell(3);
                                        var cell5 = newRow.insertCell(4);

                                        cell1.textContent = productCode;
                                        cell2.textContent = category;
                                        cell3.textContent = productName;
                                        cell4.textContent = 1; // 선택 수량
                                        cell5.textContent = amount;
                                    }

                                    // 총 금액을 업데이트합니다.
                                    updateTotalAmount();
                                });
                            });

                            // 결제할 상품 리스트의 총 금액을 표시할 요소를 선택합니다.
                            var totalAmountElement = document.getElementById("totalAmount");

                            // 결제할 상품 리스트의 총 금액을 초기화합니다.
                            var totalAmount = 0;

                            // 합계를 업데이트합니다.
                            function updateTotalAmount() {
                                // 모든 결제할 상품의 금액을 합산합니다.
                                var items = paymentTable.querySelectorAll("tr");
                                totalAmount = 0;
                                items.forEach(function(item) {
                                    totalAmount += parseInt(item.cells[3].textContent) * parseInt(item.cells[4].textContent);
                                });

                                // 합계를 표시합니다.
                                totalAmountElement.textContent = totalAmount;
                            }
                        });
                    </script>

                    <!-- 결제할 상품 리스트를 보여줄 테이블 -->
                    <div id="sidebar2">
                        <h2>결제할 상품</h2>
                        <table id="paymentTable" class="table table-hover">
                            <thead>
                            <tr>
                                <th>상품코드</th>
                                <th>구분</th>
                                <th>상품명</th>
                                <th>수량</th>
                                <th>금액</th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- 여기에 데이터가 추가될 것입니다. -->
                            </tbody>
                        </table>

                        <!-- 하단 버튼 -->
                        <div class="stock-footer">
                            <button type="button" class="btn btn-outline-warning">온라인결제</button>&nbsp;
                            <button type="button" class="btn btn-outline-success">현금결제</button>
                        </div>
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
<%@ include file="/include/bootCommonFoot.jsp"%>
</body>
</html>

