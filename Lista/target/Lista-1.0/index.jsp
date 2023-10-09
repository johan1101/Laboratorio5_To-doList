
<!-- Incluci�n de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

<!-- Incluci�n deL STYLE -->
<%@include file= "style/style.jsp" %>

<div class="background"></div>

<!--Formulario que se envia por POST -->
<form action="SvLoginCheck" method="POST">
    <section class="home">
        <!--Informacion de la pagina -->
        <div class="content">
            <a href="#" class="logo"> Nalmi</a>
            <h2> Bienvenido! </h2>          
            <h3> Sistema Gesti�n de Tareas </h3>
            <pre> </pre>
        </div>
        <!--Login-->
        <div class="login">
            <h2>Ingresar</h2>
            <!--Cedula-->
            <div class="input">
                <input type="text" class="input1" name="cedula" placeholder="C�dula Usuario" required>
                 <i class="fa-solid fa-id-card fa-lg" style="color: #ffffff;"></i>
            </div>
            <!--Contrase�a-->
            <div class="input">
                <input type="password" class="input1" name="contrasenia" placeholder="Contrase�a" required>
                <i class="fa-solid fa-lock fa-lg" style="color: #ffffff;"></i>
            </div>
            <!--Boton ingresar-->
            <div class="button">
                <button type="submit" class="btn">Ingresar</button>
            </div>
            <!--Registrarse-->
            <div class="sign-up">
                <p>No tiene una cuenta?</p>
                <!--Llama modal para registrarse-->
                <ingresar type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop" >
                    <a href="#" >Registrese aqui</a>
                </ingresar>
            </div>
        </div>
    </section>
</form>

<%
    //Llamamos variable de registrado para obtener banderas de si fue registrado o no el usuario
    String registrado = (String) request.getAttribute("registrado");
        
    //En caso de que si se registra exitosamente
    if (registrado != null && registrado.equals("si")) {

%>
    <!--Llama metodo de JS para mostrar la modal de registrado existosamente-->
    <script>
        $(document).ready(function () {
            usuarioR();
        });
    </script>
<%    } 
        //En caso de que no se registra exitosamente
       else if(registrado != null && registrado.equals("no")){
%>
    <!--Llama metodo de JS para mostrar la modal de NO registrado existosamente-->
    <script>
        $(document).ready(function () {
            usuarioNoR();
        });
    </script>
<%
    }
    //Llamamos variable para saber si los datos de ingreso son validos
    String valido=request.getParameter("valido");
    //En caso de no ser validos
    if (valido != null && valido.equals("false")) {
%>
    <!--Llama metodo de JS para mostrar la modal de NO ingresado existosamente-->
    <script>
          $(document).ready(function () {
            usuarioNoI();
        });
    </script>
<%
    }
    // Elimina los atributos "registrado" e "ingresar" de la solicitud
    request.removeAttribute("registrado");
    request.removeAttribute("valido");
%>

<!-- Modal para registrar el usuario -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <form action="SvRegister" method="POST">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Registro de Usuarios</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Cedula -->
                    <br>
                    <formu class="form-floating">
                        <input type="number" min="0" step="1" class="form-control" id="floatingInputValue" name="cedula" placeholder="Ingrese su c�dula" value="" required>
                        <label for="floatingInputValue">C�dula</label>
                    </formu>
                    <!-- Usuario -->
                    <br>
                    <formu class="form-floating">
                        <input type="text" class="form-control" id="floatingInputValue" name="nombre" placeholder="Ingrese su c�dula" value="" required>
                        <label for="floatingInputValue">Nombre de Usuario</label>
                    </formu>
                    <!-- Contrase�a -->
                    <br>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="floatingPassword" name="contrasenia" placeholder="Password" required>
                        <label for="floatingPassword">Contrase�a</label>
                    </div>
                </div>
                <!-- Footer con botones -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary">Registrar Usuario</button>
                </div>
            </div>
        </div>
    </form>
</div>

<!-- Modal registro exitoso-->
<div class="modal fade" id="registrado" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="registradoLabel" aria-hidden="true">
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
</div>

<!-- Modal registro NO exitoso-->
<div class="modal fade" id="noRegistrado" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="noRegistradoLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <h5>Alguien con la misma cedula existe, intenta ingresar!</h5>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
</div>

<!-- Modal datos de ingreso incorrectos-->
<div class="modal fade" id="datosIncorrectos" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="datosIncorrectosLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <h2>Datos incorrectos</h2>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>


<!-- Incluci�n de la plantilla de header -->
<script>
    function usuarioR() {
        $("#registrado").modal("show");
    }
    
    function usuarioNoI(){
        $("#datosIncorrectos").modal("show");
    }
    
    function usuarioNoR(){
        $("#noRegistrado").modal("show");
    }
</script>


<!-- Incluci�n de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
