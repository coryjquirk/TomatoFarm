<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../include/header.jsp"/>
<div class="mainContent">
    <sec:authorize access="hasAuthority('ADMIN')">
        <h2>Add new plot</h2>
        <form action="/plots/plotSubmit" method="GET" id="plotForm">
            <div style="margin-bottom: 10px;">
                <input type="hidden" name="id" value="${form.id}">
                <p>User:*</p>
                <select class="form-select" name="userId" id="userId">
                    <c:forEach items="${allUsers}" var="allUsers">
                        <option value="${allUsers.id}">${allUsers.firstName} ${allUsers.lastName}</option>
                    </c:forEach>
                </select>
            </div>
            <div style="display:inline-block; margin-bottom: 10px;">
                <p>Soil makeup:</p>

                <c:forEach var="allSoils" items="${allSoils}">
                    <div style="float:left; margin: 3px; padding:0 5px 0 10px; border: 1px solid grey; background-color: #ece4d3; border-radius: 3px;">
                        <input type="radio" name="soilMakeup" id="soilMakeupRadio" value="${allSoils}"/>
                        <label style="margin-right: 10px;" for="soilMakeupRadio">${allSoils}</label>
                    </div>
                </c:forEach>
            </div>
            <div style="display:inline-block">
                <p>Cultivation style:</p>

                <c:forEach var="cultivationStyle" items="${allCultivationStyles}">
                    <div style="float:left; margin: 3px; padding:0 5px 0 10px; border: 1px solid grey; background-color: #ece4d3; border-radius: 3px;">

                        <input style="float:left;" type="radio" name="cultivationStyle"
                               value="${cultivationStyle}" id="cultivationStyleRadio"/>
                        <label style="float:left; margin-right: 10px;"
                               for="cultivationStyleRadio">${cultivationStyle}</label>
                    </div>
                </c:forEach>
            </div>
            <label for="spacesTotal">Total spaces:*</label>
            <input type="number" name="spacesTotal" id="spacesTotal" min="1" max="1000" placeholder="0"
                   value="${form.spacesTotal}">
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
    <a href="/plots/allPlots">
        <button class="btn btn-primary">Back</button>
    </a>
</div>
<div id="snackbar"><p id="snackTxt"></p></div>

<jsp:include page="../include/footer.jsp"/>