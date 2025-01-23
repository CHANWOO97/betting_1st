// 구매 내역 저장 배열
let purchaseList = [];

// 버튼 클릭 시 구매 내역 추가 함수
function addToPurchaseList(gameId, teamInfo, betType, odds) {
    const isDuplicate = purchaseList.some(item => item.gameId === gameId);

    if (isDuplicate) {
        alert("이미 추가된 게임입니다.");
        return;
    }

    const bet = {
        gameId: gameId, // 경기 ID
        teamInfo: teamInfo,
        betType: betType,
        odds: odds
    };

    purchaseList.push(bet);
    renderPurchaseList();
}

// 구매 내역 렌더링 함수
function renderPurchaseList() {
    const purchaseBox = document.querySelector(".purchase-box ul");
    purchaseBox.innerHTML = "";

    if (purchaseList.length === 0) {
        purchaseBox.innerHTML = "<li>현재 구매 내역이 없습니다.</li>";
    } else {
        purchaseList.forEach((bet, index) => {
            purchaseBox.innerHTML += `
                <li>
                    ${bet.teamInfo} - ${bet.betType} (x ${bet.odds})
                    <button onclick="removeFromPurchaseList(${index})">삭제</button>
                </li>
            `;
        });

        if (!document.querySelector(".confirm-btn")) {
            const confirmButton = document.createElement("button");
            confirmButton.textContent = "장바구니로 이동";
            confirmButton.className = "confirm-btn";
            confirmButton.onclick = moveToCart;
            document.querySelector(".purchase-box").appendChild(confirmButton);
        }
    }
}

// 구매 내역에서 항목 삭제
function removeFromPurchaseList(index) {
    purchaseList.splice(index, 1);
    renderPurchaseList();
}

// 구매 내역 -> 장바구니 이동
function moveToCart() {
    if (purchaseList.length === 0) {
        alert("구매 내역이 비어 있습니다.");
        return;
    }

    const cartList = document.querySelector(".cart-box ul");
    cartList.innerHTML = "";

    purchaseList.forEach(bet => {
        cartList.innerHTML += `
            <li>${bet.teamInfo} - ${bet.betType} (x ${bet.odds})</li>
        `;
    });

    purchaseList = []; // 초기화
    renderPurchaseList();

    const cartBox = document.querySelector(".cart-box");
    if (!document.querySelector(".purchase-btn")) {
        const purchaseButton = document.createElement("button");
        purchaseButton.textContent = "구매하기";
        purchaseButton.className = "purchase-btn";
        purchaseButton.onclick = moveToSaleForm;
        cartBox.appendChild(purchaseButton);
    }

    if (!document.querySelector(".cancel-btn")) {
        const cancelButton = document.createElement("button");
        cancelButton.textContent = "취소하기";
        cancelButton.className = "cancel-btn";
        cancelButton.onclick = clearCart;
        cartBox.appendChild(cancelButton);
    }
}

// 장바구니 초기화
function clearCart() {
    const cartList = document.querySelector(".cart-box ul");
    cartList.innerHTML = "<li>장바구니가 비어 있습니다.</li>";

    const purchaseButton = document.querySelector(".purchase-btn");
    const cancelButton = document.querySelector(".cancel-btn");

    if (purchaseButton) purchaseButton.remove();
    if (cancelButton) cancelButton.remove();
}

// 장바구니 -> 구매 페이지 이동
function moveToSaleForm() {
    const cartItems = document.querySelectorAll(".cart-box ul li");
    if (cartItems.length === 0) {
        alert("장바구니가 비어 있습니다.");
        return;
    }

    const userId = "exampleUserId"; // 실제 세션에서 가져오도록 수정 필요
    const gameData = Array.from(cartItems).map((item, index) => {
        const bet = purchaseList[index];
        return `gameId=${bet.gameId}&betType=${encodeURIComponent(bet.betType)}`;
    }).join("&");

    const url = `/betting/views/user/saleForm.do?userId=${userId}&${gameData}`;
    location.href = url;
}
