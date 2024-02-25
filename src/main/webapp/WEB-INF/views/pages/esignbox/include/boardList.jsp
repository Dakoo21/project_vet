<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="container">
    <!-- 검색기 끝 -->
    <!-- 회원목록 시작 -->
    <div class='board-list'>
        <table class="table table-hover">
            <thead>
            <tr>
                <th width="10%">문서번호</th>
                <th width="40%">제목</th>
                <th width="20%">기안자</th>
                <th width="15%">기안일</th>
                <th width="15%">구분</th>
                <th width="15%">상태</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><%=rmap.get("B_NO")%></td>
                <td>
                    <a href="boardDetail?b_no=<%=rmap.get("B_NO")%>">
                        <%=rmap.get("B_TITLE")%>
                    </a>
                </td>
                <td><%=rmap.get("B_FILE")%></td>
                <td><%=rmap.get("B_WRITER")%></td>
                <td><%=rmap.get("B_HIT")%></td>
            </tr>
            </tbody>
        </table>
        <hr />
        <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
        <div style="display:flex;justify-content:center;">
            <ul class="pagination">

            </ul>
        </div>
        <!-- [[ Bootstrap 페이징 처리  구간  ]] -->
        <div class='board-footer'>
            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#boardForm">
                기안하기
            </button>
        </div>
    </div>
</div>