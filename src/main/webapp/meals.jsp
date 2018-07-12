<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://topjava.javawebinar.ru/functions" %>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>--%>
<html>
<head>
    <title>Meal list</title>
    <style>
        .normal {
            color: green;
        }

        .exceeded {
            color: red;
        }

        dl {
            background: none repeat scroll 0 0 #FAFAFA;
            margin: 8px 0;
            padding: 0;
        }

        dt {
            display: inline-block;
            width: 170px;
        }

        dd {
            display: inline-block;
            margin-left: 8px;
            vertical-align: top;
        }
    </style>
</head>
<body>
<section>
    <h3><a href="index.html">Home</a></h3>
    <h2>Meals</h2>
    <a href="meals?action=create">Add Meal</a>
    <hr/>
    <h2>Фильтрация по дате/времени</h2>
    <form method="post" action="meals">
        <input type="hidden" name="action" value="filter">
        <input type="hidden" name="userId" value="${meal.userId}">
        <input type="hidden" name="id" value="${meal.id}">
        <dl>
            <dt>От даты:</dt>
            <dd><input type="date" value="${meal.getDate()}" name="dateFrom"></dd>
        </dl>
        <dl>
            <dt>До даты:</dt>
            <dd><input type="date" value="${meal.getDate()}" name="dateTo"></dd>
        </dl>
        <dl>
            <dt>От времени:</dt>
            <dd><input type="time" value="${meal.getTime()}" name="timeFrom"></dd>
        </dl>
        <dl>
            <dt>До времени:</dt>
            <dd><input type="time" value="${meal.getTime()}" name="timeTo"></dd>
        </dl>
        <button type="submit">Отфильтровать</button>
        <button onclick="window.history.back()" type="button">Отмена</button>
    </form>
    <br>
    <table border="1" cellpadding="8" cellspacing="0">
        <thead>
        <tr>
            <th>Date</th>
            <th>Description</th>
            <th>Calories</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <c:forEach items="${meals}" var="meal">
            <jsp:useBean id="meal" scope="page" type="ru.javawebinar.topjava.to.MealWithExceed"/>
            <tr class="${meal.exceed ? 'exceeded' : 'normal'}">
                <td>
                        <%--${meal.dateTime.toLocalDate()} ${meal.dateTime.toLocalTime()}--%>
                        <%--<%=TimeUtil.toString(meal.getDateTime())%>--%>
                        <%--${fn:replace(meal.dateTime, 'T', ' ')}--%>
                        ${fn:formatDateTime(meal.dateTime)}
                </td>
                <td>${meal.description}</td>
                <td>${meal.calories}</td>
                <td><a href="meals?action=update&id=${meal.id}">Update</a></td>
                <td><a href="meals?action=delete&id=${meal.id}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</section>
</body>
</html>