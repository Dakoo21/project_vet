<!-- paymentSuccess.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- head 부분 생략 -->
</head>
<body>
<div>
    <!-- 결제 정보 표시 -->
    <h1>결제가 완료되었습니다.</h1>
    <table>
        <tr>
            <td>IMP UID:</td>
            <td>${paymentVO.impUid}</td>
        </tr>
        <tr>
            <td>MERCHANT UID:</td>
            <td>${paymentVO.merchantUid}</td>
        </tr>
        <!-- 필요한 결제 정보가 있으면 추가 -->
    </table>
</div>
</body>
</html>
