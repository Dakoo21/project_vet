<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>병원안내</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <%@ include file="/include/bootCommon.jsp"%>
  <style>
    .customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
    .customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
    .customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
    .customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
    .customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
  </style>
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ac54905ef797d47f8532567996ab799"></script>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<%@ include file="/include/sidebar.jsp"%>
<div class="wrapper">
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> 병원안내</h1>
    </section>

    <script>
      // 현재 위치를 가져오는 함수
      function getLoc() {
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                  center: new kakao.maps.LatLng(37.477186, 126.879460), // 지도의 중심좌표
                  level: 4 // 지도의 확대 레벨
                };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        function setCenter() {
          // 이동할 위도 경도 위치를 생성합니다
          var moveLatLon = new kakao.maps.LatLng(37.477186, 126.879460);

          // 지도 중심을 이동 시킵니다
          map.setCenter(moveLatLon);
        }

        function panTo() {
          // 이동할 위도 경도 위치를 생성합니다
          var moveLatLon = new kakao.maps.LatLng(37.477186, 126.879460);

          // 지도 중심을 부드럽게 이동시킵니다
          // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
          map.panTo(moveLatLon);
        }

        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
                imageSize = new kakao.maps.Size(64, 69),
                imageOption = {offset: new kakao.maps.Point(27, 69)};

        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                markerPosition = new kakao.maps.LatLng(37.477186, 126.879460);

        var marker = new kakao.maps.Marker({
          position: markerPosition,
          image: markerImage
        });

        // 마커를 지도에 추가
        marker.setMap(map);

        var content = '<div class="customoverlay">' +
                '  <a href="https://map.kakao.com/?itemId=145553740" target="_blank">' +
                '    <span class="title">동물생심</span>' +
                '  </a>' +
                '</div>';

        var position = new kakao.maps.LatLng(37.477186, 126.879460);

        var customOverlay = new kakao.maps.CustomOverlay({
          map: map,
          position: position,
          content: content,
          yAnchor: 1
        });
      }
    </script>

    <!-- Main content -->
    <section class="content">
      <div class="container">
        <div class="main_header"></div>
        <div class="main">
          <div>병원 위치</div>
          <hr style="height: 2px" />
          <div class="mapwrap">
            <div class="map" id="map" style="width: 500px; height: 400px">
              여기
            </div>
            <script type="text/javascript">
              var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                      mapOption = {
                        center: new kakao.maps.LatLng(37.477186, 126.879460), // 지도의 중심좌표
                        level: 4 // 지도의 확대 레벨
                      };

              var map = new kakao.maps.Map(mapContainer, mapOption);

              var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다
                      imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
                      imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

              // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
              var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                      markerPosition = new kakao.maps.LatLng(37.477186, 126.879460); // 마커가 표시될 위치입니다

              // 마커를 생성합니다
              var marker = new kakao.maps.Marker({
                position: markerPosition,
                image: markerImage // 마커이미지 설정
              });

              // 마커가 지도 위에 표시되도록 설정합니다
              marker.setMap(map);

              // 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
              var content = '<div class="customoverlay">' +
                      '  <a href="https://map.kakao.com/?itemId=145553740" target="_blank">' +
                      '    <span class="title">동물생심</span>' +
                      '  </a>' +
                      '</div>';

              // 커스텀 오버레이가 표시될 위치입니다
              var position = new kakao.maps.LatLng(37.477186, 126.879460);

              // 커스텀 오버레이를 생성합니다
              var customOverlay = new kakao.maps.CustomOverlay({
                map: map,
                position: position,
                content: content,
                yAnchor: 1
              });
            </script>

            <input class="btnGeoloc" type="button" value="현재위치" onclick="getLoc()">

          </div>
          <hr style="height: 2px" />
          <table class="table" style="minwidth: 700px">
            <tbody style="border: 1px solid lightgray">
            <tr>
              <td style="borderright: 1px solid lightgray">주소</td>
              <td>
                서울특별시 금천구 가산디지털2로 95 KM타워 3층 (T: 02-818-7950)
              </td>
            </tr>
            <tr>
              <td style="borderright: 1px solid lightgray">버스</td>
              <td>
                디지털3단지 사거리 정류장<br />
                지선 5536/5714 간선 503/504 일반 21
              </td>
            </tr>
            <tr>
              <td style="borderright: 1px solid lightgray">지하철</td>
              <td>지하철 1, 7호선 가산디지털단지역 5번출구 200m</td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>

<%@ include file="/include/footer.jsp"%>
</body>
</html>