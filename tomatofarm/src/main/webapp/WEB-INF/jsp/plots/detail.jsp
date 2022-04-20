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
    <h2>Plants</h2>
    <a href="/plots/allPlots"><button class="btn btn-primary">Back to list</button></a>
</div>

<jsp:include page="../include/footer.jsp"/>