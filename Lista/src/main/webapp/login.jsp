<%@page import="com.mundo.lista.Lista"%>
<%@page import="com.mundo.lista.Serializacion"%>
<%@page import="com.mundo.lista.Tareas"%>


<!-- Inclución de la plantilla de header -->
<%@include file= "templates/header.jsp" %>
<%String usuario = request.getParameter("usuarioI");%>

<!-- Navegador importado de bootstrap -->

<%@include file= "templates/navbar.jsp" %>

<%
    
    String añadido=request.getParameter("add");
    System.out.println("----------------------");
    System.out.println(añadido);
    
    if (añadido != null && añadido.equals("no")) {
%>
    <!--Llama metodo de JS para mostrar la modal de NO ingresado existosamente-->
    <script>
          $(document).ready(function () {
            tareaNo();
            
        });
    </script>
<%  
    }else if(añadido != null && añadido.equals("si")){
    %>
    <!--Llama metodo de JS para mostrar la modal de NO ingresado existosamente-->
    <script>
          $(document).ready(function () {
            tareaSi();
        });
    </script>
    <% 
}
request.removeAttribute("add");
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
                                Introduce un id válido.
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
                                    Introduce un titulo válido.
                                </div> 
                            </formu></div>
                    </div>

                    <!-- Descripcion -->

                    <div class="input-group">
                        <label for="descripcion" class="form-label">Descripción</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fa-solid fa-circle-info"></i></span>
                            <textarea class="form-control" name="descripcion" id="validationTextarea" placeholder="Ingrese la decripcion" required></textarea>
                            <!-- Verificacion -->
                            <div class="valid-feedback">
                                Se mira bien!
                            </div>
                            <!-- En caso de no tener nada -->
                            <div class="invalid-feedback">
                                Introduce una descripcion válida.
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
                                Introduce una fecha válida.
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
            <!-- poner tabla aquí-->

            <div class="card card-body">
                <table class="table table-striped table-hover">
                    <!-- Primera fila -->   
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Titulo</th>
                            <th scope="col">Descripción</th>
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
                <h2>¿Estás seguro de que deseas eliminar esta tarea?</h2>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" style="margin-right: 10px;">Cancelar</button>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModalConfirm" onclick="eliminarTarea()">Eliminar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal editar tarea-->

<div class="modal fade" id="editar" tabindex="-1" aria-labelledby="editarLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Edita la tarea #<span id="tareaId"></span> </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
        <div class="modal-body">
            <center>
            <button type="button" id="btnPasarVariable" class="btn btn-outline-primary" data-bs-toggle="modal">Editar Titulo</button>  
            <button type="button" id="btnPasarVariable1" class="btn btn-outline-primary" data-bs-toggle="modal">Editar Descripcion</button>
            <button type="button" id="btnPasarVariable2" class="btn btn-outline-primary" data-bs-toggle="modal">Editar Fecha</button>
            </center>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>

<!-- Modal editar titulo-->
<div class="modal fade" id="edTit" tabindex="-1" aria-labelledby="editTitLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            
                <div class="modal-header">
                    <h5 class="modal-title">Editar titulo  <span id="idEditar" hidden></span></h5>
            </div>

                <div class="modal-body">
                    <form action="SvEliminarEditar" method="POST" class="d-flex">
                    <div class="input-group">
                        <span class="input-group-text" id="inputGroupPrepend"><i class="fa-solid fa-signature"></i></span>
                        <input type="text" name="tituloNuev" class="form-control" required>
                        <input type="text" name="edit" value="tit" hidden>
                        <input type="text" name="idEd" class="form-control" hidden required>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">Actualizar</button>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModalConfirm" >Cancelar</button>
                    </form>
                </div>
        </div>
    </div>
</div>
<!-- Modal editar Descripcion-->
<div class="modal fade" id="edDes" tabindex="-1" aria-labelledby="editTitLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            
                <div class="modal-header">
                     <h5 class="modal-title">Editar Descripcion <span id="idEditar" hidden></span></h5>
            </div>

                <div class="modal-body">
                    <form action="SvEliminarEditar" method="POST" class="d-flex">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fa-solid fa-circle-info"></i></span>
                        <textarea class="form-control" name="desNuev" id="validationTextarea" placeholder="Ingrese la decripcion" required></textarea>
                        <input type="text" name="edit" value="des" hidden>
                        <input type="text" name="idEd" class="form-control" hidden>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">Actualizar</button>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModalConfirm" >Cancelar</button>
                    </form>
                </div>
        </div>
    </div>
</div>
<!-- Modal editar Fecha-->
<div class="modal fade" id="edFec" tabindex="-1" aria-labelledby="editTitLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            
                <div class="modal-header">
                     <h5 class="modal-title">Editar Fecha<span id="idEditar"></span></h5>
            </div>

                <div class="modal-body">
                    <form action="SvEliminarEditar" method="POST" class="d-flex">
                    <div class="input-group">
                        <span class="input-group-text" id="inputGroupPrepend"><i class="fa-solid fa-signature"></i></span>
                        <input type="date" class="form-control"  name="fecNuev" id="validationCustom05" required>
                        <input type="text" name="edit" value="fec" hidden>
                        <input type="text" name="idEd" class="form-control" >
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger">Actualizar</button>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModalConfirm" >Cancelar</button>
                    </form>
                </div>
        </div>
    </div>
