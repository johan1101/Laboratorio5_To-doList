<!-- Inclución de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

<!-- Navegador importado de bootstrap -->
<nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">Disabled</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

<!-- Mensaje personalizado al ingresar -->

<h5>Bienvenido, <%out.println(request.getParameter("usuarioI"));%>|<a href="index.jsp"> Cerrar sesion</a></h5>

<!-- Tabla -->
  <div class="container p-4"> 
            
            <div class="row">
                
            <div class="col-md-4">  <!-- clase division por 4 columnas -->
               <div class="card card-body">
                <form>
                <div class="mb-3">
                  <label for="id" class="form-label">ID</label>
                  <input type="number" name = "id" class="form-control">
                </div>
                <div class="mb-3">
                  <label for="titulo" class="form-label">Titulo</label>
                  <input type="text" name = "titulo" class="form-control">
                </div>
                   <div class="mb-3">
                  <label for="descripcion" class="form-label">Descripción</label>
                  <textarea  name = "descripcion" class="form-control" rows="3" cols="20"></textarea>
                </div>
                  <div class="mb-3">
                  <label for="fecha" class="form-label">Fecha</label>
                  <input type="date" name = "fecha" class="form-control">
                </div>
                
                <button type="submit" class="btn btn-primary">Agregar Tarea</button>
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
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
      <td> <i class="fa-solid fa-pen-clip"></i><i class="fa-solid fa-trash"></i> </td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
       <td> <i class="fa-solid fa-pen-clip"></i><i class="fa-solid fa-trash"></i> </td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
        <td> <i class="fa-solid fa-pen-clip"></i><i class="fa-solid fa-trash"></i> </td>
</tr>
 <tr>
      <th scope="row">4</th>
        <td>Jacob</td>
      <td>Thornton</td>
      <td>@twitter</td>
       <td> <i class="fa-solid fa-pen-clip"></i><i class="fa-solid fa-trash"></i> </td>
</tr>

  </tbody>
            </table>
             </div>
        </div>
                </div></div>

<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>