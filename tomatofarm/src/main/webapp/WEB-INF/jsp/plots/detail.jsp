<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../include/header.jsp"/>

<div class="mainContent">
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
            <td>${plot.userFullname}</td>
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
    <form>
<%--        TODO: define controller logic for this form to add plant to plot.--%>
        <h4>Add plant to plot</h4>
        <label for="varietyName">Choose variety:</label>
        <select class="form-select" name="varietyName" id="varietyName">
            <c:forEach items="${allVarieties}" var="variety">
                <option value="${variety.id}">${variety.varietyName}</option>
            </c:forEach>
        </select>
        <label for="plantsTotal">Quantity:</label>
        <input type="number" name="plantsTotal" id="plantsTotal" min="1" max="1000" placeholder="0"
               value="${form.plantsTotal}">
        <button class="btn btn-secondary">Add</button>
    </form>
    <%--    TODO: add logic so that only assigned user can edit plants.--%>
    <h3>Plants in this plot</h3>
    <c:forEach items="${plants}" var="plant">
        <div class="plantCard">
            <div class="imgCol">
                <img src="${plant.imageUrl}">
            </div>
            <div class="infoCol">
                <p>${plant.varietyName}</p>
                <p>${plant.category}<span id="plantIdInCard">ID: ${plant.id} </span></p>
            </div>
            <form>
                <button class="btn btn-secondary"  id="deleteBtn" >Delete</button>
            </form>
        </div>
    </c:forEach>

    <hr>
    <a href="/plots/allPlots">
        <button class="btn btn-primary">Back to plot list</button>
    </a>
</div>

<jsp:include page="../include/footer.jsp"/>