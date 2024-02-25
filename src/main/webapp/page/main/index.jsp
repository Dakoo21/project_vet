<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 업로드 및 다운로드</title>
</head>
<body>
<h1>파일 업로드</h1>
<form method="post" action="/upload/files" enctype="multipart/form-data">
    <input type="file" name="file" accept=".txt,.pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx">
    <button type="submit">업로드</button>
</form>

<h1>파일 다운로드</h1>
<ul>
    <%-- pds 폴더 안에 있는 파일을 전부 나열합니다. --%>
    <% java.io.File folder = new java.io.File(getServletContext().getRealPath("/pds"));
        java.io.File[] fileList = folder.listFiles();
        for (java.io.File file : fileList) { %>
    <li><a href="/download/<%= file.getName() %>" download><%= file.getName() %></a></li>
    <% } %>
</ul>
</body>
</html>