<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.example.vet.model.FacilitiesVO" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.util.BSPageBar" %>
<%
    //스크립틀릿 - 지변, 메소드선언 불가함, 인스턴스화 가능함
    //insert here
    int rsize = 0;// 예약 전체 레코드 수
    //xxx.java에서 생성된 자료구조를 jsp에서 사용하려면 forward scope를 사용한다. 그래야 null이 일어나지 않고 받아올 수 있다.
    List<Map<String, Object>> rList = (List)request.getAttribute("rList");

    if(rList !=null){//null이면 nullpointException발동할 수 있다 500번 에러 방지
        rsize = rList.size();
//		rmap = bList.get(0);//상세보기 내용들 담김
//		//{comments:[{}{}{}]}
//		if(size==2){
//			Map<String,Object> comlist
//		}
    }
    //내꺼 리스트
    //insert here
    int mysize = 0;// 예약 전체 레코드 수
    //xxx.java에서 생성된 자료구조를 jsp에서 사용하려면 forward scope를 사용한다. 그래야 null이 일어나지 않고 받아올 수 있다.
    List<Map<String, Object>> myList = (List)request.getAttribute("myList");

    if(myList !=null){//null이면 nullpointException발동할 수 있다 500번 에러 방지
        mysize = myList.size();}
//한 페이지에 몇개씩 뿌릴거야?
    int numPerPage = 5;
    int nowPage = 0;
    if(request.getParameter("nowPage")!=null) {
        nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }
    //동물검색 리스트
    int asize = 0;//animal 검색 레코드 수
    //xxx.java에서 생성된 자료구조를 jsp에서 사용하려면 forward scope를 사용한다. 그래야 null이 일어나지 않고 받아올 수 있다.
    List<Map<String, Object>> aList = (List)request.getAttribute("aList");
    if(aList !=null){//null이면 nullpointException발동할 수 있다 500번 에러 방지
        asize = aList.size();
    }

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.10/index.global.min.js'></script>
    <script>
        let isSending = false;
        let todayDate = new Date().toISOString().split('T')[0];
        // Set the minimum value of the date input to today
        document.getElementById("date").min = todayDate;
        //달력 이전 날짜 막기
        //삭제
        function cancel(facilityReserveId){
            window.location.href = "/reservespot/reserveDelete?facilityReserveId=" +facilityReserveId;
        }

        // 현재 날짜를 가져오는 함수
        function getCurrentDate() {
            const today = new Date();
            const year = today.getFullYear();
            let month = today.getMonth() + 1;
            let day = today.getDate();

            // 월과 일이 한 자리 숫자인 경우 앞에 0을 붙여 두 자리로 만듦
            month = month < 10 ? '0' + month : month;
            day = day < 10 ? '0' + day : day;
            console.log("day:",day);
            return year + '-' + month + '-' + day;
            console.log("year"-"month"-"day");
        }

        // 오늘 이후의e 날짜만 선택할 수 있도록 설정하는 함수
        function setMinDate() {
            const facilityReserveDt = document.getElementById('facilityReserveDt');
            const currentDate = getCurrentDate();
            facilityReserveDt.min = currentDate;
        }


        //cchang pictur
        function changeFacilityImage() {
            const selectBox = document.getElementById('facilityNm');
            const selectedValue = selectBox.value;
            const imageContainer = document.getElementById('facilityImageContainer');

            // 선택된 값에 따라 이미지 변경
            if (selectedValue === '1') {
                imageContainer.innerHTML = `
                <img src="img/1.jpg" alt="시설사진1">
                <img src="img/2.jpg" alt="시설사진2">
            `;
            } else if (selectedValue === '2') {
                imageContainer.innerHTML = `
                <img src="img/3.jpg" alt="시설사진3">
                <img src="/img/4.jpg" alt="시설사진4">
            `;
            } else if (selectedValue === '3') {
                imageContainer.innerHTML = `
                <img src="/img/5.jpg" alt="시설사진3">
                <img src="/img/6.jpg" alt="시설사진4">
`;
            } else if (selectedValue === '4') {
                imageContainer.innerHTML = `
                    <img src="/img/7.jpg" alt="시설사진3">
                    <img src="/img/8.jpg" alt="시설사진4">
                    `;
            }
        }

