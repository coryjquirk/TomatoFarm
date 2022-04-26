<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<div class="mainContent" id="varietyPage">
    <a class="backArrow" href="/index">
        <button class="btn btn-primary"><i class="fa fa-arrow-left"></i></button>
    </a>
    <h2>Tomato varieties catalog</h2>
    <a href="addVariety">
        <button class="btn btn-primary">Add new variety</button>
    </a>
    <a href="list" id="gridListToggle">
        <button class="btn btn-secondary"><i class="fas fa-th-list"></i></button>
    </a>
    <hr>
    <c:forEach var="variety" items="${varieties}">
        <div class="card">
            <c:if test="${empty variety.imageUrl}">
                <img class="card-img-top"
                     src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx-dxcV7IDLSkLS5ncGbsMT2KyphBDlargBg&usqp=CAU"
                     alt="variety photo">
            </c:if>
            <c:if test="${not empty variety.imageUrl}">
                <img class="card-img-top" src="${variety.imageUrl}" alt="variety photo">
            </c:if>
            <div class="card-body">
                <h5 class="card-title">Name: ${variety.varietyName}</h5>
                <p class="card-text">Category: ${variety.category}</p>
                <p class="card-text">Color: ${variety.color}</p>
            </div>
        </div>
    </c:forEach>
</div>

<jsp:include page="../include/footer.jsp"/>