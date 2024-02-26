<%--
  Created by IntelliJ IDEA.
  User: janghwan
  Date: 2/25/24
  Time: 4:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.util.BSPageBar" %>
<%
    int numPerPage = 5;
    int nowPage = 0;
    if(request.getParameter("nowPage")!=null){
        nowPage = Integer.parseInt(request.getParameter("nowPage"));
    }
%>
