<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>재고관리</title>
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
                                <h1>재고목록</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">Projects</li>
                                </ol>
                            </div>
                        </div>
                    </div><!-- /.container-fluid -->
                    <!-- 검색기 시작 -->
                    <div class="row">
                        <div class="col-3">
                            <select id="gubun" class="form-select" aria-label="분류선택">
                                <option value="none">분류선택</option>
                                <option value="b_title">상품명</option>
                                <option value="b_writer">상품코드</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <input type="text" id="keyword" class="form-control" placeholder="검색어를 입력하세요"
                                   aria-label="검색어를 입력하세요" aria-describedby="btn_search" onkeyup="searchEnter()"/>
                        </div>
                        <div class="col-3">
                            <button id="btn_search" class="btn btn-danger" onClick="boardSearch()">검색</button>
                        </div>
                    </div>
                    <!--카테고리 버튼-->
                    <div class="card-tools">
                        <ul class="nav nav-pills ml-auto">
                            <li class="nav-item">
                                <a class="nav-link active" href="#select-all" data-toggle="tab">전체조회</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#select-products" data-toggle="tab">용품</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#select-food" data-toggle="tab">식품</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#select-drugs" data-toggle="tab">약품</a>
                            </li>
                        </ul>
                    </div>
                </section>
        <!-- Main content -->
        <section class="content">
            <!-- Default box -->
            <div class="card">
                <div class="card-body">
                    <div class="tab-content p-0">
                        <!-- Morris chart - Sales -->
                        <div class="chart tab-pane active" id="select-all"
                             style="position: relative; height: 100%;">
                            <table id="stocktableListAll" class="table table-striped projects">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" value="value"></th>
                                    <th style="width: 5%">
                                        상품코드
                                    </th>
                                    <th style="width: 10%">
                                        구분
                                    </th>
                                    <th style="width: 10%">
                                        이미지
                                    </th>
                                    <th style="width: 45%" class="text-center">
                                        상품명
                                    </th>
                                    <th style="width: 10%">
                                        입고가
                                    </th>
                                    <th style="width: 10%">
                                        판매가
                                    </th>
                                    <th style="width: 15%">
                                        재고량
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>전체조회</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar2.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar3.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar4.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar5.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar2.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar3.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar4.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar5.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                </tbody>

                            </table>
                        </div>
                        <div class="chart tab-pane" id="select-products" style="position: relative; height: 100%;">
                            <table id="stocktableListProducts" class="table table-striped projects">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" value="value"></th>
                                    <th style="width: 5%">
                                        상품코드
                                    </th>
                                    <th style="width: 10%">
                                        구분
                                    </th>
                                    <th style="width: 10%">
                                        이미지
                                    </th>
                                    <th style="width: 45%" class="text-center">
                                        상품명
                                    </th>
                                    <th style="width: 10%">
                                        입고가
                                    </th>
                                    <th style="width: 10%">
                                        판매가
                                    </th>
                                    <th style="width: 15%">
                                        재고량
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품조회</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar2.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar3.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar4.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar5.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar2.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar3.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar4.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar5.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                </tbody>

                            </table>
                        </div>
                        <div class="chart tab-pane" id="select-food" style="position: relative; height: 100%;">
                            <table id="stocktableListFood" class="table table-striped projects">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" value="value"></th>
                                    <th style="width: 5%">
                                        상품코드
                                    </th>
                                    <th style="width: 10%">
                                        구분
                                    </th>
                                    <th style="width: 10%">
                                        이미지
                                    </th>
                                    <th style="width: 45%" class="text-center">
                                        상품명
                                    </th>
                                    <th style="width: 10%">
                                        입고가
                                    </th>
                                    <th style="width: 10%">
                                        판매가
                                    </th>
                                    <th style="width: 15%">
                                        재고량
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>식품조회</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar2.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar3.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar4.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar5.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar2.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar3.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar4.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar5.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                </tbody>

                            </table>
                        </div>
                        <div class="chart tab-pane" id="select-drugs" style="position: relative; height: 100%;">
                            <table id="stocktableListDrugs" class="table table-striped projects">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" value="value"></th>
                                    <th style="width: 5%">
                                        상품코드
                                    </th>
                                    <th style="width: 10%">
                                        구분
                                    </th>
                                    <th style="width: 10%">
                                        이미지
                                    </th>
                                    <th style="width: 45%" class="text-center">
                                        상품명
                                    </th>
                                    <th style="width: 10%">
                                        입고가
                                    </th>
                                    <th style="width: 10%">
                                        판매가
                                    </th>
                                    <th style="width: 15%">
                                        재고량
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>약품조회</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar2.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar3.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar4.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar5.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar2.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar3.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar4.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" value="value1"></td>
                                    <td>ABC_0001</td>
                                    <td>용품</td>
                                    <td><li class="list-inline-item">
                                        <img alt="Avatar" class="table-avatar" src="../../dist/img/avatar5.png">
                                    </li></td>
                                    <td>상품명</td>
                                    <td>10,000</td>
                                    <td>20,000</td>
                                    <td>50</td>
                                </tr>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
                <div class="col-md-2">
                    <button type="button" class="btn btn-default">등록</button>
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
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables/dataTables.bootstrap.min.js"></script>

<script>
    $(function () {
        $('#stocktableList').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });
    });
</script>

<%@ include file="/include/footer.jsp"%>
</body>
</html>
