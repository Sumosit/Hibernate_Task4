<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <form action="/addcar" method="post">
            NAME : <input type="text" name="name">
            PRICE : <input type="number" name="price">
            YEAR : <input type="number" name="year">
            <button>ADD CAR</button>
        </form>

        <table cellpadding="20">
            <tr>
                <td>
                    ID
                </td>
                <td>
                    NAME
                </td>
                <td>
                    PRICE
                </td>
                <td>
                    YEAR
                </td>
                <td>
                    READ MORE
                </td>
            </tr>
            <c:forEach items="${mashinalar}" var = "mash">
                <tr>
                    <td>
                        ${mash.id}
                    </td>
                    <td>
                        ${mash.name}
                    </td>
                    <td>
                        ${mash.price}
                    </td>
                    <td>
                        ${mash.year}
                    </td>
                    <td>
                        <a href="/readmore/${mash.id}">READ MORE</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

    </body>
</html>
