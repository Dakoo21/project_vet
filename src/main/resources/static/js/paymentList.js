

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

    // 온라인 결제 버튼 클릭 이벤트 리스너
    document.getElementById("onlinePaymentButton").addEventListener("click", function() {
        // 온라인 결제 페이지로 이동
        window.location.href = "onlinePay.jsp";
    });

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
                var cell0 = newRow.insertCell(0); // 체크박스를 위한 셀
                var cell1 = newRow.insertCell(1);
                var cell2 = newRow.insertCell(2);
                var cell3 = newRow.insertCell(3);
                var cell4 = newRow.insertCell(4);
                var cell5 = newRow.insertCell(5);

                // 체크박스 생성 및 설정
                var checkbox = document.createElement('input');
                checkbox.type = "checkbox";
                checkbox.value = productCode; // 체크박스의 값으로 상품 코드 설정
                cell0.appendChild(checkbox);

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
        document.getElementById("totalAmountValue").textContent = totalAmount;
    }
});

