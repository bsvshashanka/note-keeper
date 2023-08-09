<html>
<link rel="stylesheet" href="style/style.css">
<header>
<%@include file="header.jsp"%>
</header>
<body class=" align-items-center bg-body-tertiary">
<main class="d-flex align-items-center form-signin w-100 m-auto" style="justify-content: center;">
    <form id="form" method="post" action="dashboard.jsp">
<%--        <img class="mb-4" src="logo.jpg" alt="" width="72" height="57">--%>
        <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

        <div class="form-floating">
            <input required name="email" type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
            <label for="floatingInput">Email address</label>
        </div>
        <div class="form-floating">
            <input required name="username" type="text" class="form-control" id="username" placeholder="username">
            <label for="username">Username</label>
        </div>
        <div class="form-floating">
            <input required name="password" type="password" class="form-control" id="floatingPassword" placeholder="Password">
            <label for="floatingPassword">Password</label>
        </div>

        <button class="btn btn-dark w-100 py-2" type="submit">Sign in</button>
        <p class="mt-5 mb-3 text-body-secondary">© 2017–2023</p>
    </form>
</main>
</body>
</html>
