<jsp:include page="../include/header.jsp" />

<form action="/login/loginSubmit" method="POST">

    Username : <input type="text" name="username">
    Password : <input type="text" name="password">
    <button type="submit">Submit</button>
</form>


<jsp:include page="../include/footer.jsp" />