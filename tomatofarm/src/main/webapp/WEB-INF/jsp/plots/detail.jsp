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
                    <td><a href="/plots/editPlot/${plot.id}"><button class="btn btn-primary">Edit</button></a></td>
                </tr>
            </tbody>
        </table>
    <hr>
    <form>
        <h4>Add plant to plot</h4>
        <label for="varietyName">Choose variety:</label>
        <select name="varietyName" id="varietyName">
            <c:forEach items="${varieties}" var="variety" >
                <option value="${variety.id}">${variety.varietyName}</option>
            </c:forEach>
        </select>
        <label for="plantsTotal">Quantity:</label>
        <input type="number" name="plantsTotal" id="plantsTotal" min="1" max="1000" placeholder="0" value="${form.plantsTotal}">
        <button class="btn btn-secondary">Add</button>
    </form>
<%--    TODO: add logic so that only assigned user can edit plants.--%>
    <h2>Plants in plot</h2>
    <div class="card">
        <img class="card-img-top" src="https://www.seedsavers.org/site/img/seo-images/0981A-speckled-roma-tomato-organic.jpg" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">Name: speckled roman</h5>
            <p class="card-text">Category: roma</p>
            <p class="card-text">Color: red-orange</p>
            <form>
                <p class="card-text">Qty: 5</p>
                <input type="number" name="plantsInPlotQty" id="plantsInPlotQty" min="1" max="1000" placeholder="0" value="${form.plantsInPlotQty}">
                <button class="btn btn-secondary">Save</button>
            </form>
<%--            <a href="#" class="btn btn-primary">Go somewhere</a>--%>
        </div>
    </div>
    <hr>
    <a href="/plots/allPlots"><button class="btn btn-primary">Back to plot list</button></a>
</div>

<jsp:include page="../include/footer.jsp"/>