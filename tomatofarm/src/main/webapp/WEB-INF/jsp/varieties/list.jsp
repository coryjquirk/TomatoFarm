<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<div class="mainContent">
    <h2>Tomato varieties catalog</h2>
    <a href="addVariety">
        <button class="btn btn-primary">Add new variety</button>
    </a>
    <a href="grid">
        <button class="btn btn-secondary">Grid view</button>
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
                <td><img src="${variety.imageUrl}" class="varietyPhoto" alt="variety photo"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../include/footer.jsp"/>