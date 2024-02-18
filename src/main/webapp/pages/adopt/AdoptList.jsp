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
            <!--여백-->
            <div doz_type="row" doz_grid="12" doz_flexible="N" class="doz_row">
                <div doz_type="grid" doz_grid="12" doz_flexible="N" class="col-dz col-dz-12">
                    <div doz_type="widget" id="w20201122dbd9a9af8e44e">
                        <div class="_widget_data _ds_animated_except" data-widget-name="여백" data-widget-type="padding" data-widget-parent-is-mobile="N">
                            <div class="widget padding" data-height="34" style="margin-top:0px; margin-bottom:0px;">
                                <div id="padding_w20201122dbd9a9af8e44e" style="width:100%; min-height:1px; height:34px; "></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--카테고리 버튼-->
            <div class="card-tools">
                <ul class="nav nav-pills ml-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#select-all" data-toggle="tab">전체조회</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#select-dog" data-toggle="tab">강아지</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#select-cat" data-toggle="tab">고양이</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#select-animals" data-toggle="tab">다른 반려동물</a>
                    </li>
                </ul>
            </div>                           <!-- 동물선택 -->
            <div class="form-group" style="display: inline-block; width: 240px;">
                <label style="display: inline-block; width: 70px;">상태</label>
                <select class="form-control select1" style="display: inline-block; width: 150px;">
                    <option selected="selected">선택</option>
                    <option>공고중</option>
                    <option>보호중</option>
                </select>
            </div>
            <div class="form-group" style="display: inline-block; width: 240px;">
                <label style="display: inline-block; width: 70px;">성별</label>
                <select class="form-control select1" style="display: inline-block; width: 150px;">
                    <option selected="selected">선택</option>
                    <option>남자</option>
                    <option>여자</option>
                </select>
            </div>
            <div class="form-group" style="display: inline-block; width: 240px;">
                <label style="display: inline-block; width: 70px;">크기</label>
                <select class="form-control select1" style="display: inline-block; width: 150px;">
                    <option selected="selected">선택</option>
                    <option>소(8kg미만)</option>
                    <option>중(8~18kg미만)</option>
                    <option>대(18kg이상)</option>
                </select>
            </div>
            <div class="form-group" style="display: inline-block; width: 240px;">
                <label style="display: inline-block; width: 70px;">연령</label>
                <select class="form-control select1" style="display: inline-block; width: 150px;">
                    <option selected="selected">선택</option>
                    <option>6개월</option>
                    <option>7개월~2살</option>
                    <option>3살~8살</option>
                    <option>9살 이상</option>
                </select>
            </div>
            <div class="searchButton">
                <button id="searchbtn">검색</button>
            </div>
<%--            <div doz_type="inside" class="inside"><div doz_type="row" doz_grid="12" doz_flexible="Y" class="doz_row"><div doz_type="grid" doz_grid="4" doz_clear="Y" doz_order="1" doz_flexible="N" doz_xdz="4" class="col-dz col-dz-4  col-xdz col-xdz-4 col-xdz-clear"><div doz_type="widget" id="w20201114dbcd0d69a9551"><div class="_widget_data " data-widget-name="버튼" data-widget-type="button" data-widget-anim="none" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N"><div class="widget button txt_b">--%>
<%--                <div class="button_wrap btn-blocked">--%>
<%--                    <div class="btn-group "><a class=" btn btn_427a58539b301  btn-lg  btn-default _fade_link  " href="/42?keyword_type=all&amp;keyword=%EA%B0%95%EC%95%84%EC%A7%80" style=" border-radius:0px">강아지</a></div>	</div>--%>
<%--                     </div>--%>
<%--                   </div>--%>
<%--               </div>--%>
<%--            </div>--%>
<%--                <div doz_type="grid" doz_grid="4" doz_clear="Y" doz_order="2" doz_flexible="N" doz_xdz="4" class="col-dz col-dz-4  col-xdz col-xdz-4 col-xdz-clear"><div doz_type="widget" id="w20201114fff3c51cb9d61"><div class="_widget_data " data-widget-name="버튼" data-widget-type="button" data-widget-anim="none" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N"><div class="widget button txt_b">--%>
<%--                <div class="button_wrap btn-blocked">--%>
<%--                    <div class="btn-group "><a class=" btn btn_427a58539b301  btn-lg  btn-default _fade_link  " href="localhost:8000/pages/adopt/#/42?keyword_type=all&amp;keyword=%EA%B3%A0%EC%96%91%EC%9D%B4" style=" border-radius:0px">고양이</a></div>	</div>--%>
<%--            </div></div></div></div>--%>
<%--                <div doz_type="grid" doz_grid="4" doz_clear="Y" doz_order="3" doz_flexible="N" doz_xdz="4" class="col-dz col-dz-4  col-xdz col-xdz-4 col-xdz-clear"><div doz_type="widget" id="w20201114848dfb26f13dc"><div class="_widget_data " data-widget-name="버튼" data-widget-type="button" data-widget-anim="none" data-widget-anim-duration="0.7" data-widget-anim-delay="0" data-widget-parent-is-mobile="N"><div class="widget button txt_b">--%>
<%--                <div class="button_wrap btn-blocked">--%>
<%--                    <div class="btn-group "><a class=" btn btn_427a58539b301  btn-lg  btn-default _fade_link  " href="https://localhost:8000/pages/adopt/#_type=all&amp;keyword=%EB%8B%A4%EB%A5%B8%EB%B0%98%EB%A0%A4%EB%8F%99%EB%AC%BC" style=" border-radius:0px">다른 반려동물</a></div>	</div>--%>
<%--            </div></div></div></div></div></div>--%>
            <div class="widget padding" data-height="28" style="margin-top:0px; margin-bottom:0px;">
                <div id="padding_w20200824547b807b4a5d7" style="width:100%; min-height:1px; height:28px; "></div>
            </div>
