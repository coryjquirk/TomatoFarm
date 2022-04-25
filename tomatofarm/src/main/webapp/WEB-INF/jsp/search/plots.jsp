<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>
<div class="mainContent">
    <a class="backArrow" href="/search/searchIndex"><button class="btn btn-primary"><i class="fa fa-arrow-left"></i></button></a>
    <h2>Search plots</h2>
    <form action="/search/plots" method="GET">
        <label for="soilMakeup">Soil type:</label>
        <select class="form-select" name="soilMakeup" id="soilMakeup">
            <option value=""></option>
            <c:forEach var="allSoils" items="${allSoils}">
                <option value="${allSoils}">${allSoils}</option>
            </c:forEach>
        </select>
        <button class="btn btn-primary goBtn" type="submit">Go</button>
    </form>
    <form action="/search/plots" method="GET">
        <label for="cultivationStyle">Cultivation style:</label>
        <select class="form-select" name="cultivationStyle" id="cultivationStyle">
            <option value=""></option>
            <c:forEach var="allCultivationStyles" items="${allCultivationStyles}">
                <option value="${allCultivationStyles}">${allCultivationStyles}</option>
            </c:forEach>
        </select>
        <button class="btn btn-primary goBtn" type="submit">Go</button>
    </form>
    <form action="/search/plots" method="GET">
        <label for="userId">User:</label>
        <select class="form-select" name="userId" id="userId">
            <option value=""></option>
            <c:forEach var="user" items="${allUsers}">
                <option value="${user.id}">${user.firstName} ${user.lastName}</option>
            </c:forEach>
        </select>
        <button class="btn btn-primary goBtn" type="submit">Go</button>
    </form>
    <c:if test="${plotResults.size() > 0}">
        <p>Results found: ${plotResults.size()}</p>
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
            <c:forEach var="plot" items="${plotResults}">
                <tr>
                    <th scope="row">${plot.id}</th>
                    <td>${plot.soilMakeup}</td>
                    <td>${plot.cultivationStyle}</td>
                    <td><a href="/admin/userEdit/${plot.userId}" class="userLink">${plot.userFullname}</a></td>
                    <td id="spacesTaken">${plot.spacesTaken}</td>
                    <td id="spacesAvailable"></td>
                    <td id="spacesTotal">${plot.spacesTotal}</td>
                    <td><a href="/plots/detail/${plot.id}"><button class="btn btn-primary">View</button></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
<jsp:include page="../include/footer.jsp"/>