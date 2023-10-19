<%@page import="com.mundo.lista.Lista"%>
<%@page import="com.mundo.lista.Serializacion"%>
<%@page import="com.mundo.lista.Tareas"%>


<!-- Incluci�n de la plantilla de header -->
<%@include file= "templates/header.jsp" %>
<%String usuario = request.getParameter("usuarioI");%>

<!-- Navegador importado de bootstrap -->

<%@include file= "templates/navbar.jsp" %>

<%
    
    String a�adido=request.getParameter("add");
    System.out.println("----------------------");
    System.out.println(a�adido);
    
    if (a�adido != null && a�adido.equals("no")) {
%>
    <!--Llama metodo de JS para mostrar la modal de NO ingresado existosamente-->
    <script>
          $(document).ready(function () {
            tareaNo();
            
        });
    </script>
<%  request.removeAttribute("add");
    }else if(a�adido != null && a�adido.equals("si")){
    %>
    <!--Llama metodo de JS para mostrar la modal de NO ingresado existosamente-->
    <script>
          $(document).ready(function () {
            tareaSi();
        });
    </script>
    <% request.removeAttribute("add");
}

%>

<!-- Mensaje personalizado al ingresar -->

<div class="container p-4"> 
    <div class="card text-center">
        <div class="card-header">
        </div>

        <div class="card-body">
            <h5>Bienvenid@, <%out.println(request.getParameter("usuarioI"));%></h5>
            <a href="index.jsp" class="btn btn-outline-primary" > Cerrar sesion</a>
        </div>

        <div class="card-footer text-body-secondary">
        </div>
    </div>
</div>

<!-- Tabla -->

<div class="container p-4"> 
    <div class="row">
        <div class="col-md-4">  <!-- clase division por 4 columnas -->
            <div class="card card-body">
                <form class="row g-3 needs-validation" action="SvLoginCheck" method="GET" novalidate >
                    <input type="hidden" name="usuarioI" value="<%=usuario%>">
                    <!-- ID -->

                    <div class="input-group">
                        <label for="validationCustomUsername" class="form-label">Id</label>
                        <div class="input-group">
                            <span class="input-group-text" id="inputGroupPrepend"><i class="fa-solid fa-id-card"></i></span>
                            <input type="number" name="id" class="form-control" min="0" step="1"id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
                           
                            <!-- Verificacion -->
                            <div class="valid-feedback">
                                Se mira bien!
                            </div>
                            <!-- En caso de no tener nada -->
                            <div class="invalid-feedback">
                                Introduce un id v�lido.
                            </div> 
                        </div>
                    </div>

                    <!-- Titulo -->

                    <div class="input-group">
                        <div class="input-group">
                            <formu class="form-floating">
                                <input type="text" class="form-control" id="floatingInputValue" name="titulo" placeholder="Ingrese el Titulo" value="" required="">
                                <label for="floatingInputValue">Titulo</label>
                                <!-- Verificacion -->
                                <div class="valid-feedback">
                                    Se mira bien!
                                </div>
                                <!-- En caso de no tener nada -->
                                <div class="invalid-feedback">
                                    Introduce un titulo v�lido.
                                </div> 
                            </formu></div>
                    </div>

                    <!-- Descripcion -->

                    <div class="input-group">
                        <label for="descripcion" class="form-label">Descripci�n</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa-solid fa-circle-info"></i></span>
                            <textarea class="form-control" name="descripcion" id="validationTextarea" placeholder="Required example textarea" required></textarea>
                            <!-- Verificacion -->
                            <div class="valid-feedback">
                                Se mira bien!
                            </div>
                            <!-- En caso de no tener nada -->
                            <div class="invalid-feedback">
                                Introduce una descripcion v�lida.
                            </div> 
                        </div>    
                    </div>

                    <!-- Fecha -->  
                    <div class="input-group">
                        <label for="validationCustom05" class="form-label">Fecha</label>
                        <div class="input-group">
                            <input type="date" class="form-control"  name="fecha" id="validationCustom05" required>
                            <!-- Verificacion -->
                            <div class="valid-feedback">
                                Se mira bien!
                            </div>
                            <!-- En caso de no tener nada -->
                            <div class="invalid-feedback">
                                Introduce una fecha v�lida.
                            </div> 
                        </div>
                    </div>

                    <!-- Boton centrado -->
                    <center>
                        <button type="submit" class="btn btn-outline-primary">Agregar Tarea</button>
                    </center>
                </form>
            </div>

        </div> 

        <div class="col-md-8">
            <!-- poner tabla aqu�-->

            <div class="card card-body">
                <table class="table table-striped table-hover">
                    <!-- Primera fila -->   
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Titulo</th>
                            <th scope="col">Descripci�n</th>
                            <th scope="col">Fecha</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>

                    <!-- Contenido tabla -->
                    <tbody>
                        <%
                            Lista listaTareas = new Lista();
                            // Obtener el contexto del servlet
                            ServletContext context = getServletContext();

                            listaTareas = Serializacion.leerTareas(context);
                            if (listaTareas == null) {
                                listaTareas = new Lista();
                            }

                            String tablaHTML = listaTareas.generarTabla();
                        %>
                    <div>
                        <%= tablaHTML%>
                    </div>

                    </tbody>
                </table>
            </div>
        </div>
    </div></div>

