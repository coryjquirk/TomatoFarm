<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../include/header.jsp"/>

<div class="mainContent">
    <a class="backArrow" href="/plots/allPlots"><button class="btn btn-primary"><i class="fa fa-arrow-left"></i></button></a>
    <h2>Plot detail</h2>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Soil type</th>
            <th scope="col">Cultivation style</th>
            <th scope="col">Assigned to</th>
            <th scope="col">Filled</th>
            <th scope="col">Available</th>
            <th scope="col">Slots Total</th>
            <th scope="col">Detail</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row">${plot.id}</th>
            <td>${plot.soilMakeup}</td>
            <td>${plot.cultivationStyle}</td>
            <td><a href="/admin/userEdit/${plot.userId}" class="userLink">${plot.userFullname}</a></td>
            <td>${plot.spacesTaken}</td>
            <td>${plot.spacesTotal - plot.spacesTaken}</td>
            <td>${plot.spacesTotal}</td>
            <td><a href="/plots/editPlot/${plot.id}">
                <button class="btn btn-primary">Edit</button>
            </a></td>
        </tr>
        </tbody>
    </table>
    <hr>
    <form action="/plots/detail/addPlantSubmit" method="GET" id="addPlantForm">
        <h4>Add plant to plot</h4>
        <input type="hidden" name="plotId" value="${plot.id}">
        <label for="varietyName">Choose variety:</label>
        <select class="form-select" name="varietyId" id="varietyName">
            <c:forEach items="${allVarieties}" var="variety">
                <option name="varietyId" value="${variety.id}">${variety.varietyName}</option>
            </c:forEach>
        </select>
        <label for="plantsQty">Quantity:</label>
        <input type="number" name="plantsQty" id="plantsQty" min="1" max="1000" placeholder="0"
               value="${form.plantsTotal}">
        <button class="btn btn-secondary" type="submit">Add</button>
    </form>
    <hr>
    <h3>Plants in this plot</h3>
    <c:if test="${empty plants}">
        <p>Use form above to add a plant.</p>
    </c:if>
    <c:forEach items="${plants}" var="plant">
        <div class="plantCard">
            <div class="imgCol">
                <img src="${plant.imageUrl}">
            </div>
            <div class="infoCol">
                <p>${plant.varietyName}</p>
                <p><strong>${plant.category}</strong></p>
                <p id="plantIdInCard">${plant.id}</p>
            </div>
                <form action="/plots/deletePlant/${plant.id}" method="GET">
                    <input type="hidden" name="plantId" id="plantId" value="${plant.id}">
                    <button class="btn btn-secondary" id="deleteBtn" type="submit">Delete</button>
                </form>
        </div>
    </c:forEach>
    <hr>
    <a href="/plots/allPlots">
        <button class="btn btn-primary">Back to plot list</button>
    </a>
</div>

<jsp:include page="../include/footer.jsp"/>