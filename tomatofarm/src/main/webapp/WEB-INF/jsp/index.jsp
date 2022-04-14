<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>

<jsp:include page="include/header.jsp" />

    <div class="mainContent">
        <a href="/user/search">
            <div class="homeLauncher">
                <h3>
                    <%--                    later this will be just OR also plots search?--%>
                    <span>Search (Users/plots)</span>
                </h3>
            </div>
        </a>
        <a href="/plots/plots">
            <div class="homeLauncher" >
                <h3>
                    <span>Plots</span>
                </h3>
            </div>
        </a>
        <a href="/user/userAdmin">
            <div class="homeLauncher" >
                <h3>
                    <span>User Admin</span>
                </h3>
            </div>
        </a>
        <a href="/index">
            <div class="homeLauncher" >
                <h3>
                    <span>Sign Out</span>
                </h3>
            </div>
        </a>
        <img src="https://res.cloudinary.com/dgwzirogr/image/upload/v1649013339/frontendSBA/orangegrape_wegqti.jpg" id="orangeGrape" alt="tray of orange grape tomatoes">
    </div>


<jsp:include page="include/footer.jsp" />