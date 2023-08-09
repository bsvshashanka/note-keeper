<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="style/style.css">
<header class="p-3 text-bg-dark">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <img src="logo.jpg" width="40" height="32" alt="this is logo">

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="./index.jsp" class="nav-link px-2 text-white">Home</a></li>
                <li><a href="./pricing.jsp" class="nav-link px-2 text-white">Pricing</a></li>
                <li><a href="./about.jsp" class="nav-link px-2 text-white">About</a></li>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
            </form>

            <div class="text-end">
                <button type="button" class="btn-previous btn btn-outline-light me-2"><a href="login.jsp" style="color: white">Login</a></button>
                <button type="button" class="btn-previous btn btn-warning"><a href="signup.jsp">Sign-up</a> </button>
            </div>
        </div>
    </div>
</header>
<style>
    .btn-previous a{
        text-decoration: none;
        color: initial;
    }
</style>