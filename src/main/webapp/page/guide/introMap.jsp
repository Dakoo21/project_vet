<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>병원안내</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../../dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="../../iCheck/flat/blue.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="plugins/morris/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- DataTables -->
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2f3fa556ca3d996a5e0aac6ab5ac1018"></script>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<%@ include file="/include/header.jsp"%>
<%@ include file="/include/sidebar.jsp"%>
<div class="wrapper">
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> 병원안내
        <small>오시는 길</small>
      </h1>
    </section>

    <script>
      // 현재 위치를 가져오는 함수
      function getLoc() {
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function (position) {
            // 현재 위치 좌표
            var lat = position.coords.latitude;
            var lng = position.coords.longitude;

            // 마커 이미지 생성
            var markerImage = new kakao.maps.MarkerImage(
                    'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png',
                    new kakao.maps.Size(24, 35),
                    { offset: new kakao.maps.Point(13, 35) }
            );

            // 현재 위치를 나타내는 마커 생성
            var markerPosition = new kakao.maps.LatLng(lat, lng);
            var marker = new kakao.maps.Marker({
              position: markerPosition,
              image: markerImage, // 마커 이미지 설정
            });

            // 마커를 지도에 표시
            marker.setMap(map);

            // 지도 중심을 현재 위치로 이동
            map.setCenter(markerPosition);
          });
        } else {
          alert('현재 위치를 가져올 수 없습니다.');
        }
      }
    </script>

    <!-- Main content -->
    <section class="content">
      <div class="container">
        <div class="main">
          <hr style="height: 2px" />
          <div class="mapwrap">
            <div class="map" id="map" style="width: 500px; height: 400px">
              여기
            </div>
            <script type="text/javascript">
              const container = document.getElementById("map");
              const positions = [
                {
                  content: '<div style="padding:5px;">동물생심</div>',
                  latlng: new kakao.maps.LatLng(37.476773, 126.879959),
                },
              ];
              const options = {
                center: positions[0].latlng,
                level: 4,
              };
              const map = new kakao.maps.Map(container, options);
            </script>
            <%--<input class="btnGeoloc" type="button" value="현재위치" onclick="geoLoc()">--%>
          </div>

          <div class="map-introduction">
            <p>서울특별시 금천구 가산디지털2로 95 (가산동,km타워) 3층 (08505)</p>
            <p>가산디지털단지역에서 ⑦번 또는 ⑧번 출구에서 도보 7-10분</p>
          </div>
        </div>
        </div>
        <div class="footer"></div>
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
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>

<%@ include file="/include/footer.jsp"%>
</body>
</html>