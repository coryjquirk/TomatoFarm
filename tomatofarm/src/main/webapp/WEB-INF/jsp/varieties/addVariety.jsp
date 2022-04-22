<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>
<div class="mainContent">
    <h1>Add Variety</h1>
    <form action="/variety/varietySubmit" method="GET">
        <input type="hidden" name="id" value="${form.id}">
        <label for="varietyName">Variety name:*</label>
        <input type="text" name="varietyName" id="varietyName" value="${form.varietyName}" placeholder="variety name">

        <label for="color">Color:</label>
        <input type="text" name="color" id="color" value="${form.color}" placeholder="color">

        <label for="category">Category:*</label>
        <select class="form-select" name="category" id="category">
            <c:forEach var="categories" items="${categories}">
                <option value="${categories}">${categories}</option>
            </c:forEach>
        </select>
        <label for="imageUrl">Image URL (can be blank)</label>
        <input type="text" name="imageUrl" id="imageUrl" placeholder="https://tomato.net/variety.jpg">
        <button type="submit" class="btn btn-success">Submit</button>
    </form>
    <p><strong>* required fields</strong></p>
    <c:if test="${bindingResult.hasErrors()}">
        <c:forEach items='${bindingResult.getAllErrors()}' var="error">
            <div style="color:red;">${error.getDefaultMessage()}</div>
        </c:forEach>
    </c:if>

</div>
<jsp:include page="../include/footer.jsp"/>