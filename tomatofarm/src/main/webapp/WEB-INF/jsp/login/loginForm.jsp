<jsp:include page="../include/header.jsp"/>
<div id="loginPage">
    <div class="mainContent">
        <h2>Login</h2>
        <%--    Spring Security is taking care of a lot for us here:--%>
        <%--    form must have method="POST"--%>
        <form action="/login/loginSubmit" method="POST">
            <%--    input has to have name="username"--%>
            <%--    leaving label as "Email" for user experience    --%>
            <label for="username">Email:</label>
            <input type="text" name="username" id="username" placeholder="email">
            <label for="password">Password:</label>
            <input type="password" name="password" id="password" placeholder="password">
            <p id="showPasswordLabel"><input type="checkbox" onclick="showPasswordLogin()" id="showPasswordCheckbox">Show
                Password</p>
            <%--    we submit to a controller behind the scenes--%>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>