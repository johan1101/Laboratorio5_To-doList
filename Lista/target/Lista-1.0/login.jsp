<!-- Inclución de la plantilla de header -->
<%@include file= "templates/header.jsp" %>
<%String usuario=request.getParameter("usuarioI");%>

<!-- Navegador importado de bootstrap -->

<%@include file= "templates/navbar.jsp" %>


<!-- Mensaje personalizado al ingresar -->

    <div class="container p-4"> 
        <div class="card text-center">
            <div class="card-header">
            </div>

            <div class="card-body">
              <h5>Bienvenido, <%out.println(request.getParameter("usuarioI"));%></h5>
              <a href="index.jsp" class="btn btn-outline-success"> Cerrar sesion</a>
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
                    <form class="row g-3 needs-validation" novalidate>
                    
                    <!-- ID -->
                    
                    <div class="input-group">
                        <label for="validationCustomUsername" class="form-label">Id</label>
                        <div class="input-group">
                                <span class="input-group-text" id="inputGroupPrepend"><i class="fa-solid fa-id-card"></i></span>
                                <input type="number" class="form-control" min="0" step="1"id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
                                
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
                            <textarea class="form-control" name="descripcion" id="validationTextarea" placeholder="Required example textarea" required></textarea>
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
                        <button type="submit" class="btn btn-outline-success">Agregar Tarea</button>
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
            <tr>
              <th scope="row">1</th>
              <td>Trabajo</td>
              <td>Realizar trabajo</td>
              <td>2/10/2023</td>
              <td> <a href="#" class="btn btn-outline-success"><i class="fa-solid fa-pen-clip"></i></a>
                  <a href="#" class="btn btn-outline-danger"><i class="fa-solid fa-trash"></i> </a></td>
            </tr>
            </tbody>
        </table>
        </div>
    </div>
  </div></div>

    <!-- Javascript para manejar la logica de los mensajes del required 
    BASADO:   https://getbootstrap.com/docs/5.3/forms/validation/   -->
    
<script> 
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
</script>

<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>