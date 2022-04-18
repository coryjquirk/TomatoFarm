<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />
<jsp:useBean id="allVarieties" scope="request" type="java.util.List"/>

<div class="mainContent">
    <h2>All tomato varieties</h2>
    <a href="addVariety"><button class="btn btn-primary">Add new variety</button></a>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Color</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="variety" items="${allVarieties}">
            <tr>
                <th scope="row">${variety.id}</th>
                <td>${variety.varietyName}</td>
                <td>${variety.category}</td>
                <td>${variety.color}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../include/footer.jsp" />