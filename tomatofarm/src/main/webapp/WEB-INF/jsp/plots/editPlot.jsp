<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="../include/header.jsp"/>

<div class="mainContent">
    <a class="backArrow" href="/plots/detail/${form.id}"><button class="btn btn-primary"><i class="fa fa-arrow-left"></i></button></a>
    <sec:authorize access="hasAuthority('ADMIN')">
        <h2>Edit plot</h2>
        <p>Plot #${form.id}</p>
        <form action="/plots/plotEditSubmit" method="GET" id="plotForm">
            <input type="hidden" name="id" value="${form.id}">

            <label for="userId">User:</label>
            <select class="form-select" name="userId" id="userId">
                <c:forEach items="${allUsers}" var="allUsers">
                    <option value="${allUsers.id}">${allUsers.firstName} ${allUsers.lastName}</option>
                </c:forEach>
            </select>
            <label for="soilMakeup">Soil makeup:</label>
            <select class="form-select" name="soilMakeup" id="soilMakeup">
                <c:forEach items="${allSoils}" var="allSoils" >
                    <option value="${allSoils}">${allSoils}</option>
                </c:forEach>
            </select>
            <label for="cultivationStyle">Cultivation style:</label>
            <select class="form-select" name="cultivationStyle" id="cultivationStyle">
                <c:forEach var="allCultivationStyles" items="${allCultivationStyles}">
                    <option value="${allCultivationStyles}">${allCultivationStyles}</option>
                </c:forEach>
            </select>
            <p><strong>Spaces currently occupied by plants:</strong> ${form.spacesTaken}</p>
            <label for="spacesTotal">Total spaces:</label>
            <p>(must be greater than # of spaces currently occupied by plants)</p>
            <input type="number" name="spacesTotal" id="spacesTotal" min="1" max="1000" value="${form.spacesTotal}">
            <button type="submit" class="btn btn-success" id="plotSBtn">Submit</button>
        </form>
        <c:if test="${bindingResult.hasErrors()}">
            <c:forEach items="${bindingResult.getAllErrors()}" var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>
        </c:if>
    </sec:authorize>
    <sec:authorize access="!hasAuthority('ADMIN')">
        <p>Not authorized.</p>
        <a href="/index">
            <button class="btn-primary">Home</button>
        </a>
    </sec:authorize>
    <hr>
    <a href="/plots/detail/${form.id}"><button class="btn btn-primary">Back to plot detail</button></a>
    <a href="/plots/allPlots"><button class="btn btn-primary">Back to all plots</button></a>
</div>

<jsp:include page="../include/footer.jsp"/>