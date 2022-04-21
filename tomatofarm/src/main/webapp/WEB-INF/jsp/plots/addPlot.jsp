<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../include/header.jsp" />
    <div class="mainContent">
        <sec:authorize access="hasAuthority('ADMIN')">
        <h2>Add new plot</h2>
        <form action="/plots/plotSubmit" method="GET" id="plotForm">
            <input type="hidden" name="id" value="${form.id}">
            <label for="userId">User:*</label>
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
            <label for="spacesTotal">Total spaces:*</label>
            <input type="number" name="spacesTotal" id="spacesTotal" min="1" max="1000" placeholder="0" value="${form.spacesTotal}">
            <button type="submit" class="btn btn-success" id="plotSBtn">Submit</button>
        </form>
        <p><strong>* required fields</strong></p>
        <c:if test="${bindingResult.hasErrors()}">
            <c:forEach items='${bindingResult.getAllErrors()}' var="error">
                <div style="color:red;">${error.getDefaultMessage()}</div>
            </c:forEach>
        </c:if>

        </sec:authorize>
        <sec:authorize access="!hasAuthority('ADMIN')">
            <p>Must be logged in as Admin to add a new plot.</p>
            <a href="/index">
                <button class="btn btn-primary">Home</button>
            </a>
        </sec:authorize>
        <hr>
        <a href="/plots/plots"><button class="btn btn-primary">Back</button></a>
    </div>
    <div id="snackbar"><p id="snackTxt"></p></div>

<jsp:include page="../include/footer.jsp" />