<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form method="post" id="f_totaldata" action="/CustomerDB/TotalDataInsert">
    <a href ="javascript:dataInsert()">등록</a>
</form>
<script>
    const dataInsert = () => {
        console.log("dataInsert");
        document.querySelector("#f_totaldata").submit();
    };
</script>