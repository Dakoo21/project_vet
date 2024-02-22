<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@6.1.10/index.global.min.js'></script>
    <script>
        function checkReservation() {
            // 여기서 예약이 이미 있는지 확인하는 로직을 작성합니다.
            var alreadyReserved = false; // 예약이 이미 있으면 true로 설정

            if (alreadyReserved) {
                // 이미 예약이 있는 경우
                alert("예약할려는 시간대에 이미 예약한 건이 있습니다.");
                // } else if {
                //     // 예약이 없는 경우
                //     // 여기에 예약 등록 로직을 추가하면 됩니다.
                //     // 예약 등록 코드를 추가하세요.
                //     alert("잘못된 시간입력입니다.");
            } else{
                alert("잘못된 시간입력입니다.");
            }
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
        #r_content{
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
            <div id='calendar'>일일 표가 안 떠~ 2023-01-02 달력선택기에 버튼 오늘,<,></div>


            <!--여기 -->
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header">
                        <input type="date" class="date-header"/>
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
                                    <th colspan='2'>오후 8시</th>
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
                                    <td>21</td>
                                    <td>22</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <%--                하단 리스트 날짜 빠른 순--%>
                <div class="card">
                    <div class="card-header p-2">
                        <ul class="nav nav-pills">
                            <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">전체 예약 현황</a></li>
                            <li class="nav-item"><a class="nav-link" href="#timeline" data-toggle="tab">내 예약 현황</a></li>
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
                                    <tr>
                                        <td>예약시설</td>
                                        <td>예약자</td>
                                        <td>환자명</td>
                                        <td>예약날짜</td>
                                        <td>예약시간</td>
                                        <td class="cancel-button-cell">
                                            <button onclick="cancel()" type="button" class="btn btn-block btn-default" style="float: right;">취소</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>예약시설</td>
                                        <td>예약자</td>
                                        <td>환자명</td>
                                        <td>2024-02-01</td>
                                        <td>예약시간</td>
                                        <td class="cancel-button-cell">
                                            <button onclick="cancel()" type="button" class="btn btn-block btn-default" style="float: right;">취소</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>예약시설</td>
                                        <td>예약자</td>
                                        <td>환자명</td>
                                        <td>2024-02-01</td>
                                        <td>15:30 ~ 16:30</td>
                                        <td class="cancel-button-cell">
                                            <button onclick="cancel()" type="button" class="btn btn-block btn-default" style="float: right;">취소</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="card-footer clearfix">
                                    <ul class="pagination pagination-sm m-0 float-right">
                                        <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                                    </ul>
                                </div>
                            </div>

                            <div class="tab-pane" id="timeline">
                                <table class="table table-striped table-valign-middle">
                                    <thead>
                                    <tr>
                                        <th>예약시설</th>

                                        <th>환자명</th><!-- 고민 -->
                                        <th>예약날짜</th><!-- 고민 -->
                                        <th>예약시간</th>
                                        <th>취소</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>예약시설</td>

                                        <td>환자명</td>
                                        <td>2024-02-01</td>
                                        <td>15:30 ~ 16:30</td>
                                        <th><button onclick="cancle()" type="button" class="btn btn-block btn-default">취소</button></th>

                                    </tr>
                                    <tr>
                                        <td>예약시설</td>

                                        <td>환자명</td>
                                        <td>2024-02-01</td>
                                        <td>15:30 ~ 16:30</td>
                                        <th><button onclick="cancle()" type="button" class="btn btn-block btn-default">취소</button></th>
                                    </tr>
                                    <tr>
                                        <td>예약시설</td>

                                        <td>환자명</td>
                                        <td>2024-02-01</td>
                                        <td>15:30 ~ 16:30</td>
                                        <th><button onclick="cancle()" type="button" class="btn btn-block btn-default">취소</button></th>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="card-footer clearfix">
                                    <ul class="pagination pagination-sm m-0 float-right">
                                        <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
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
                                <select id="selectRoomBox" class="selectRoom-box">
                                    <option value="">수술실</option>
                                    <option value="1">면회실</option>
                                    <option value="2">방사선실</option>
                                    <option value="3">미용실</option>
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
                                    <div>보호자명</div>
                                    <div>내용</div>
                                </div>
                                <div class="rightSide">
                                    <div class="reservePicture">
                                        <img src="./62562747.PNG" alt="시설사진1" >
                                        <img src="./62562747.PNG" alt="시설사진2">
                                    </div>
                                    <div class="d-flex">

                                        <input type="date" />

                                        <select id="selecStartTimetBox" class="select-box mr-2">
                                            <option value="">10:00</option>
                                            <option value="1">10:30</option>
                                            <option value="2">11:00</option>
                                            <option value="2">12:00</option>
                                            <!-- 오늘일경우 오늘 시간 이후 시간 셀렉트 -->
                                        </select>
                                        <span>~</span>
                                        <select id="selecEndTimeBox" class="select-box ml-2">
                                            <option value="">10:00</option>
                                            <option value="1">10:30</option>
                                            <option value="2">11:00</option>
                                            <option value="2">12:00</option>
                                            <!-- 오늘일경우 오늘 시간 이후 시간 셀렉트 -->
                                        </select>
                                    </div>
                                    <div>내이름</div>
                                    <div>
                                        <input type="text" class="text-input">
                                        <button class="btn btn btn-default"  data-toggle="modal" data-target="#modal-sm">
                                            <%--                                            위 코드에서 data-toggle="modal" 및 data-target="#modal-lg" 속성은 해당 버튼이 모달을 트리거하도록 설정합니다.&ndash;%&gt;--%>
                                            <i class="fa fa-search"></i>
                                        </button>
                                        <span>고객</span>
                                        <select id="customer" class="select-box">

                                            <option value="">꽁지</option>
                                            <option value="1">꽁꽁지</option>
                                            <!-- 선택 시작 시간 이후 시간 셀렉트 -->
                                        </select>
                                    </div>
                                    <textarea rows="5" aria-label="With textarea" id="r_content" name="r_content"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer" style="text-align: right;">
                                <button type="button" class="btn btn-default" data-dismiss="modal">목록으로 돌아가기</button>
                                <button type="button" class="btn btn-primary">예약수정</button>
                                <button type="button" class="btn btn-primary">예약취소</button>
                                <button type="button" class="btn btn-primary" onclick="checkReservation()">예약등록</button>
                            </div>
                        </div>

                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /작은 모달 -->
                <div class="modal fade" tabindex="-1"id="modal-sm">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">보호자 추가</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="row">
                                <input type="search" class="form-control form-control-lg" placeholder="보호자명 입력" value="보호자명 입력">
                            </div>
                            <div class="modal-body">
                                <ul style="padding: 2px; list-style-type: '+';">
                                    <li style="margin-bottom: 7px;">
                                        <a href="#">최코테(abc****) 010-****-1234</a>
                                    </li>
                                    <li>
                                        <a href="#">최코테(abc****) 010-****-1234</a>
                                    </li>
                                    <li>
                                        <a href="#">최코테(abc****) 010-****-1234</a>
                                    </li><li>
                                    <a href="#">최코테(abc****) 010-****-1234</a>
                                </li>

                                </ul>
                            </div>
                            <div class="modal-footer justify-content-between">
                                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                                <button type="button" class="btn btn-primary">닫기</button>
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

</body>
</html>

