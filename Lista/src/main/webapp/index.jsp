<!-- Pagina principal- LOGIN -->

<!-- Inclución de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

<!-- Inclución del STYLE -->
<%@include file= "style/style.jsp" %>


<!--Formulario que se envia por POST -->
<div class="container" id="container">
    <div class="form-container sign-up">
            <form action="SvRegister" method="POST">
            <h1>Crear Cuenta</h1>
            <span>Ingresa tus datos</span>
            <input type="text" class="form-control" id="floatingInputValue" name="cedula" placeholder="Ingrese su cédula" value="" maxlength="10" required pattern="[0-9]+" title="Solo se permiten números">
            <input type="text" class="form-control" id="floatingInputValue" name="nombre" placeholder="Ingrese su nombre" value="" required>
            <input type="password" class="form-control" id="floatingPassword" name="contrasenia" placeholder="Ingrese su contraseña" required>
            <button type="submit" class="btn btn-primary">Registrar Usuario</button>
        </form>
    </div>
    
    <!-- Contenedor adicional para los toastr -->
    <div class="posicion"></div>
    <div class="form-container sign-in">
        <form action="SvLoginCheck" method="POST">
            <h1>Ingresar</h1>
            <span>Ingresa tus datos de acceso</span>
            <input type="text" class="input1" name="cedula" placeholder="Cédula Usuario" maxlength="10" required pattern="[0-9]+" title="Solo se permiten números">
            <input type="password" class="input1" name="contrasenia" placeholder="Contraseña" required>
            <button type="submit" class="btn">Ingresar</button>
        </form>
    </div>
    <!-- Contenedor derecho -->
    
    <div class="toggle-container">
        <div class="toggle">
            <div class="toggle-panel toggle-left">
                <img src="img/vector.png" width="100%">
                <button class="hidden" id="login">Regresar</button>
            </div>
            <div class="toggle-panel toggle-right">
                <h1 id="nalmi">Nalmi</h1>
                <img id="im" src="img/vector2.png" width="80%">
                <p id="cuenta">No tiene una cuenta?</p>
                <!-- Boton que muestra opcion registrar -->
                <button class="hidden" id="register">Regístrese aqui</button>
            </div>
        </div>
    </div>
</div>


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
<%    } //En caso de que no se registra exitosamente
else if (registrado != null && registrado.equals("no")) {
%>
<!--Llama metodo de JS para mostrar la modal de NO registrado existosamente-->
<script>
    $(document).ready(function () {
        usuarioNoR();
    });
</script>
<%  }
    //Llamamos variable para saber si los datos de ingreso son validos
    String valido = request.getParameter("valido");
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

<!-- Librerias -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>


<!-- Script para llamar los toastr. BASADO: https://codeseven.github.io/toastr/demo.html
    BASADO: https://getbootstrap.com/docs/5.3/components/toasts/-->

<script>
    // Manejo boton REGISTRAR y REGRESAR 
    const container = document.getElementById('container');
    const registerBtn = document.getElementById('register');
    const loginBtn = document.getElementById('login');

    registerBtn.addEventListener('click', () => {
        container.classList.add("active");
    });

    loginBtn.addEventListener('click', () => {
        container.classList.remove("active");
    }); 
    
    //TOASTR registro exitoso
    function usuarioR() {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "form-container",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };

        // Mostrar una notificación Toastr 
        toastr.success('Se ha registrado exitosamente!', 'Registrado');
    }
    
    //TOASTR login NO exitoso
    function usuarioNoI() {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "form-container",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };

        // Mostrar una notificación Toastr de error
        toastr.error('La cedula o contraseña no son correctas', 'No ha podido ingresar');
    }

    //TOASTR registro NO exitoso
    function usuarioNoR() {
        // Configurar opciones Toastr
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "form-container",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };

        // Mostrar una notificación Toastr de error
        toastr.error('Ya existe un usuario registrado con esa cedula', 'Error');
    }

</script>


<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
