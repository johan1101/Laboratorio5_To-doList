
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
            <i class="fa-solid fa-envelope" style="color: #ff0000;"></i>
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
</form>
</section>

<%
    String registrado = (String) request.getAttribute("registrado");

    System.out.println(registrado);
    if (registrado != null && registrado.equals("si")) {

%>
<script>
    $(document).ready(function () {
        usuarioR();
    });
</script>
<%       // Elimina el atributo "registrado" de la solicitud
    request.removeAttribute("registrado");
    }
%>



<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <form action="SvRegister" method="POST">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Registro de Usuarios</h1>
                </div>
                <div class="modal-body">
                    <br>
                    <formu class="form-floating">
                        <input type="text" class="form-control" id="floatingInputValue" name="cedula" placeholder="Ingrese su cédula" value="">
                        <label for="floatingInputValue">Cédula</label>
                    </formu>
                    <br>
                    <formu class="form-floating">
                        <input type="text" class="form-control" id="floatingInputValue" name="nombre" placeholder="Ingrese su cédula" value="">
                        <label for="floatingInputValue">Nombre de Usuario</label>
                    </formu>
                    <br>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="floatingPassword" name="contrasenia" placeholder="Password">
                        <label for="floatingPassword">Contraseña</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary">Registrar Usuario</button>
                </div>
            </div>
        </div>
    </form>
</div>

<!-- Modal -->
<div class="modal fade" id="registrado" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="registradoLabel" aria-hidden="true">
    <form action="SvRegister" method="POST">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <h2>Usuario registrado exitosamente</h2>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </form>
</div>


<!-- Inclución de la plantilla de header -->
<script>
    function usuarioR() {
        $("#registrado").modal("show");
    }
</script>


<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
