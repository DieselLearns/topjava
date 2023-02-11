<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 03.02.2023
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Meals</title>
</head>
<body>
    <h3><a href="index.html">Home</a></h3>
     <hr/>
    <table border="2" cellpadding="8" cellspacing="0">
        <caption>Таблица приёмов пищи</caption>
        <tr>
            <th> Date </th>
            <th> Description </th>
            <th> Calories </th>
        </tr>
        <jsp:useBean id="meals" scope="request" type="java.util.List"/>
        <c:forEach var = "meal" items ="${meals}">
            <jsp:useBean id="meal" type="ru.javawebinar.topjava.model.MealTo"/>
        <tr <c:choose>
            <c:when test="${meal.excess}"> style="color: red" </c:when>
            <c:otherwise> style="color: green" </c:otherwise>
            </c:choose>  >
                <td >
                    <c:out value="${meal.dateTime}"/>
                </td>
                <td ><c:out value="${meal.description}"/></td>
                <td ><c:out value="${meal.calories}"/></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
