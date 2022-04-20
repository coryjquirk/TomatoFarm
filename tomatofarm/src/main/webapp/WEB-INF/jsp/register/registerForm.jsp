<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../include/header.jsp"/>

<div class="mainContent">
    <sec:authorize access="!isAuthenticated()">
        <h1>Sign Up</h1>
        <form action="/register/registerSubmit" method="get">
            <input type="hidden" name="id" value="${form.id}">

            <label for="emailId">Email</label>
            <input type="text" name="email" id="emailId" value="${form.email}">
            <c:forEach items='${bindingResult.getFieldErrors("email")}' var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>

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

            <label for="passwordId">Password:</label>
            <input type="text" name="password" id="passwordId" value="${form.password}">
            <c:forEach items='${bindingResult.getFieldErrors("password")}' var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>
<%--            TODO: mask password characters in input box.--%>
            <label for="confirmPasswordId">Confirm password:</label>
            <input type="text"
                   name="confirmPassword" id="confirmPasswordId" value="${form.confirmPassword}">
            <c:forEach items='${bindingResult.getFieldErrors("confirmPassword")}' var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>
            <p>* all fields required</p>
            <button class="btn btn-primary" type="submit">Submit</button>
            <p>You'll be redirected to the login page upon successful registration.</p>
        </form>
        <c:if test="${bindingResult.hasErrors()}">
            <c:forEach items="${bindingResult.getAllErrors()}" var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>
        </c:if>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <h3>You're already registered.</h3>
        <a href="/index">Home</a>
    </sec:authorize>
</div>

<jsp:include page="../include/footer.jsp"/>