<%--            <div class="dropdown">--%>
<%--                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                    상태--%>
<%--                </button>--%>
<%--                <ul class="dropdown-statement">--%>
<%--                    <li><a class="dropdown-statement1" href="#">공고중 123456</a></li>--%>
<%--                    <li><a class="dropdown-statement2" href="#">보호중</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--            <div class="dropdown">--%>
<%--                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                    성별--%>
<%--                </button>--%>
<%--                <ul class="dropdown-sex">--%>
<%--                    <li><a class="dropdown-sex1" href="#">여자</a></li>--%>
<%--                    <li><a class="dropdown-sex2" href="#">남자</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--            <div class="dropdown">--%>
<%--                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                    크기--%>
<%--                </button>--%>
<%--                <ul class="dropdown-size">--%>
<%--                    <li><a class="dropdown-size" href="#">소(8kg미만)</a></li>--%>
<%--                    <li><a class="dropdown-size" href="#">중(8~18kg미만)</a></li>--%>
<%--                    <li><a class="dropdown-size" href="#">대(18kg이상)</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--            <div class="dropdown">--%>
<%--                <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">--%>
<%--                    연령--%>
<%--                </button>--%>
<%--                <ul class="dropdown-size">--%>
<%--                    <li><a class="dropdown-size" href="#">6개월</a></li>--%>
<%--                    <li><a class="dropdown-size" href="#">7개월~2살</a></li>--%>
<%--                    <li><a class="dropdown-size" href="#">3살~8살</a></li>--%>
<%--                    <li><a class="dropdown-size" href="#">9살 이상</a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
            <div class="card-body">
                <div class="tab-content p-0">
                    <!-- Morris chart - Sales -->
                    <div class="chart tab-pane active" id="select-all"
                         style="position: relative; height: 100%;">
                        <div class="widget padding" data-height="28" style="margin-top:0px; margin-bottom:0px;">
                            <div id="padding_table" style="width:100%; min-height:1px; height:28px;"></div>
                        </div>
                        <table class="table table-striped table-bordered table-hover dt-responsive">
                            <thead>
                            <tr>
                                <th>사진</th>
                                <th>동물이름</th>
                                <th>종류</th>
                                <th>성별</th>
                                <th>중성화</th>
                                <th>생년월일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td> <div id="img_area1">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>전체</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area2">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area3">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_are4">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area5">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area6">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area7">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area8">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area9">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area10">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="chart tab-pane" id="select-dog" style="position: relative; height: 100%;">
                        <div class="widget padding" data-height="28" style="margin-top:0px; margin-bottom:0px;">
                            <div id="padding_table" style="width:100%; min-height:1px; height:28px;"></div>
                        </div>
                        <table class="table table-striped table-bordered table-hover dt-responsive">
                            <thead>
                            <tr>
                                <th>사진</th>
                                <th>동물이름</th>
                                <th>종류</th>
                                <th>성별</th>
                                <th>중성화</th>
                                <th>생년월일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td> <div id="img_area1">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area2">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area3">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_are4">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area5">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area6">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area7">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area8">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area9">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area10">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="chart tab-pane" id="select-cat" style="position: relative; height: 100%;">
                        <div class="widget padding" data-height="28" style="margin-top:0px; margin-bottom:0px;">
                            <div id="padding_table" style="width:100%; min-height:1px; height:28px;"></div>
                        </div>
                        <table class="table table-striped table-bordered table-hover dt-responsive">
                            <thead>
                            <tr>
                                <th>사진</th>
                                <th>동물이름</th>
                                <th>종류</th>
                                <th>성별</th>
                                <th>중성화</th>
                                <th>생년월일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td> <div id="img_area1">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>고양이</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area2">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area3">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_are4">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area5">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area6">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area7">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area8">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area9">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area10">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="chart tab-pane" id="select-animals" style="position: relative; height: 100%;">
                        <div class="widget padding" data-height="28" style="margin-top:0px; margin-bottom:0px;">
                            <div id="padding_table" style="width:100%; min-height:1px; height:28px;"></div>
                        </div>
                        <table class="table table-striped table-bordered table-hover dt-responsive">
                            <thead>
                            <tr>
                                <th>사진</th>
                                <th>동물이름</th>
                                <th>종류</th>
                                <th>성별</th>
                                <th>중성화</th>
                                <th>생년월일</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td> <div id="img_area1">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>동물들</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area2">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area3">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_are4">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area5">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area6">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area7">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area8">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area9">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            <tr>
                                <td> <div id="img_area10">
                                    <img src="../img/bulldog.svg" class="img-fluid img-thumbnail" alt="..."></div></td>
                                <td>마루</td>
                                <td>개</td>
                                <td>여</td>
                                <td>O</td>
                                <td>2022 추정</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div><!-- /.card-body -->

            </div>
        </section>
<div>
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

