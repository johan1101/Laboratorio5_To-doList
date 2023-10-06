
<!-- Inclución de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

<%@include file= "style/style.jsp" %>

<!-- Section: Design Block -->

<div class="background"></div>
<section class="home">
    <div class="content">
        <a href="#" class="logo"> Nalmi</a>
        <h2> Bienvenido! </h2>          
        <h3> Sistema Gestión de Tareas </h3>
        <pre> </pre>
    </div>
    <div class="login">
        <h2>Ingresar</h2>
        <div class="input">
            <input type="text" class="input1" placeholder="Cédula Usuario" required>
            <i class="fa-solid fa-envelope"></i>
        </div>
        <div class="input">
            <input type="password" class="input1" placeholder="Contraseña" required>
            <i class="fa-solid fa-envelope"></i>
        </div>
        <div class="button">
            <button class="btn">Ingresar</button>
        </div>
        <div class="sign-up">
            <p>No tiene una cuenta?</p>
            <ingresar type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                <a href="#">Registrese aqui</a>
            </ingresar>
        </div>
    </div>
</section>


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Registro de Usuarios</h1>
            </div>
            <div class="modal-body">
                <br>
                <form class="form-floating">
                    <input type="email" class="form-control" id="floatingInputValue" placeholder="Ingrese su cédula" value="">
                    <label for="floatingInputValue">Cédula</label>
                </form>
                <br>
                <form class="form-floating">
                    <input type="email" class="form-control" id="floatingInputValue" placeholder="Ingrese su cédula" value="">
                    <label for="floatingInputValue">Nombre de Usuario</label>
                </form>
                <br>
                <div class="form-floating">
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                    <label for="floatingPassword">Contraseña</label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary">Registrar Usuario</button>
            </div>
        </div>
    </div>
</div>


<!-- Inclución de la plantilla de header -->
<script>
    <%@include file= "scripts/script.js" %>
</script>


<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
