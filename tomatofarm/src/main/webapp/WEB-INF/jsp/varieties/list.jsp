<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<div class="mainContent" id="varietyPage">
    <a class="backArrow" href="/index"><button class="btn btn-primary"><i class="fa fa-arrow-left"></i></button></a>
    <h2>Tomato varieties catalog</h2>
    <a href="addVariety">
        <button class="btn btn-primary">Add new variety</button>
    </a>
    <a href="list" id="gridListToggle">
        <button class="btn btn-secondary"><i class="fas fa-th"></i></button>
    </a>
    <hr>
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
        <c:forEach var="variety" items="${varieties}">
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
</div>

<jsp:include page="../include/footer.jsp"/>