</div>





<!-- Modal editar descripcion-->



<!-- Modal editar fecha-->


<!-- Javascript para manejar la logica de los mensajes del required 
BASADO:   https://getbootstrap.com/docs/5.3/forms/validation/   -->

<script>
    
    function tareaSi() {
        toastr.options = {
        "closeButton": true,
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
    
    // Mostrar una notificación Toastr de error
    toastr.success('Se ha añadido exitosamente!', 'Registrado');
    }
    
    function tareaNo(){
         toastr.options = {
        "closeButton": true,
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
    
    // Mostrar una notificación Toastr de error
    toastr.error('Ya existe una tarea con este id, intenta con otro!', 'No se ha podido registrar');
    }
    // Función de flecha que se ejecuta inmediatamente.
    (() => {
        'use strict'; // Modo estricto para un código más seguro y eficiente.

        // Selecciona todos los elementos con la clase "needs-validation" y los almacena en la variable "forms".
        const forms = document.querySelectorAll('.needs-validation');

        // Itera sobre cada formulario encontrado.
        Array.from(forms).forEach(form => {
            // Agrega un evento "submit" a cada formulario.
            form.addEventListener('submit', event => {
                // Verifica si el formulario no es válido.
                if (!form.checkValidity()) {
                    event.preventDefault(); // Previene el envío del formulario si no es válido.
                    event.stopPropagation(); // Detiene la propagación del evento para evitar otros manejadores de eventos.
                }
                form.classList.add('was-validated'); // Agrega la clase "was-validated" al formulario.
            }, false);
        });
    })();
    
       var id = "";

    /**
     * Esta función se encarga de mostrar el modal de confirmación antes de eliminar una tarea.
     * Se dispara cuando se muestra el modal.
     */
    $('#eliminar').on('show.bs.modal', function (event) {
        // Obtiene el botón que desencadenó el evento de mostrar el modal
        var button = $(event.relatedTarget);

        // Obtiene el id de la tarea desde el atributo 'data-nombre' del botón
        var idTarea = button.data('nombre');

        // Obtiene el modal actual
        var modal = $(this);
        
        var titNuev =

        // Almacena el nombre de la tarea en la variable global 'id'
        id = idTarea;

    });
    
     function eliminarTarea() {
        // Obtiene el id de la tarea desde una variable previamente definida (id)
        var idTarea = id;

        // Realiza una solicitud AJAX al servlet 'SvEliminarEditar' para eliminar la tarea
        $.ajax({
            url: 'SvEliminarEditar?id=' + idTarea, // URL del servlet con el parámetro 'id' para la eliminación
            method: 'GET', // Método HTTP utilizado para la solicitud (GET en este caso)
            success: function (data) {
                // En caso de éxito en la solicitud:

                // Cierra el modal de eliminación
                $('#eliminar').modal('hide');

                // Recarga la página actual para reflejar los cambios
                location.reload();
            },
            error: function () {
                // En caso de error en la solicitud:

                // Registra un mensaje de error en la consola (para fines de depuración)
                console.log('Error al eliminar el perro.');
            }
        });
    }

    $('#editar').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var idTarea = button.data('nombre');
    
    // Mostrar el ID de la tarea en el modal
    $('#tareaId').text(idTarea);

    // También puedes almacenar el ID en una variable global si necesitas acceder a él en otros lugares del código.
    tareaId = idTarea;
});

// JavaScript para modal1
$('#editar').on('show.bs.modal', function (event) {
    // Al hacer clic en el botón, pasa la variable tareaId a modal2
    $('#btnPasarVariable').click(function () {
        $('#edTit').data('tareaId', tareaId);
        $('#edTit').modal('show'); // Muestra modal2
    });
    $('#btnPasarVariable1').click(function () {
        $('#edDes').data('tareaId', tareaId);
        $('#edDes').modal('show'); // Muestra modal2
    });
    $('#btnPasarVariable2').click(function () {
        $('#edFec').data('tareaId', tareaId);
        $('#edFec').modal('show'); // Muestra modal2
    });
});
// JavaScript para modal2
$('#edTit').on('show.bs.modal', function (event) {
    // Obtiene la variable pasada desde modal1 y la muestra en modal2
    var tareaId = $('#edTit').data('tareaId');
    $('#idEditar').text(tareaId);
    
    var inputElement = $('#edTit').find('input[name="idEd"]');
    
    inputElement.val($('#idEditar').text());
    
   
});

$('#edDes').on('show.bs.modal', function (event) {
    // Obtiene la variable pasada desde modal1 y la muestra en modal2
    var tareaId = $('#edDes').data('tareaId');
    $('#idEditar').text(tareaId);
    
    var inputElement = $('#edDes').find('input[name="idEd"]');
    
    inputElement.val($('#idEditar').text());
    
   
});

$('#edFec').on('show.bs.modal', function (event) {
    // Obtiene la variable pasada desde modal1 y la muestra en modal2
    var tareaId = $('#edFec').data('tareaId');
    $('#idEditar').text(tareaId);
    
    var inputElement = $('#edFec').find('input[name="idEd"]');
    
    inputElement.val($('#idEditar').text());
    
   
});



</script>


<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>