//예약 디테일
        document.ready(function(){
            // 테이블 셀이 클릭되면 모달을 표시하고 해당 ID 값을 가져옵니다.
            'td[data-toggle="modal"]'.click(function(){
                var id = this.data('id'); // 클릭된 테이블 셀의 ID 값 가져오기
                showModal(id); // 모달 표시 함수 호출
            });
        });

        // Ajax를 사용하여 서버에 해당 ID에 관한 데이터를 요청합니다.
        function showModal(id) {
            ajax({
                url: '/getData?id=' + id, // 데이터를 가져올 URL
                type: 'GET',
                success: function(response) {
                    // 서버로부터 받은 데이터를 모달에 삽입합니다.
                    '#modal-lg'.find('.modal-body').html(response);
                    // 모달을 표시합니다.
                    '#modal-lg'.modal('show');
                },
                error: function(xhr, status, error) {
                    console.error('Ajax request failed:', status, error);
                }
            });
        }

//예약수정
        function update(facilityReserveId){
            window.location.href = "/reservespot/reserveDelete?facilityReserveId=" +facilityReserveId;
        }

        //예약넣기

        function reserveInsert() {
            //@CHS@
            if(isSending) {
                return;
            }
            isSending = true;
            //@CHS@
            const animalPk = document.getElementById("animalPk").value;
            console.log("1:" + animalPk);
            const facilityReserveDt = document.getElementById("facilityReserveDt").value;
            console.log("2:" + facilityReserveDt);
            const memberPk = document.getElementById("memberPk").value;
            console.log("3:" + memberPk);
            const facilityNm = document.getElementById("facilityNm").value;
            console.log("4:" + facilityNm);
            const facilityRemarks = document.getElementById("facilityRemarks").value;
            console.log("5:" + facilityRemarks);
            const selecStartTimetBox = parseInt(document.getElementById("selecStartTimetBox").value);
            console.log("7:" + selecStartTimetBox);
            const selecEndTimeBox = parseInt(document.getElementById("selecEndTimeBox").value);
            console.log("6:" + selecEndTimeBox);

            // @CHS@
            let data = JSON.stringify({
                facilityReserveDt: facilityReserveDt,
                facilityNm: facilityNm,
                animalId: animalPk,
                memberPk: memberPk,
                facilityRemarks: facilityRemarks,
                startTimeInterval: selecStartTimetBox,
                endTimeInterval: selecEndTimeBox
            });

            console.log("제이슨데이터:" + data);
            const xhr = new XMLHttpRequest();

            xhr.onload = () => {
                isSending = false;
                if (selecEndTimeBox < selecStartTimetBox) {alert("종료 시간은 시작 시간보다 작을 수 없습니다.")}
                else
                    {

                        if (xhr.status === 200) {
                            console.log(xhr.responseText);
                            var res = xhr.responseText;
                            if (res == "suc") {

                                window.location.href = 'http://localhost:8000/reservespot/dailyReserve';

                            } else if (res == "error") {
                                alert("예약 생성 중 오류가 발생하였습니다. 잠시 후 다시 시도 해주세요.")

                            } else if (res == "dup") {
                                alert("이미 예약된 건이 있습니다. 예약시간을 확인해주세요.")
                            }
                        } else {
                            console.error("예약 생성 중 오류가 발생하였습니다.");
                            alert("환자명을 입력해주세요")
                        }
                    }
            };
            xhr.open('POST', '/reservespot/insertReserve', true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.send(data);
            // @CHS@
            /* @JES@
               for (let i = selecStartTimetBox; i <= selecEndTimeBox; i++) {


                   let data = JSON.stringify({
                       facilityReserveDt: facilityReserveDt,
                       facilityNm: facilityNm,
                       animalId: animalPk,
                       memberPk: memberPk,
                       facilityRemarks: facilityRemarks,
                       timeInterval: i
                   });
                   console.log("제이슨데이터:" + data);
                   const xhr = new XMLHttpRequest();

                   xhr.onload = () => {
                       isSending = false;
                       if (xhr.status === 200) {

                           window.location.href = 'http://localhost:8000/reservespot/dailyReserve';
                       } else {
                           console.error("예약 생성 중 오류가 발생하였습니다.");
                       }
                   };
                   xhr.open('POST', '/reservespot/insertReserve', true);
                   xhr.setRequestHeader('Content-Type', 'application/json');
                   xhr.send(data);
            }

            // @CHS@
            /* @JES@
            for (let i = selecStartTimetBox; i <= selecEndTimeBox; i++) {


                let data = JSON.stringify({
                    facilityReserveDt: facilityReserveDt,
                    facilityNm: facilityNm,
                    animalId: animalPk,
                    memberPk: memberPk,
                    facilityRemarks: facilityRemarks,
                    timeInterval: i
                });
                console.log("제이슨데이터:" + data);
                const xhr = new XMLHttpRequest();

                xhr.onload = () => {
                    isSending = false;
                    if (xhr.status === 200) {

                        window.location.href = 'http://localhost:8000/reservespot/dailyReserve';
                    } else {
                        console.error("예약 생성 중 오류가 발생하였습니다.");
                    }
                };
                xhr.open('POST', '/reservespot/insertReserve', true);
                xhr.setRequestHeader('Content-Type', 'application/json');
                xhr.send(data);
            } @JES@ */
        }
        function searchEnter(){
            console.log('searchEnter')
            console.log(window.event.keyCode);//13
            if(window.event.keyCode == 13){
                animalIdSearch();
            }
        }//end of searchEnter
        //삭제 버튼

        // 검색 및 결과 표시 함수
        function animalIdSearch(){
            const searchAnimalNm = document.getElementById("searchAnimalNm").value;
            console.log(searchAnimalNm);
            if (searchAnimalNm === "") {
                return; // 검색어가 없으면 아무것도 하지 않음
            }
            // 서버에 검색을 수행하기 위해 AJAX 요청 보내기
            const xhr = new XMLHttpRequest();
            console.log("아작스"+searchAnimalNm);
            xhr.open("GET", `/reservespot/animalList?animalNm=`+searchAnimalNm);
            console.log("겟하고난뒤"+searchAnimalNm);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        console.log(xhr.responseText)
                        const response = JSON.parse(xhr.responseText);
                        // 검색 결과를 모달에 표시
                        displaySearchResults(response);
                    } else {
                        console.error("오류:", xhr.statusText);
                    }
                }
            };
            xhr.send();
            // // 검색어 입력창 초기화
            document.getElementById("searchAnimalNm").value = '';
        }
        // 모달에 검색 결과 표시 함수
        function displaySearchResults(results) {
            const searchResultsList = document.getElementById('searchResults');
            // 이전에 표시된 결과를 모두 지우기
            searchResultsList.innerHTML = '';
            // 결과를 모달에 추가
            results.forEach(result => {
                const listItem = document.createElement('li');
                console.log(result);
                console.log(Object.keys(result));
                listItem.textContent = " ("+result.ANIMALBDATE+") " + result.ANIMALNM + " : " + result.MASTER_NM ; // 결과에서 동물 이름과 날짜를 가져와서 li 요소에 표시
                // li 요소에 margin-bottom 스타일 추가
                console.log("리스트아이템"+listItem);
                listItem.style.marginBottom = '7px';
                searchResultsList.appendChild(listItem);
                // 클릭 이벤트 리스너 등록
                listItem.addEventListener('click', function() {
                    // 다른 모달에 Nm 내용 추가
                    document.getElementById('inputMasterNm').value = result.MASTER_NM;
                    document.getElementById('animalNm').value = result.ANIMALNM;
                    document.getElementById('animalPk').value = result.ANIMALID;
                });
            });
        }


    </script>

    <style>
        hr {
            border-top: 3px solid black; /* 굵기 조절 */
            width: 98%; /* 가로 길이 조절 */
        }

        /* 더보기 링크 스타일 */
        h1 small a {
            color: black; /* 링크 색을 검정으로 설정 */
        }

        .btn.btn-block.btn-default {
            width: 100px !important;
        }
        table {
            width: 100%;
        }
        th.cancel-header {
            text-align: right;
            padding-right: 65px !important;
        }
        #facilityRemarks{
            width: 100%;
            padding: 0;
            font-size: 14px;
            resize: none
        }
        .modal-content {
            background-color: white;
            left: 10%;
            margin: 3% auto;
            padding: 2%;
            border-radius: 15px; /* 둥근 모서리 설정 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 추가 */
            width: 60%;
            margin-left: 20%;
            height: 93%;
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
        .rightSide{
            float: left;
            font-size: 20px;

        }
        .leftSide{
            float:left;
            position: relative;
            width: 25%;
            font-size: 20px;
            margin-right: 5px;
        }

        /* 선택바 스타일 */
        .selectRoom-box {
            width: 130px;
            font-size: 25px;
        }

        .select-box{
            width:100px;
        }
        .reservePicture img {
            max-width: 250px;
            margin-right: 5%;
            height: auto;
        }
        .reservePicture {
            display: flex;
            align-items: center; /* 텍스트 수직 중앙 정렬 */

        }
        .text-input { /* 입력 상자 스타일 지정 */
            width: 100px; /* 상자의 너비 조정 */

            font-size: 20px; /* 텍스트 크기 조정 */
            border: 1px solid #ccc; /* 테두리 추가 */
            border-radius: 5px; /* 테두리를 둥글게 만듦 */
            box-sizing: border-box; /* 테두리와 안쪽 여백을 상자 크기에 포함 */
        }
        /* styles.css */

        .leftSide, .rightSide {
            flex: 1;
        }

        .leftSide {
            margin-right: 10px;
        }

        .rightSide {
            margin-left: 10px;
        }

        .leftSide > div, .rightSide > div {
            margin-bottom: 20px;
        }
        .bigColumn{
            margin-bottom: 125px !important;
        }
        .card-footer {
            display: flex;
            justify-content: center;
        }
        .card-header {
            display: flex; /* 요소들을 수평으로 배치합니다. */
            /*align-items: center; !* 요소들을 수직으로 가운데 정렬합니다. *!*/
        }
        .date-header {
            width: 190px; /* 원하는 너비로 조정 */
            height: 48px; /* 원하는 높이로 조정 */
            font-size: 25px;
            margin-right: 10px; /* 입력 필드 오른쪽에 10px의 마진을 추가합니다. */
        }


        .btn-block {
            width: 100px !important; /* 원하는 가로 길이(px)를 설정합니다. */
            font-size:16px  !important;
        }
        .form-control-lg{
            margin :10px;
        }


    </style>
    <%@ include file="/include/bootCommon.jsp"%>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <%@ include file="/include/sidebar.jsp" %>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>시설예약현황</h1>
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
            <%--달력--%>
            <div id='calendar'>사진경로  이상함, 예약 정보 리셋 필요ㅡ ,일일 표가 안 떠~ 2023-01-02 달력선택기에 버튼 오늘,<,> 내껏만 삭제하게 하던, 그냥 내꺼로만 삭제 버튼 뜨게하던, 페이징 버튼 바 5개로 해줘, 업데이트 작업하면 됨</div>


            <!--여기 -->
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header">
                        <input type="date" id="dailyDate" class="date-header" min="" required >
                        <button type="button" class="btn btn-block btn-info"data-toggle="modal" data-target="#modal-lg">예약</button>
                        <%--                        위 코드에서 data-toggle="modal" 및 data-target="#modal-lg" 속성은 해당 버튼이 모달을 트리거하도록 설정합니다.--%>
                    </div>
                    <div id="calendarTable">
                        <div class="card-body">

                            <table class="table table-bordered">
                                <%--21*5--%>
                                <thead>
                                <tr>
                                    <th >예약시설</th>
                                    <th colspan='2'>오전 10시</th>
                                    <th colspan='2'>오전 11시</th>
                                    <th colspan='2'>오후 12시</th>
                                    <th colspan='2'>오후 1시</th>
                                    <th colspan='2'>오후 2시</th>
                                    <th colspan='2'>오후 3시</th>
                                    <th colspan='2'>오후 4시</th>
                                    <th colspan='2'>오후 5시</th>
                                    <th colspan='2'>오후 6시</th>
                                    <th colspan='2'>오후 7시</th>

                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>수술실</td>
                                    <td>10시반까지</td>
                                    <td>2</td>
                                    <td>3</td>
                                    <td>4</td>
                                    <td>5</td>
                                    <td>6</td>
                                    <td>7</td>
                                    <td>8</td>
                                    <td>9</td>
                                    <td>10</td>
                                    <td>11</td>
                                    <td>12</td>
                                    <td>13</td>
                                    <td>14</td>
                                    <td>15</td>
                                    <td>16</td>
                                    <td>17</td>
                                    <td>18</td>
                                    <td>19</td>
                                    <td>20</td>

                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <%--                하단 리스트 오늘 날짜 이후 날짜 빠른 순--%>
                <div class="card">
                    <div class="card-header p-2">
                        <ul class="nav nav-pills">
                            <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">전체 예약 현황</a></li>
                            <li class="nav-item"><a id=checkMine class="nav-link" href="#timeline" data-toggle="tab">내 예약 현황</a></li>
                        </ul>
                    </div><!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <div class="tab-content">
                            <div class="active tab-pane" id="activity">
                                <table class="table table-striped table-valign-middle">
                                    <thead>
                                    <tr>
                                        <th>예약시설</th>
                                        <th>예약자</th>
                                        <th>환자명</th>
                                        <th>예약날짜</th>
                                        <th>예약시간</th>
                                        <th class="cancel-header">취소</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
                                            if(i==rsize) break;//NullPointerException방어
                                            Map<String,Object> rmap = rList.get(i);
                                            // {[조회 결과]:[{START_TIME=10:00, END_TIME=11:00, USER_NM=토마토, FACILITY_NM=수술실, FACILITY_RESERVE_ID=0, ANIMAL_NM=멍돌이, FACILITY_RESERVE_DT=2024-02-23}]}
                                    %>
                                    <tr>
                                        <td><%=rmap.get("FACILITY_NM")%></td>
                                        <td><%=rmap.get("USER_NM")%></td>
                                        <td><%=rmap.get("ANIMAL_NM")%></td>
                                        <td data-toggle="modal"  data-id=<%=rmap.get("FACILITY_RESERVE_ID")%> data-target="#modal-lg"><%=rmap.get("FACILITY_RESERVE_DT")%></td>
                                        <td><%=rmap.get("START_TIME")%>~<%=rmap.get("END_TIME")%></td>

                                        <td class="cancel-button-cell">

                                            <button onclick='cancel(<%=rmap.get("FACILITY_RESERVE_ID")%>)' type="button" class="btn btn-block btn-default" style="float: right;">취소</button>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                                <!-- [[ 페이징 처리  구간  ]] -->
                                <div class="card-footer clearfix">
                                    <ul class="pagination pagination-sm m-0 float-right">
                                        <%
                                            String pagePath = "dailyReserve";
                                            BSPageBar bspb = new BSPageBar(numPerPage,  rsize, nowPage, pagePath);
                                            out.print(bspb.getPageBar());
                                        %>
                                    </ul>
                                </div>
                                <!-- [[ 페이징 처리  구간  ]] -->
                            </div>
                            <div class="tab-pane" id="timeline">
                                <table class="table table-striped table-valign-middle">
                                    <thead>
                                    <tr>
                                        <th>예약시설</th>
                                        <th>환자명</th><!-- 고민 -->
                                        <th>예약날짜</th><!-- 고민 -->
                                        <th>예약시간</th>
                                        <th class="cancel-header" >취소</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <%
                                        for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
                                            if(i==mysize) break;//NullPointerException방어
                                            Map<String,Object> myMap = myList.get(i);
                                            // {[조회 결과]:[{START_TIME=10:00, END_TIME=11:00, USER_NM=토마토, FACILITY_NM=수술실, FACILITY_RESERVE_ID=0, ANIMAL_NM=멍돌이, FACILITY_RESERVE_DT=2024-02-23}]}
                                    %>
                                    <tr>
                                        <td><%=myMap.get("FACILITY_NM")%></td>
                                        <td><%=myMap.get("ANIMAL_NM")%></td>
                                        <td><%=myMap.get("FACILITY_RESERVE_DT")%></td>
                                        <td><%=myMap.get("START_TIME")%>~<%=myMap.get("END_TIME")%></td>

                                        <td class="cancel-button-cell">

                                            <button onclick='cancel(<%=myMap.get("FACILITY_RESERVE_ID")%>)' type="button" class="btn btn-block btn-default" style="float: right;">취소</button>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                                <div class="card-footer clearfix">
                                    <ul class="pagination pagination-sm m-0 float-right">
                                        <%
                                            String mypagePath = "dailyReserve";
                                            BSPageBar mypb = new BSPageBar(numPerPage,  mysize, nowPage, mypagePath);
                                            out.print(mypb.getPageBar());
                                        %>
                                    </ul>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
                <%--            시설 모달--%>
                <div class="modal fade" id="modal-lg">

                    <div class="modal-dialog modal-lg">
                        <div class="modal-content" style="display: flex; flex-direction: column; height: 100%;">

                            <div class="modal-header">
                                <select id="facilityNm" class="selectRoom-box"  onchange="changeFacilityImage()">
                                    <option value="수술실">수술실</option>
                                    <option value="면회실">면회실</option>
                                    <option value="방사선실">방사선실</option>
                                    <option value="미용실">미용실</option>
                                    <!-- 필요한 만큼 옵션을 추가하세요 -->
                                </select>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" style="flex: 1;">
                                <div class="leftSide">

                                    <div class="bigColumn">시설이미지</div>
                                    <div>예약시간</div>

                                    <div>예약자</div>
                                    <div>환자명</div>
                                    <div>내용</div>
                                </div>
                                <div class="rightSide">
                                    <div class="reservePicture" id="facilityImageContainer">
                                        <img src="/img/1.jpg" alt="시설사진1" >
                                        <img src="/img/2.jpg" alt="시설사진2">
                                    </div>
                                    <div class="d-flex">

                                        <input type="date" id="facilityReserveDt" />

                                        <select id="selecStartTimetBox" class="select-box mr-2">
                                            <option value="0">10:00</option>
                                            <option value="1">10:30</option>
                                            <option value="2">11:00</option>
                                            <option value="3">11:30</option>
                                            <option value="4">12:00</option>
                                            <option value="5">12:30</option>
                                            <option value="6">13:00</option>
                                            <option value="7">13:30</option>
                                            <option value="8">14:00</option>
                                            <option value="9">14:30</option>
                                            <option value="10">15:00</option>
                                            <option value="11">15:30</option>
                                            <option value="12">16:00</option>
                                            <option value="13">16:30</option>
                                            <option value="14">17:00</option>
                                            <option value="15">17:30</option>
                                            <option value="16">18:00</option>
                                            <option value="17">18:30</option>
                                            <option value="18">19:00</option>
                                            <option value="19">19:30</option>
                                            <!-- 오늘일경우 오늘 시간 이후 시간 셀렉트 -->
                                        </select>
                                        <span>~</span>
                                        <select id="selecEndTimeBox" class="select-box ml-2">
                                            <option value="0">10:30</option>
                                            <option value="1">11:00</option>
                                            <option value="2">11:30</option>
                                            <option value="3">12:00</option>
                                            <option value="4">12:30</option>
                                            <option value="5">13:00</option>
                                            <option value="6">13:30</option>
                                            <option value="7">14:00</option>
                                            <option value="8">14:30</option>
                                            <option value="9">15:00</option>
                                            <option value="10">15:30</option>
                                            <option value="11">16:00</option>
                                            <option value="12">16:30</option>
                                            <option value="13">17:00</option>
                                            <option value="14">17:30</option>
                                            <option value="15">18:00</option>
                                            <option value="16">18:30</option>
                                            <option value="17">19:00</option>
                                            <option value="18">19:30</option>
                                            <option value="19">20:00</option>
                                            <!-- 오늘일경우 오늘 시간 이후 시간 셀렉트 -->
                                        </select>
                                    </div>
                                    <div><input type="text" id="memberNm" class="text-input" readonly value="name">
                                        <span>
                                            <input type="text" id="memberPk" class="text-input" readonly value="1" hidden>
                                            <%--name,userpk--%>
                                        </span>
                                        <span>
                                            <input type="text" id="animalPk" class="text-input" readonly >
                                        </span>
                                    </div>
                                    <div>
                                        <input type="text" id="animalNm" class="text-input" readonly>
                                        <button class="btn btn btn-default"  data-toggle="modal" data-target="#modal-sm">
                                            <%--                                            위 코드에서 data-toggle="modal" 및 data-target="#modal-lg" 속성은 해당 버튼이 모달을 트리거하도록 설정합니다.&ndash;%&gt;--%>
                                            <i class="fa fa-search"></i>
                                        </button>
                                        <span>보호자명</span>
                                        <input type="text" id="inputMasterNm" class="text-input" readonly>
                                    </div>
                                    <textarea rows="5" aria-label="With textarea" id="facilityRemarks"  name="facilityRemarks"></textarea>
                                </div>
                            </div>


                            <div class="modal-footer" style="text-align: right;">
                                <button type="button" class="btn btn-default" data-dismiss="modal">목록으로 돌아가기</button>
                                <button type="button" class="btn btn-primary" >예약수정</button>
                                <button type="button" class="btn btn-primary">예약취소</button>
                                <button type="button" class="btn btn-primary" onclick="reserveInsert()">예약등록</button>
                            </div>

                        </div>

                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->

                </div>
                <!-- /작은 모달 -->
                <div class="modal fade" tabindex="-1" id="modal-sm">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">환자명 추가</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="row">
                                <input type="search" id="searchAnimalNm" class="form-control form-control-lg" placeholder="환자명 입력" value="" onkeyup="searchEnter()">
                            </div>


                            <div class="modal-body">

                                <ul id="searchResults" style="padding: 2px; list-style-type: '+';">

                                </ul>

                            </div>
                            <div class="modal-footer justify-content-between">
                                <button type="button" class="btn btn-default" data-dismiss="modal" hidden>닫기</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!--footer-->

    <%@ include file="/include/footer.jsp" %>
</div>
<!-- ./wrapper -->
<%@ include file="/include/bootCommonFoot.jsp" %>
<script>
    // 페이지 로드 시 setMinDate 함수 호출하여 설정
    window.onload = function() {
        console.log("오늘날 최소값 설정");
        setMinDate();
        const facilityReserveDt = document.getElementById('facilityReserveDt');
        facilityReserveDt.value = getCurrentDate();
        dailyDate.value=  getCurrentDate();
    };
</script>
</body>
</html>

