<jsp:include page="../include/header.jsp" />
<div class="mainContent">

    <h2>Login</h2>
<%--    method in this form has to be POST--%>
<form action="/login/loginSubmit" method="POST">
<%--    name has to be username--%>
    <label for="username">Username (email):</label>
    <input type="text" name="username" id="username" placeholder="email">
<%--            TODO: mask password characters in input box.--%>
    <label for="password">Password:</label>
    <input type="password" name="password" id="password" placeholder="password">

<%--    Spring security has its own controller behind the scenes that we submit to.--%>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>

</div>
<jsp:include page="../include/footer.jsp" />