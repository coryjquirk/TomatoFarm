<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp" />
<jsp:useBean id="allPlots" scope="request" type="java.util.List"/>

<div class="mainContent">
    <h2>All farm plots</h2>
    <table class="table" id="plotTable">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Soil type</th>
            <th scope="col">Cultivation style</th>
            <th scope="col">Steward</th>
            <th scope="col">Filled</th>
            <th scope="col">Available</th>
            <th scope="col">Slots Total</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="plot" items="${allPlots}">
            <tr>
                <th scope="row">${plot.id}</th>
                <td>${plot.soilMakeup}</td>
                <td>${plot.cultivationStyle}</td>
                <td>${plot.userId}</td>
                <td>${plot.spacesTaken}</td>
                <td>${plot.spacesTotal - plot.spacesTaken}</td>
                <td>${plot.spacesTotal}</td>
            </tr>
        </c:forEach>
        </tbody>
            </table>
    <a href="addPlot"><button>Add new plot</button></a>
</div>

<jsp:include page="../include/footer.jsp" />