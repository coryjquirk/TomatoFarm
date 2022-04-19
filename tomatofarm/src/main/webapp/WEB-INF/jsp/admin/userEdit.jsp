<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../include/header.jsp"/>

<div class="mainContent">
    <sec:authorize access="hasAuthority('ADMIN')">
        <h1>Editing User:</h1>
        <p>${user.firstName} ${user.lastName}</p>
        <form action="/admin/userSubmit" method="get">
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
            <p>Edit permissions</p>
            <label for="adminCheckbox">Grant admin?</label>
            <p>WARNING: this can only be undone on the back end by a SQL DBA.</p>
            <form:checkbox path="form.admin" id="adminCheckbox"/>
            <button class="btn btn-primary" type="submit">Submit</button>
        </form>
        <c:if test="${bindingResult.hasErrors()}">
            <c:forEach items="${bindingResult.getAllErrors()}" var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>
        </c:if>
    </sec:authorize>
    <hr>
    <h2>User's plots:</h2>
</div>

<jsp:include page="../include/footer.jsp"/>

