<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp" />

<h1>Search</h1>

<br>
<form action="/user/search" method="GET">
    First Name : <input type="text" name="firstName" value="${firstName}">
    <button type="submit">Submit</button>
</form>

<br>

<c:if test="${not empty firstName}">
    <h5>Search Results Found ${usersModelKey.size()}</h5>
    <br>
</c:if>


<table class="table">
    <tr scope="row">
        <th>Email</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Edit</th>
    </tr>
    <c:forEach items="${usersModelKey}" var="user">
        <tr scope="row">
            <td>${user.email}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td><a href="/user/edit/${user.id}">Edit</a></td>
        </tr>
    </c:forEach>
</table>


<jsp:include page="../include/footer.jsp" />