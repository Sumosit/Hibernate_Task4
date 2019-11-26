<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: erlan
  Date: 12.11.2019
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <c:set var="note" value="${note}"/>
    <form action="/editnotedo?id=${note.id}&author=${note.author}" method="post">
        <table class="table table-dark" cellpadding="20" style="font-size: 25px">
            <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Content</th>
                <th scope="col">Post Date</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th>${note.id}</th>
                <th><input name="content" type="text" placeholder="${note.content}"></th>
                <th>${note.postDate}</th>
            </tr>
            </tbody>
        </table>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
