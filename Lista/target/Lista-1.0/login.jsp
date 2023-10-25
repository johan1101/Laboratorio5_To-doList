<%@page import="com.mundo.lista.Metodos"%>
<%@page import="com.mundo.lista.Lista"%>
<%@page import="com.mundo.lista.Serializacion"%>
<%@page import="com.mundo.lista.Tareas"%>

<!DOCTYPE html>
<html>

    <head>
        <title>Tu Título</title>
        <style>
            /* Estilos para el header */
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
            }

            header {
                background-color: #e3f2fd;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            /* Estilos para la tarjeta bajo "Mensaje personalizado al ingresar" y "Tabla" */
            .card.custom-shadow {
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
            }

            body {
                background-color: #c9d6ff;
                background: linear-gradient(to right, #FBF9FE, #EDE5FC);
            }
            a{
                margin: 5px;
            }
        </style>
    </head>

    <body>
        <%String usuario = request.getParameter("usuarioI");%>

        <!-- Inclución de la plantilla de header -->
        <%@include file="templates/header.jsp" %>

        <!-- Navegador importado de bootstrap -->
        <%@include file="templates/navbar.jsp" %>

        <%
            Lista listaTareas = new Lista();
            // Obtener el contexto del servlet
            ServletContext context = getServletContext();
            String id = request.getParameter("search");
            listaTareas = Serializacion.leerTareas(context);
            boolean verificar = listaTareas.verificar();

            if (listaTareas == null) {
                listaTareas = new Lista();
            }

            String tablaHTML = Metodos.listarTareas(id, context);

            String añadido = request.getParameter("add");
            if (añadido != null && añadido.equals("no")) {
        %>
        <!-- Llama metodo de JS para mostrar la modal de NO ingresado exitosamente -->
        <script>
            $(document).ready(function () {
                tareaNo();

            });
        </script>
        <%
        } else if (añadido != null && añadido.equals("si")) {
        %>
        <!-- Llama metodo de JS para mostrar la modal de NO ingresado exitosamente -->
        <script>
            $(document).ready(function () {
                tareaSi();
            });
        </script>
        <%
        } else if (añadido != null && añadido.equals("errorid")) {
        %>
        <!-- Llama metodo de JS para mostrar la modal de NO ingresado exitosamente -->
        <script>
            $(document).ready(function () {
                errorId();
            });
        </script>
        <%
            }
            request.removeAttribute("add");
        %>

        <!-- Mensaje personalizado al ingresar -->
        <div class="container p-4">
            <div class="card custom-shadow text-center">
                <div class="card-header">
                </div>

                <div class="card-body">
                    <h5>Bienvenid@, <%=usuario%></h5>
                    <a href="index.jsp" type="button" class="btn " style="background-color: #8461BB; color: #ffffff;">Cerrar sesión</a>

                </div>

                <div class="card-footer text-body-secondary">
                </div>
            </div>
        </div>

        <!-- Tabla -->
        <div class="container p-4">
            <div class="row">
                <div class="col-md-4">
                    <!-- clase division por 4 columnas -->
                    <div class="card custom-shadow card-body">
                        <form class="row g-3 needs-validation" action="SvAnadirBuscar" method="POST" novalidate>
                            <input type="hidden" name="usuarioI" value="<%=usuario%>">
                            <!-- ID -->
                            <div class="input-group">
                                <label for="validationCustomUsername" class="form-label">Id</label>
                                <div class="input-group">
                                    <span class="input-group-text" id="inputGroupPrepend"><i class="fa-solid fa-id-card"></i></span>
                                    <input type="number" name="id" class="form-control" min="0" step="1" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
                                    <!-- Verificación -->
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
                                <label for="floatingInputValue">Titulo</label>
                                <div class="input-group">
                                    <formu class="form-floating">
                                        <input type="text" class="form-control" id="floatingInputValue" name="titulo" placeholder="Ingrese el Titulo" value="" required="">

                                        <!-- Verificación -->
                                        <div class="valid-feedback">
                                            Se mira bien!
                                        </div>
                                        <!-- En caso de no tener nada -->
                                        <div class="invalid-feedback">
                                            Introduce un título válido.
                                        </div>
                                    </formu>
                                </div>
                            </div>

                            <!-- Descripcion -->
                            <div class="input-group">
                                <label for="descripcion" class="form-label">Descripción</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fa-solid fa-circle-info"></i></span>
                                    <textarea class="form-control" name="descripcion" id="validationTextarea" placeholder="Ingrese la descripción" required></textarea>
                                    <!-- Verificación -->
                                    <div class="valid-feedback">
                                        Se mira bien!
                                    </div>
                                    <!-- En caso de no tener nada -->
                                    <div class="invalid-feedback">
                                        Introduce una descripción válida.
                                    </div>
                                </div>
                            </div>

                            <!-- Fecha -->
                            <div class="input-group">
                                <label for="validationCustom05" class="form-label">Fecha</label>
                                <div class="input-group">
                                    <input type="date" class="form-control" name="fecha" id="validationCustom05" required>
                                    <!-- Verificación -->
                                    <div class="valid-feedback">
                                        Se mira bien!
                                    </div>
                                    <!-- En caso de no tener nada -->
                                    <div class="invalid-feedback">
                                        Introduce una fecha válida.
                                    </div>
                                </div>
                            </div>
                            <%
                                if (verificar) {
                            %>
                            <button type="button" class="btn " id="showOptionsBtn" style="background-color: #8461BB; color: #ffffff;" >Agregar Tarea</button>
                            <%
                            } else if (!verificar) {
                            %>
                            <center>
                                <button type="submit" class="btn " id="finalSubmitBtn" style="background-color: #8461BB; color: #ffffff;" >Agregar Tarea</button>
                            </center>
                            <%
                                }
                            %>
                            <div id="opcionesAdicionales" class="alert alert-light" style="display: none;">
                                <center>
                                    <h5>¿Dónde agregar?</h5>
                                </center>
                                <div class="row g-2">
                                    <div class="col-md-6">
                                        <input type="radio" name="opcion" id="opcion1" value="prin" checked>
                                        <label for="opcion1">Agregar al inicio.</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="radio" name="opcion" id="opcion1" value="ant">
                                        <label for="opcion1">Agregar antes de</label>
                                        <div class="input-group">
                                            <input type="number" name="idEd" class="form-control" min="0" step="1" aria-describedby="inputGroupPrepend" placeholder="Ingresa el id">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="radio" name="opcion" id="opcion1" value="fin">
                                        <label for="opcion1">Agregar al final.</label>
                                    </div>
                                    <div class="col-md-6">
                                        <input type="radio" name="opcion" id="opcion1" value="desp">
                                        <label for="opcion2">Agregar después de</label>
                                        <div class="input-group">
                                            <input type="number" name="idEd2" class="form-control" min="0" step="1" aria-describedby="inputGroupPrepend" placeholder="Ingresa el id">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Botón centrado -->
                            <center>
                                <button type="submit" class="btn " id="finalSubmitBtn" style="display: none;background-color: #8461BB; color: #ffffff;">Agregar Tarea</button>
                            </center>
                        </form>
                    </div>
                </div>

                <div class="col-md-8">
                    <!-- poner tabla aquí-->
                    <div class="card custom-shadow card-body">
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
                            <div>
                                <%= tablaHTML%>
                            </div>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal eliminar tarea -->
        <div class="modal fade" id="eliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
             aria-labelledby="eliminarLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <h2>¿Estás seguro de que deseas eliminar esta tarea?</h2>
                        <form action="SvEliminarEditar" method="GET">
                            <!-- Agregar un campo de entrada para mostrar el ID de la tarea -->
                            <input type="text" id="idDel" name="idDel" hidden>
                            <input type="text" name="usuarioI" class="form-control" value="<%=usuario%>" hidden>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" style="margin-right: 10px;">Cancelar
                                </button>
                                <button type="submit" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModalConfirm">Eliminar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal editar tarea -->
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
                            <button type="button" id="btnPasarVariable1" class="btn btn-outline-primary"
                                    data-bs-toggle="modal">Editar Descripcion</button>
                            <button type="button" id="btnPasarVariable2" class="btn btn-outline-primary" data-bs-toggle="modal">Editar Fecha</button>
                        </center>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal editar titulo -->
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
                                <input type="text" name="idEd" class="form-control" hidden>
                                <input type="text" name="usuarioI" class="form-control" value="<%=usuario%>" hidden>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger">Actualizar</button>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModalConfirm">Cancelar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal editar Descripcion -->
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
                                <input type="text" name="usuarioI" class="form-control" value="<%=usuario%>" hidden>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger">Actualizar</button>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModalConfirm">Cancelar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal editar Fecha -->
        <div class="modal fade" id="edFec" tabindex="-1" aria-labelledby="editTitLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Editar Fecha<span id="idEditar"></span></h5>
                    </div>
                    <div class="modal-body">
                        <form action="SvEliminarEditar" method="POST" class="d-flex">
                            <div class="input-group">
                                <input type="date" class="form-control" name="fecNuev" id="validationCustom05" required>
                                <input type="text" name="edit" value="fec" hidden>
                                <input type="text" name="idEd" class="form-control" hidden>
                                <input type="text" name="usuarioI" class="form-control" value="<%=usuario%>" hidden>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger">Actualizar</button>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModalConfirm">Cancelar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Javascript para manejar la lógica de los mensajes del required -->
        <%@include file="templates/funciones.jsp" %>

        <!-- Inclución de la plantilla de footer -->
        <%@include file="templates/footer.jsp" %>
    </body>

</html>