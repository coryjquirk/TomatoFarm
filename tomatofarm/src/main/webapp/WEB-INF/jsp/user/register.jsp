<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp" />

<div class="mainContent">
<c:if test="${empty form.id}">
   <h1>Sign Up</h1>
</c:if>

<c:if test="${not empty form.id}">
    <h1>Edit User</h1>
</c:if>

<form action="/user/registerSubmit"   method="get">
    <input type="hidden" name="id" value="${form.id}">

    Email <input type="text" name="email" id="emailId" value="${form.email}">

    <c:forEach items='${bindingResult.getFieldErrors("email")}' var="error">
        <div style="color:red;">${error.getDefaultMessage()}</div>
    </c:forEach>

    First Name <input type="text" name="firstName" id="firstNameId" value="${form.firstName}">

    <c:forEach items='${bindingResult.getFieldErrors("firstName")}' var="error">
        <div style="color:red;">${error.getDefaultMessage()}</div>
    </c:forEach>

    Last Name <input type="text" name="lastName" id="lastNameId" value="${form.lastName}">

    <c:forEach items='${bindingResult.getFieldErrors("lastName")}' var="error">
        <div style="color:red;">${error.getDefaultMessage()}</div>
    </c:forEach>

    Password <input type="text" name="password" id="passwordId"  value="${form.password}">

    <c:forEach items='${bindingResult.getFieldErrors("password")}' var="error">
        <div style="color:red;">${error.getDefaultMessage()}</div>
    </c:forEach>

    Confirm Password <input type="text"
             name="confirmPassword" id="confirmPasswordId"  value="${form.confirmPassword}">
    <c:forEach items='${bindingResult.getFieldErrors("confirmPassword")}' var="error">
        <div style="color:red;">${error.getDefaultMessage()}</div>
    </c:forEach>
    <button class="btn btn-primary" type="submit">Submit</button>
</form>


<c:if test="${bindingResult.hasErrors()}">

    <c:forEach items="${bindingResult.getAllErrors()}" var="error">
        <div style="color:red;">${error.getDefaultMessage()}</div>
    </c:forEach>
</c:if>
</div>



<jsp:include page="../include/footer.jsp" />

