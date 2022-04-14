<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="../../include/header.jsp" />
<jsp:useBean id="allUsers" scope="request" type="java.util.List"/>

<div class="mainContent">
    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Create Date</th>
        </tr>
        <c:forEach var="user" items="${allUsers}">
            <tr>
                <td>${user.firstName} ${user.lastName}</td>
                <td>${user.email}</td>
                <td>${user.createDate}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<jsp:include page="../../include/footer.jsp" />