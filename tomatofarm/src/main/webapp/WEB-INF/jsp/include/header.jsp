<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Tomato Farm</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link href="<c:url value="../../../pub/css/styles.css"/>" rel="stylesheet" type="text/css"/>
</head>

<body>

<div id="navBar"><a href="/index">Home</a> / <a href="/plots/allPlots">Plots</a> / <a href="/varieties/allVarieties">Varieties</a> / <a href="/admin/directory">People</a> / <a href="/user/search">Search</a>
    <a href="/index"><h2 id="siteHeader">Tomato Farm &#127813;</h2></a></div>

<div id="authBar"><sec:authorize access="!isAuthenticated()">
    <a href="/login/login">Login</a>&#8226;<a href="/register/registerForm">Register</a>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <span id="welcome">Welcome, <sec:authentication property="principal.username"/>.</span> <a id="navLogout" href="/login/logout">Logout</a> <a id="navAccount" href="/user/accountEditForm">Account</a>
</sec:authorize>
<%-- easy example of how to show something gated off for ADMIN only.--%>
<sec:authorize access="hasAuthority('ADMIN')">
    <span id="welcome">Signed in as admin.</span>
</sec:authorize>
</div>