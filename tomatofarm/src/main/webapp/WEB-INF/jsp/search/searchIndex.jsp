<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../include/header.jsp"/>

<div class="mainContent">
    <h2>Search</h2>
    <a href="/search/users">
        <div class="homeLauncher">
            <h3>
                <span>Users</span>
            </h3>
        </div>
    </a>
    <a href="/search/plots">
        <div class="homeLauncher">
            <h3>
                <span>Plots</span>
            </h3>
        </div>
    </a>
    <a href="/search/varieties">
        <div class="homeLauncher">
            <h3>
                <span>Varieties</span>
            </h3>
        </div>
    </a>
    <img src="https://res.cloudinary.com/dgwzirogr/image/upload/v1650584671/frontendSBA/dester_tomatoes_bxyh90.jpg"
         id="landingPhoto" alt="tray of Dester tomatoes">
</div>


<jsp:include page="../include/footer.jsp"/>