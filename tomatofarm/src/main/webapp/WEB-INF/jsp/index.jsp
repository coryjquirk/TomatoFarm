<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="include/header.jsp"/>
<div id="landingPage">
    <div class="mainContent">
        <sec:authorize access="isAuthenticated()">
            <%--        TODO: "My Plots" page to show those assigned to the logged in user.--%>
            <a href="/plots/allPlots">
                <div class="homeLauncher">
                    <h3>
                        <span>Plots</span>
                    </h3>
                </div>
            </a>
            <a href="/varieties/grid">
                <div class="homeLauncher">
                    <h3>
                        <span>Tomato Varieties</span>
                    </h3>
                </div>
            </a>
            <a href="/admin/directory">
                <div class="homeLauncher">
                    <h3>
                        <span>People</span>
                    </h3>
                </div>
            </a>

            <a href="/login/logout">
                <div class="homeLauncher">
                    <h3>
                        <span>Logout</span>
                    </h3>
                </div>
            </a>
            <img src="https://res.cloudinary.com/dgwzirogr/image/upload/v1649013339/frontendSBA/orangegrape_wegqti.jpg"
                 id="landingPhoto" alt="tray of orange grape tomatoes">
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
            <a href="/login/login">
                <div class="homeLauncher">
                    <h3>
                        <span>Login</span>
                    </h3>
                </div>
            </a>
            <a href="/register/registerForm">
                <div class="homeLauncher">
                    <h3>
                        <span>Register</span>
                    </h3>
                </div>
            </a>
            <img src="https://res.cloudinary.com/dgwzirogr/image/upload/v1650584671/frontendSBA/dester_tomatoes_bxyh90.jpg"
                 id="landingPhoto" alt="tray of Dester tomatoes">
        </sec:authorize>
    </div>
</div>
<jsp:include page="include/footer.jsp"/>