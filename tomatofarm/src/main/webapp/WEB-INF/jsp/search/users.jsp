<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>
<div class="mainContent">
    <a class="backArrow" href="/search/searchIndex"><button class="btn btn-primary"><i class="fa fa-arrow-left"></i></button></a>
    <h2>Search users</h2>
    <form action="/search/users" method="GET">
        <label for="firstName">First name:</label>
        <input type="text" name="firstName" id="firstName" value="${firstName}" placeholder="first name">
        <button class="btn btn-primary" type="submit">Go</button>
    </form>
    <form action="/search/users" method="GET">
        <label for="lastName">Last name:</label>
        <input type="text" name="lastName" id="lastName" value="${lastName}" placeholder="last name">
        <button class="btn btn-primary" type="submit">Go</button>
    </form>
    <form action="/search/users" method="GET">
        <label for="emailAddress">Email address:</label>
        <input type="text" name="emailAddress" id="emailAddress" value="${emailAddress}" placeholder="email address">
        <button class="btn btn-primary" type="submit">Go</button>
    </form>
    <c:if test="${not empty firstName || not empty lastName || not empty emailAddress}">
        <p>Results found: ${userResults.size()}</p>
        <table class="table">
            <tr scope="row">
                <th>Name</th>
                <th>Email</th>
                <th>Edit</th>
            </tr>
            <c:forEach items="${userResults}" var="user">
                <tr scope="row">
                    <td>${user.firstName} ${user.lastName}</td>
                    <td>${user.email}</td>
                    <td><a href="/admin/userEdit/${user.id}">
                        <button class="btn btn-primary">View user</button>
                    </a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>
<jsp:include page="../include/footer.jsp"/>