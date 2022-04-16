<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="../../include/header.jsp" />
<jsp:useBean id="allUsers" scope="request" type="java.util.List"/>

<div class="mainContent">
    <table class="table">
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Create Date</th>
        </tr>
        <c:forEach var="user" items="${allUsers}">
            <tr>
                <th scope="row">${user.id}</th>
                <td>${user.firstName} ${user.lastName}</td>
                <td>${user.email}</td>
                <td>${user.createDate}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<jsp:include page="../../include/footer.jsp" />