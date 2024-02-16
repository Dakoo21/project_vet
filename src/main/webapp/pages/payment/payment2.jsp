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
                                <td class="center-align">1</td>
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
                                <td class="center-align">1</td>
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
                                <td class="center-align">1</td>
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
                                <td class="center-align">1</td>
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
                                <td class="center-align">1</td>
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

                            <%-- 페이징 처리 --%>
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
<!-- 오른쪽 사이드바 영역 -->
<div id="sidebar">
    <h2>담은 상품</h2>
    <ul id="cartItems">
        <!-- 여기에 동적으로 상품이 추가될 것입니다. -->
    </ul>
</div>

<script>
    // 서버에서 가져온 상품 데이터
    var cartProducts = [
        { id: 1, image: "product1.jpg", name: "Product 1", price: 10000, quantity: 1 },
        { id: 2, image: "product2.jpg", name: "Product 2", price: 20000, quantity: 2 }
        // 가져온 상품 데이터를 서버에서 받아와서 이곳에 넣습니다.
    ];

    // 상품 목록을 동적으로 생성하여 사이드바에 추가하는 함수
    function renderCartItems() {
        var cartItemsElement = document.getElementById("cartItems");
        cartItemsElement.innerHTML = ""; // 기존에 있던 내용을 비웁니다.

        cartProducts.forEach(function(product) {
            var listItem = document.createElement("li");
            listItem.innerHTML = `
                <img src="/static/images/${product.image}" alt="${product.name}">
                <div>
                    <h3>${product.name}</h3>
                    <p>가격: ${product.price}원</p>
                    <p>수량: ${product.quantity}</p>
                </div>
            `;
            cartItemsElement.appendChild(listItem);
        });
    }

    // 페이지 로드 시 상품 목록을 생성하여 사이드바에 표시합니다.
    window.onload = function() {
        renderCartItems();
    };
</script>

<%-- 하단 버튼 --%>
<div class='notice-footer'>
    <div class="col-md-10"></div> <!-- 왼쪽 공간을 비움 -->
    <div class="col-md-2 d-flex justify-content-end"> <!-- 오른쪽 버튼을 가장 오른쪽에 배치 -->
        <button type="button" class="btn btn-outline-warning">온라인결제</button>&nbsp;
        <button type="button" class="btn btn-outline-success">현금결제</button>
    </div>
</div>
<%@ include file="/include/bootCommonFoot.jsp"%>
</body>
</html>

