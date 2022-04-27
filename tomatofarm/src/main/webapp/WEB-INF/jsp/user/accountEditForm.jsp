<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../include/header.jsp"/>

<div class="mainContent">
    <sec:authorize access="isAuthenticated()">
        <h1>Account Options</h1>
        <form action="/user/accountEditSubmit" method="get">
            <input type="hidden" name="id" value="${form.id}">
            <h3>Edit name</h3>
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

            <h3>Change password</h3>
            <label for="newPasswordId">New password:</label>
            <input type="password" name="newPassword" id="newPasswordId" value="${form.newPassword}" placeholder="password">
            <c:forEach items='${bindingResult.getFieldErrors("newPassword")}' var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>

            <label for="confirmPasswordId">Confirm new password:</label>
            <input type="password"
                   name="confirmPassword" id="confirmPasswordId" value="${form.confirmPassword}" placeholder="confirm password">
            <p id="showPasswordLabel"><input type="checkbox" onclick="showPasswordChange()"
                                             id="showPasswordCheckbox">Show Passwords</p>
            <c:forEach items='${bindingResult.getFieldErrors("confirmPassword")}' var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>
            <button class="btn btn-primary" type="submit">Save</button>
        </form>
        <hr>
        <h3>Current permissions:</h3>
        <p>
            <c:forEach var="role" items="${userRoles}">
                <button class="btn btn-danger">${role.userRole}</button>
            </c:forEach>
        </p>
        <a href="/admin/userEdit/${user.id}">
            <button class="btn btn-secondary">User detail page</button>
        </a>
        <c:if test="${bindingResult.hasErrors()}">
            <c:forEach items="${bindingResult.getAllErrors()}" var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>
        </c:if>
    </sec:authorize>
    <sec:authorize access="!isAuthenticated()">
        <p>Not authorized.</p>
        <a href="/register/registerForm">
            <button class="btn-primary">Register</button>
        </a>
    </sec:authorize>
</div>

<jsp:include page="../include/footer.jsp"/>

