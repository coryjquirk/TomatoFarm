<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>

<div class="mainContent">
    <a class="backArrow" href="/index">
        <button class="btn btn-primary"><i class="fa fa-arrow-left"></i></button>
    </a>
    <h2>All farm plots</h2>
    <a href="addPlot">
        <button class="btn btn-primary">Add new plot</button>
    </a>
    <p>Click Detail to see plants within the plot.</p>
    <table class="table" id="plotTable">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Soil type</th>
            <th scope="col">Cultivation style</th>
            <th scope="col">Assigned to</th>
            <th scope="col">Filled</th>
            <th scope="col">Available</th>
            <th scope="col">Spaces Total</th>
            <th scope="col">Details</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="plot" items="${allPlots}">
            <tr>
                <th scope="row">${plot.id}</th>
                <td>${plot.soilMakeup}</td>
                <td>${plot.cultivationStyle}</td>
                <td><a href="/admin/userEdit/${plot.userId}" class="userLink">${plot.userFullname}</a></td>
                <td id="spacesTaken">${plot.spacesTaken}</td>
                <td id="spacesAvailable"></td>
                <td id="spacesTotal">${plot.spacesTotal}</td>
                <td><a href="/plots/detail/${plot.id}">
                    <button class="btn btn-primary">View</button>
                </a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../include/footer.jsp"/>