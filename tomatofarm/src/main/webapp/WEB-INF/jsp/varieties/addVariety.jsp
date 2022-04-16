<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="categories" scope="request" type="java.util.List"/>
<jsp:include page="../include/header.jsp"/>
<div class="mainContent">
    <h1>Add Variety</h1>

    <form action="/variety/varietySubmit" method="get">
        <label for="varietyName">Variety name:</label>
        <input type="text" name="varietyName" id="varietyName" value="${form.varietyName}">

        <label for="color">Color:</label>
        <input type="text" name="color" id="color" value="${form.color}">

        <label for="category">Category:</label>
        <select name="category" id="category">
            <c:forEach var="categories" items="${categories}">
                <option value="${categories}">${categories}</option>
            </c:forEach>
        </select>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>

    <c:if test="${bindingResult.hasErrors()}">
        <c:forEach items='${bindingResult.getAllErrors()}' var="error">
            <div style="color:red;">${error.getDefaultMessage()}</div>
        </c:forEach>
    </c:if>

</div>
<jsp:include page="../include/footer.jsp"/>