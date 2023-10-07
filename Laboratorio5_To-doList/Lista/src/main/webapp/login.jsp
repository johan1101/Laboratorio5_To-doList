<!-- Inclución de la plantilla de header -->
<%@include file= "templates/header.jsp" %>
<%String usuario=request.getParameter("usuarioI");%>

<!-- Navegador importado de bootstrap -->
<nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" ><i class="fa-solid fa-list-check"></i></a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="login.jsp?usuarioI=<%out.print(usuario);%>">Principal</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Opciones
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">1</a></li>
            <li><a class="dropdown-item" href="#">2</a></li>
            <li><a class="dropdown-item" href="#">3</a></li>
          </ul>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-light" type="submit">Buscar</button>
      </form>
    </div>
  </div>
</nav>

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
                <form>
                    <!-- ID -->
                    <label for="validationCustomUsername" class="form-label">Id</label>
                    <div class="input-group has-validation">
                      
                        <span class="input-group-text" id="inputGroupPrepend"><i class="fa-solid fa-id-card"></i></span>
                      <input type="number" class="form-control" min="0" step="1"id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
                      <div class="invalid-feedback">
                        Please choose a username.
                      </div>
                    </div>
         
                    <!-- Titulo -->
                    <label for="titulo" class="form-label">Titulo</label>
                  <div class="input-group has-validation">
                    
                    <input type="text" class="form-control" id="titulo" required>
                    
                    <div class="valid-feedback">
                      Looks good!
                    </div>
                  </div>
                    <!-- Descripcion -->
                    <label for="descripcion" class="form-label">Descripción</label>
                    
                   <div class="input-group">
                    <span class="input-group-text"><i class="fa-solid fa-circle-info"></i></span>
                    <textarea class="form-control" aria-label="With textarea"></textarea>
                  </div>
                    <!-- Fecha -->
                    
                  <div class="mb-3">
                  <label for="fecha" class="form-label">Fecha</label>
                  <input type="date" name = "fecha" class="form-control">
                </div>
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
                <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Titulo</th>
      <th scope="col">Descripción</th>
      <th scope="col">Fecha</th>
      <th scope="col">Acciones</th>
    </tr>
  </thead>
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

<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>