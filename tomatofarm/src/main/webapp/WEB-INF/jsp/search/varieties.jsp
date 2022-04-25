<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>
<div class="mainContent">
    <a class="backArrow" href="/search/searchIndex"><button class="btn btn-primary"><i class="fa fa-arrow-left"></i></button></a>
    <h2>Search varieties</h2>
    <form action="/search/varieties" method="GET">
        <label for="varietyName">Variety name:</label>
        <input type="text" name="varietyName" id="varietyName" value="${varietyName}">
        <button class="btn btn-primary" type="submit">Go</button>
    </form>
    <form action="/search/varieties" method="GET">
        <label for="category">Category:</label>
        <select class="form-select" name="category" id="category">
            <option value=""></option>
            <c:forEach var="allCategories" items="${allCategories}">
                <option value="${allCategories}">${allCategories}</option>
            </c:forEach>
        </select>
        <button class="btn btn-primary" type="submit">Go</button>
    </form>
    <c:if test="${varietyResults.size() > 0}">
        <p>Results found: ${varietyResults.size()}</p>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Name</th>
                <th scope="col">Category</th>
                <th scope="col">Color</th>
                <th scope="col">Image</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="variety" items="${varietyResults}">
                <tr>
                    <th scope="row">${variety.id}</th>
                    <td>${variety.varietyName}</td>
                    <td>${variety.category}</td>
                    <td>${variety.color}</td>
                    <td>
                        <c:if test="${empty variety.imageUrl}">
                            <img class="varietyPhoto" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx-dxcV7IDLSkLS5ncGbsMT2KyphBDlargBg&usqp=CAU" alt="Card image cap">
                        </c:if>
                        <c:if test="${not empty variety.imageUrl}">
                            <img class="varietyPhoto" src="${variety.imageUrl}" alt="variety photo">
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
<jsp:include page="../include/footer.jsp"/>