<!-- Modal eliminar tarea-->
<div class="modal fade" id="eliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="eliminarLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <h2>�Est�s seguro de que deseas eliminar esta tarea?</h2>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" style="margin-right: 10px;">Cancelar</button>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModalConfirm" onclick="eliminarTarea()">Eliminar</button>
            </div>
        </div>
    </div>
</div>

<!-- Javascript para manejar la logica de los mensajes del required 
BASADO:   https://getbootstrap.com/docs/5.3/forms/validation/   -->

<script>
    
    function tareaSi() {
        toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
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
    
    // Mostrar una notificaci�n Toastr de error
    toastr.success('Se ha a�adido exitosamente!', 'Registrado');
    }
    
    function tareaNo(){
         toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
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
    
    // Mostrar una notificaci�n Toastr de error
    toastr.warning('no', 'No ha podido ingresar');
    }
    // Funci�n de flecha que se ejecuta inmediatamente.
    (() => {
        'use strict'; // Modo estricto para un c�digo m�s seguro y eficiente.

        // Selecciona todos los elementos con la clase "needs-validation" y los almacena en la variable "forms".
        const forms = document.querySelectorAll('.needs-validation');

        // Itera sobre cada formulario encontrado.
        Array.from(forms).forEach(form => {
            // Agrega un evento "submit" a cada formulario.
            form.addEventListener('submit', event => {
                // Verifica si el formulario no es v�lido.
                if (!form.checkValidity()) {
                    event.preventDefault(); // Previene el env�o del formulario si no es v�lido.
                    event.stopPropagation(); // Detiene la propagaci�n del evento para evitar otros manejadores de eventos.
                }
                form.classList.add('was-validated'); // Agrega la clase "was-validated" al formulario.
            }, false);
        });
    })();
    
       var id = "";

    /**
     * Esta funci�n se encarga de mostrar el modal de confirmaci�n antes de eliminar una tarea.
     * Se dispara cuando se muestra el modal.
     */
    $('#eliminar').on('show.bs.modal', function (event) {
        // Obtiene el bot�n que desencaden� el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el id de la tarea desde el atributo 'data-nombre' del bot�n
        var idTarea = button.data('nombre');

        // Obtiene el modal actual
        var modal = $(this);

        // Almacena el nombre de la tarea en la variable global 'id'
        id = idTarea;

    });
    
     function eliminarTarea() {
        // Obtiene el id de la tarea desde una variable previamente definida (id)
        var idTarea = id;

        // Realiza una solicitud AJAX al servlet 'SvEliminarEditar' para eliminar la tarea
        $.ajax({
            url: 'SvEliminarEditar?id=' + idTarea, // URL del servlet con el par�metro 'id' para la eliminaci�n
            method: 'GET', // M�todo HTTP utilizado para la solicitud (GET en este caso)
            success: function (data) {
                // En caso de �xito en la solicitud:

                // Cierra el modal de eliminaci�n
                $('#eliminar').modal('hide');

                // Recarga la p�gina actual para reflejar los cambios
                location.reload();
            },
            error: function () {
                // En caso de error en la solicitud:

                // Registra un mensaje de error en la consola (para fines de depuraci�n)
                console.log('Error al eliminar el perro.');
            }
        });
    }
     

</script>


<!-- Incluci�n de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>