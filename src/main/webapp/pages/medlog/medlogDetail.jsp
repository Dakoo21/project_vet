<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>진료기록조회</title>
    <style>
        .form-group {
            display: inline-block;
            vertical-align: top; /* Align form groups at the top */
            margin-right: 20px; /* Optional: Add some spacing between form groups */
        }
        .form-group button{
            width: 100px;
            margin-left: 10px;
        }
        .form-group label {
            display: block; /* Make label a block element */
            margin-bottom: 5px; /* Optional: Add some spacing between label and input */
        }
        .form-group input,
        .form-group select {
            width: 100%; /* Make inputs fill the entire width of the form group */
        }
        .form-group hr {
            border: none;
            border-top: 1px solid #ccc; /* Set the border style */
            margin-top: 10px; /* Adjust margin as needed */
            margin-bottom: 10px; /* Adjust margin as needed */
        }
        .form-group {
            display: flex;
            flex-wrap: wrap;
        }
    </style>
    <%@ include file="/include/bootCommon.jsp"%>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<%@ include file="/include/sidebar.jsp"%>
<div class="wrapper">
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>진료기록 상세조회</h1>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>
            <!-- Main content -->
            <section class="content">
                <!-- Default box -->
                <div class="card card-solid">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 col-sm-6">
                                <div class="col-12">
                                    <img src="/dist/img/user1-128x128.jpg" class="product-image" alt="Product Image">
                                </div>
                            </div>
                            <div class="col-12 col-sm-6">
                                <div class="mt-4">
                                    <div class="btn btn-primary btn-lg btn-flat">
                                        파일첨부
                                    </div>

                                    <div class="btn btn-primary btn-lg btn-flat">
                                        수정
                                    </div>

                                    <div class="btn btn-default btn-lg btn-flat">
                                        삭제
                                    </div>
                                </div>
                                <div class="form-row">
                                <div class="form-group">
                                    <label for="inputUSER_NM">보호자명</label>
                                    <input type="text" id="inputUSER_NM" class="form-control" value="서견주">
                                </div>
                                <div class="form-group">
                                    <label for="inputCOMMON_CODE_SEX">성별</label>
                                    <select id="inputCOMMON_CODE_SEX" class="form-control custom-select">
                                        <option selected>선택</option>
                                        <option>남</option>
                                        <option>여</option>
                                    </select>
                                </div>
                                </div>
                                    <div class="form-group">
                                        <label for="inputUSER_PNUMBER">연락처</label>
                                        <input type="text" id="inputUSER_PNUMBER" class="form-control" value="010-1234-5678">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputSTOCK_BUYPRICE">주소</label>
                                        <input type="text" id="inputSTOCK_BUYPRICE" class="form-control" value="서울특별시 금천구 가산동 123-12">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputUSER_EMAIL">이메일</label>
                                        <input type="text" id="inputUSER_EMAIL" class="form-control" value="seoul17@hot.com">
                                    </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="inputANIMAL_NM">동물명</label>
                                        <input type="text" id="inputANIMAL_NM" class="form-control" value="뭉치">
                                    </div>
                                <div class="form-group">
                                    <label for="inputANIMAL_SPECIES">축종</label>
                                    <select id="inputANIMAL_SPECIES" class="form-control custom-select">
                                        <option selected>강아지</option>
                                        <option>고양이</option>
                                        <option>파충류</option>
                                        <option>기타</option>
                                    </select>
                                </div>
                                </div>
                                <div class="form-row">
                                <div class="form-group">
                                    <label for="inputANIMAL_BREED">품종</label>
                                    <input type="text" id="inputANIMAL_BREED" class="form-control" value="불독">
                                </div>
                                <div class="form-group">
                                    <label for="inputCOMMON_CODE_SEX2">성별</label>
                                    <select id="inputCOMMON_CODE_SEX2" class="form-control custom-select">
                                        <option selected>선택</option>
                                        <option>남</option>
                                        <option>여</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="inputStatus">중성화</label>
                                    <select id="inputStatus" class="form-control custom-select">
                                        <option selected>선택</option>
                                        <option>Y</option>
                                        <option>N</option>
                                    </select>
                                </div>
                                </div>
                                <div class="form-row">
                                <div class="form-group">
                                    <label for="inputANIMAL_BDATE">생년월일</label>
                                    <input type="text" id="inputANIMAL_BDATE" class="form-control" value="2012.02">
                                </div>
                                    <div class="form-group">
                                        <label for="inputANIMAL_WEIGHT">몸무게</label>
                                        <div class="input-group">
                                            <input type="text" id="inputANIMAL_WEIGHT" class="form-control" value="5.4">
                                            <div class="input-group-append">
                                                <span class="input-group-text">kg</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputBOOKING_PK">진료예약</label>
                                    <input type="text" id="inputBOOKING_PK" class="form-control" value="2024.02.18 - 15:00">
                                </div>
                            </div>
                                <div class="col-12 col-sm-12">
                                    <div class="form-group">
                                        <h4 class="my-3">
                                            <label>진료기록 등록</label>
                                        </h4>
                                    </div>
                                    <div class="form-group">
                                        <h4>내과</h4>
                                        <p style="border-bottom: 1px solid #000; width: 100%;"></p>
                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="internal_medicine[]" value="digestive_system">소화기</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="internal_medicine[]" value="circulatory_system">순환기</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="internal_medicine[]" value="respiratory_system">호흡기</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="internal_medicine[]" value="nervous_system">신경</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="internal_medicine[]" value="endocrinology">내분비</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="internal_medicine[]" value="ophthalmology">안과</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="internal_medicine[]" value="dermatology">피부과</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="internal_medicine[]" value="vaccination">예방접종</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="internal_medicine[]" value="blood_test">혈액검사</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="internal_medicine[]" value="health_checkup">건강검진</label>
                                            </div>
                                        </div>
                                    </div>
                                        <div class="form-group">
                                        <h4>외과</h4>
                                        <p style="border-bottom: 1px solid #000; width: 100%;"></p>
                                        <div class="form-group">
                                            <!-- First line -->
                                            <div class="checkbox">
                                                <input type="checkbox" id="checkbox1" name="surgery[]" value="orthopedics">
                                                <label for="checkbox1">정형외과</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="surgery[]" value="thoracic_surgery">흉부외과</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="surgery[]" value="neurosurgery">신경외과</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="surgery[]" value="abdominal_surgery">복강외과</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="surgery[]" value="dentistry">치과</label>
                                            </div>
                                            <!-- Second line -->
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="surgery[]" value="x_ray">X-Ray</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="surgery[]" value="neutering">중성화</label>
                                            </div>
                                            <div class="checkbox">
                                                <label><input type="checkbox" name="surgery[]" value="general_surgery">수술</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputDescription1">증상기록</label>
                                    <p style="border-bottom: 1px solid #000; width: 100%;"></p>
                                    <textarea id="inputDescription1" class="form-control" rows="4">24/02/05
                                        -피부 가려움, 긁음, 계속 핥음
                                        -환부 붉은 반점
                                        -털 빠짐
                                    </textarea>
                                </div>
                                <div class="form-group">
                                    <label for="inputDescription2">처방기록</label>
                                    <td>
                                        <button type="button" class="btn btn-sm btn-block btn-primary">약 처방내역</button>
                                    </td>
                                    <p style="border-bottom: 1px solid #000; width: 100%;"></p>
                                    <textarea id="inputDescription2" class="form-control" rows="4">24/02/05
                                        -아토피
                                        -면역매개성 질환
                                    </textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                <!-- /.card -->
            </section>
            <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <%@ include file="/include/footer.jsp"%>
</div>
<!-- ./wrapper -->
    <script>
        $(document).ready(function() {
            $('.product-image-thumb').on('click', function () {
                var $image_element = $(this).find('img')
                $('.product-image').prop('src', $image_element.attr('src'))
                $('.product-image-thumb.active').removeClass('active')
                $(this).addClass('active')
            })
        })
    </script>

<%@ include file="/include/bootCommonFoot.jsp"%>
</body>
</html>
