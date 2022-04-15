<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="include/header.jsp"/>
<div class="mainContent">
    <h1>Variety</h1>

    <form action="/variety/varietySubmit" method="get">
        Name: <input type="text" name="varietyName" value="${form.varietyName}">

        Color: <input type="text" name="color" value="${form.color}">

        Category: <input type="text" name="category" value="${form.category}">

        <button type="submit">Submit</button>
    </form>

    <c:if test="${bindingResult.hasErrors()}">
        <c:forEach items='${bindingResult.getAllErrors()}' var="error">
            <div style="color:red;">${error.getDefaultMessage()}</div>
        </c:forEach>
    </c:if>

</div>
<jsp:include page="include/footer.jsp"/>