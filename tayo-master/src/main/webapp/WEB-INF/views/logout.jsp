<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style></style>
</head>
<body>

</body>
<script>
alert("로그아웃 되셨습니다.");
sessionStorage.clear();
/* self.location.href='./'; */
window.location.replace('./');
</script>
</html>