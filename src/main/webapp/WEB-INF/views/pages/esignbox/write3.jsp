<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<form id="adoptForm1" action="eSignDraft/draftInsert">
    <table class="table table-borderless">
        <thead>
        <tr>
            <th>동물이름</th>
            <th><input type="text" class="form-control" id="ANIMAL_NM" placeholder=></th>
        </tr>
        <tr>
            <th>생년월일</th>
            <th><input type="text" class="form-control" id="ANIMAL_BDATE" placeholder=></th>
        </tr>
        <tr>
            <th>축종</th>
            <th><input type="text" class="form-control" id="ANIMAL_SPECIES" placeholder="개, 고양이, 토끼..."></th>
        </tr>
        <tr>
            <th>체중</th>
            <th><input type="text" class="form-control" id="ANIMAL_WEIGHT" placeholder=></th>
        </tr>
        <tr>
            <th>성별</th>
            <th><select class="form-select" aria-label="default select example" id="ANIMAL_SEX">
                <option selected>성별</option>
                <option value="1">F</option>
                <option value="2">M</option>
            </select></th>
        </tr>
        <tr>
            <th>중성화</th>
            <th><select class="form-select" aria-label="default select example" id="ANIMAL_NEUT">
                <option selected>중성화 여부</option>
                <option value="1">O</option>
                <option value="2">X</option>
            </select></th>
        </tr>
        <tr>
            <th>신청자</th>
            <th><input type="text" class="form-control" id="MASTERPK" placeholder=""></th>
        </tr>
    </table>
</form>
<div class="text-center">
    <button type="submit" class="btn btn-danger" style="margin-right: 10px;">취소</button>
    <button type="submit" class="btn btn-primary">등록</button>
</div>
