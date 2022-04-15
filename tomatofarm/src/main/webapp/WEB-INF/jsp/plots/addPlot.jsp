<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="soils" scope="request" type="java.util.List"/>
<jsp:useBean id="userNames" scope="request" type="java.util.List"/>
<jsp:useBean id="cultivationStyles" scope="request" type="java.util.List"/>

<jsp:include page="../include/header.jsp" />
    <div class="mainContent">
        <h2>Add new plot</h2>
        <form id="plotForm">
            <label for="newPlotName">Select user:</label>
            <select name="newPlotName" id="newPlotName">
                <c:forEach var="userNames" items="${userNames}">
                    <option value="${userNames}">${userNames}</option>
                </c:forEach>
            </select>
            <label for="soilType">Choose a soil type:</label>
            <select name="soilType" id="soilType">
                <c:forEach var="soils" items="${soils}">
                    <option value="${soils}">${soils}</option>
                </c:forEach>
            </select>
            <label for="cultivationStyle">Choose a cultivation style:</label>
            <select name="cultivationStyle" id="cultivationStyle">
                <c:forEach var="cultivationStyles" items="${cultivationStyles}">
                    <option value="${cultivationStyles}">${cultivationStyles}</option>
                </c:forEach>
            </select>
            <label for="slotsTaken">Slots taken</label>
            <input type="number" name="slotsTaken" id="slotsTaken" min="1" max="500">
            <div id="hiddenTakenError"></div>
            <label for="slotsTotal">Total slots</label>
            <input type="number" name="slotsTotal" id="slotsTotal" min="1" max="500">
            <div id="hiddenTotalError"></div>
            <button type="submit" class="btn btn-primary" id="plotSBtn">Submit</button>
        </form>
        <a href="plots"><button class="btn btn-primary">Go back</button></a>
    </div>
    <div id="snackbar"><p id="snackTxt"></p></div>

<jsp:include page="../include/footer.jsp" />