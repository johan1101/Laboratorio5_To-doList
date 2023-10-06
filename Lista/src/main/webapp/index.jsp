
<!-- Inclución de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

<%@include file= "style/style.jsp" %>

<!-- Section: Design Block -->

 <div class="background"></div>
    <section class="home">
        <div class="content">
            <a href="#" class="logo"> Codehal</a>
            <h2> Welcome! </h2>
            <h3> To Our New Website </h3>
            <pre> Lorem fmiwofneorfniff</pre>
        </div>
        <div class="login">
            <h2>Sign In</h2>
            <div class="input">
                <input type="text" class="input1" placeholder="Email" required>
                <i class="fa-solid fa-envelope"></i>
            </div>
            <div class="input">
                <input type="password" class="input1" placeholder="Password" required>
                <i class="fa-solid fa-envelope"></i>
            </div>
            <div class="button">
                <button class="btn">Sign In</button>
            </div>
            <div class="sign-up">
                <p>No tiene una cuenta?</p>
                <a href="#">Sign up</a>
            </div>
        </div>
    </section>

<!-- Inclución de la plantilla de header -->
<script>
    <%@include file= "scripts/script.js" %>
</script>


<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
