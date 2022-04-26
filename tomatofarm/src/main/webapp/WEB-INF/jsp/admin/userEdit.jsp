<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../include/header.jsp"/>

<div class="mainContent">
    <a class="backArrow" href="/admin/directory"><button class="btn btn-primary"><i class="fa fa-arrow-left"></i></button></a>
    <h1>${user.firstName} ${user.lastName}</h1>
    <h3>User's plots:</h3>
    <table class="table" id="userPlotTable">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Soil type</th>
            <th scope="col">Cultivation style</th>
            <th scope="col">Filled</th>
            <th scope="col">Available</th>
            <th scope="col">Slots Total</th>
            <th scope="col">Edit</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="plot" items="${userPlots}">
            <tr>
                <th scope="row">${plot.id}</th>
                <td>${plot.soilMakeup}</td>
                <td>${plot.cultivationStyle}</td>
                <td>${plot.spacesTaken}</td>
                <td>${plot.spacesTotal - plot.spacesTaken}</td>
                <td>${plot.spacesTotal}</td>
                <td><a href="/plots/editPlot/${plot.id}">
                    <button class="btn btn-primary">edit</button>
                </a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/admin/directory">
        <button class="btn btn-primary">Back</button>
    </a>
    <hr>
    <h3>Reassign a plot to this user</h3>
    <form action="/admin/assignPlot" method="get">
        <input type="hidden" name="userId" value="${user.id}">
        <select class="form-select" name="plotId"  id="plotId">
            <c:forEach var="plot" items="${allPlots}">
                <option value="${plot.id}">#${plot.id}, ${plot.soilMakeup}, ${plot.cultivationStyle}, assigned
                    to: ${plot.userFullname}</option>
            </c:forEach>
        </select>
        <button type="submit" class="btn btn-success">Assign to user</button>
    </form>
    <sec:authorize access="hasAuthority('ADMIN')">
        <hr>
        <h3>Edit user: (admin only)</h3>
        <p>${user.firstName} ${user.lastName}</p>
        <form action="/admin/userSubmit" method="GET">
            <input type="hidden" name="id" value="${form.id}">
            <label for="firstNameId">First name:</label>
            <input type="text" name="firstName" id="firstNameId" value="${form.firstName}">
            <c:forEach items='${bindingResult.getFieldErrors("firstName")}' var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>
            <label for="lastNameId">Last name:</label>
            <input type="text" name="lastName" id="lastNameId" value="${form.lastName}">
            <c:forEach items='${bindingResult.getFieldErrors("lastName")}' var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>
            <h3>Current permissions:</h3>
            <p>
            <c:forEach var="role" items="${userRoles}">
                    <button class="btn btn-danger">${role.userRole}</button>
                </c:forEach>
            </p>
            <h4>Edit permissions:</h4>
            <label for="adminCheckbox">Admin permissions?</label>
            <form:checkbox path="form.admin" id="adminCheckbox"/>
            <button class="btn btn-success" type="submit">Submit</button>
        </form>
        <c:if test="${bindingResult.hasErrors()}">
            <c:forEach items="${bindingResult.getAllErrors()}" var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>
        </c:if>
    </sec:authorize>
    <hr>
    <a href="/admin/directory"><button class="btn btn-primary">Back to all users</button></a>
</div>

<jsp:include page="../include/footer.jsp"/>

