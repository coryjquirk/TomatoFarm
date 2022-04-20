<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<div class="mainContent">
    <h2>All tomato varieties</h2>
    <a href="addVariety">
        <button class="btn btn-primary">Add new variety</button>
    </a>
    <a href="list">
        <button class="btn btn-secondary">List view</button>
    </a>
    <hr>
    <c:forEach var="variety" items="${varieties}">
        <div class="card">
            <img class="card-img-top" src="${variety.imageUrl}" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Name: ${variety.varietyName}</h5>
                <p class="card-text">Category: ${variety.category}</p>
                <p class="card-text">Color: ${variety.color}</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>
    </c:forEach>
</div>

<jsp:include page="../include/footer.jsp"/>