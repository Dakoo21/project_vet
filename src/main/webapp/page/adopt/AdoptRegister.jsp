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
            <div class="mb-3 row">
                <div id="contents_box">
                    <div id="img_area">
                        <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="...">
                    </div>
                </div>
                <div class="col-sm-10">
                </div>
            </div>
            <table class="table table-borderless">
                <thead>
                <tr>
                    <th>공고상태</th>
                    <th><select class="form-select" aria-label="default select example">
                        <option selected>공고상태</option>
                        <option value="1">공고중</option>
                        <option value="2">보호중</option>
                        </select></th>
                    <th>축종</th>
                    <th><select class="form-select" aria-label="Default select example">
                        <option selected>축종</option>
                        <option value="1">개</option>
                        <option value="2">고양이</option>
                        <option value="3">다른 반려동물</option>
                    </select></th>
                </tr>
                <tr>
                    <th>성별</th>
                    <th><input type="text" class="form-control" id="exampleFormControlInput1" placeholder=""></th>
                    <th>중성화</th>
                    <th><select class="form-select" aria-label="default select example">
                        <option selected>중성화</option>
                        <option value="1">O</option>
                        <option value="2">X</option>
                    </select></th>
                </tr>
                <tr>
                    <th>출생연도</th>
                    <th><input type="text" class="form-control" id="exampleFormControlInput2" placeholder="YYYY"></th>
                    <th>몸무게</th>
                    <th><select class="form-select" aria-label="Default select example">
                        <option selected>몸무게</option>
                        <option value="1">소(8kg미만)</option>
                        <option value="2">중(8~18kg)</option>
                        <option value="3">대(18kg이상)</option>
                    </select></th>
                </tr>
                <tr>
                    <th>털 색</th>
                    <th><input type="text" class="form-control" id="exampleFormControlInput3" placeholder=""></th>
                    <th>보호소</th>
                    <th><input type="text" class="form-control" id="exampleFormControlInput4" placeholder=""></th>
                </tr>
                <tr>
                    <th>친화도</th>
                    <th><form name="myform" id="myform" method="post" action="./save">
                        <fieldset>
                            <label for="rate1">🧡</label><input type="radio" name="rating" value="5" id="rate1">
                            <label for="rate2">🧡</label><input type="radio" name="rating" value="4" id="rate2">
                            <label for="rate3">🧡</label><input type="radio" name="rating" value="3" id="rate3">
                            <label for="rate4">🧡</label><input type="radio" name="rating" value="2" id="rate4">
                            <label for="rate5">🧡</label><input type="radio" name="rating" value="1" id="rate5">
                        </fieldset>
                    </form></th>
                </tr>
                <tr>
                    <th>활발함</th>
                    <th><th><form name="myform" id="myform1" method="post" action="./save">
                    <fieldset>
                        <label for="rate_1">💚</label><input type="radio" name="rating" value="1" id="rate_1">
                        <label for="rate_2">💚</label><input type="radio" name="rating" value="2" id="rate_2">
                        <label for="rate_3">💚</label><input type="radio" name="rating" value="3" id="rate_3">
                        <label for="rate_4">💚</label><input type="radio" name="rating" value="4" id="rate_4">
                        <label for="rate_5">💚</label><input type="radio" name="rating" value="5" id="rate_5">
                    </fieldset>
                </form></th>
                </tr>
                <tr>
                    <th>타동물 친화</th>
                    <th><div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                        <label class="form-check-label" for="inlineRadio1">Y</label>
                    </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                            <label class="form-check-label" for="inlineRadio2">N</label>
                        </div></th>
                    <th>배변훈련</th>
                    <th><div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option1">
                        <label class="form-check-label" for="inlineRadio1">Y</label>
                    </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio4" value="option2">
                            <label class="form-check-label" for="inlineRadio2">N</label>
                        </div></th>
                </tr>

            </table>
            <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">상태</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
            <div class="text-center">
                <button type="button" class="btn btn-danger" style="margin-right: 10px;">취소</button>
                <button type="button" class="btn btn-primary">등록</button>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <%@ include file="/include/footer.jsp"%>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!--footer-->
<%@ include file="/include/bootCommonFoot.jsp"%>

</body>
</html>

<style typeof="text/css">
    .form-control{
        width: 50%;
        text-align: center;
        line-height: 2.5;
    }

    #exampleFormControlTextarea1{
        width: 100%;
    }

    #contents_box > #img_area{
        width: 50%;
        height: 50%;
    }

    #contents_box > .table table-borderless{
        width: 50%;
        height: 50%;
    }

    #contents_box > #img_area > img{
        width: 95%;
        padding-top: 50%;
    }

    #myform fieldset{
        display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
        border: 0; /* 필드셋 테두리 제거 */
    }
    #myform input[type=radio]{
        display: none; /* 라디오박스 감춤 */
    }
    #myform label{
        font-size: 2em; /* 이모지 크기 */
        color: transparent; /* 기존 이모지 컬러 제거 */
        text-shadow: 0 0 0 #D8D8D8; /* 새 이모지 색상 부여 */
    }
    #myform label:hover{
        text-shadow: 0 0 0 #F6841B; /* 마우스 호버 */
    }
    #myform label:hover ~ label{
        text-shadow: 0 0 0 #F6841B; /* 마우스 호버 뒤에오는 이모지들 */
    }

    #myform fieldset{
        display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
        direction: rtl; /* 이모지 순서 반전 */
        border: 0; /* 필드셋 테두리 제거 */
    }

    #myform input[type=radio]:checked ~ label{
        text-shadow: 0 0 0 #F6841B; /* 마우스 클릭 체크 */
    }




    #myform1 fieldset{
        display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
        border: 0; /* 필드셋 테두리 제거 */
    }
    #myform1 input[type=radio]{
        display: none; /* 라디오박스 감춤 */
    }
    #myform1 label{
        font-size: 2em; /* 이모지 크기 */
        color: transparent; /* 기존 이모지 컬러 제거 */
        text-shadow: 0 0 0 #D8D8D8; /* 새 이모지 색상 부여 */
    }
    #myform1 label:hover{
        text-shadow: 0 0 0 #33B21E; /* 마우스 호버 */
    }
    #myform1 label:hover ~ label{
        text-shadow: 0 0 0 #33B21E; /* 마우스 호버 뒤에오는 이모지들 */
    }

    #myform1 fieldset{
        display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
        direction: rtl; /* 이모지 순서 반전 */
        border: 0; /* 필드셋 테두리 제거 */
    }
    #myform1 input[type=radio]:checked ~ label{
        text-shadow: 0 0 0 #33B21E; /* 마우스 클릭 체크 */
    }
</style>