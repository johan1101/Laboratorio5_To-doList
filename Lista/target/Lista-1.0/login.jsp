<!-- Incluci�n de la plantilla de header -->
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
<h1>Bienvenido, <%out.println(request.getParameter("usuarioI"));%><a href="index.jsp">Cerrar sesion</a></h1>

<!-- Tabla -->
  <div class="container p-4"> 
            
            <div class="row">
                
            <div class="col-md-4">  <!-- clase division por 4 columnas -->
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
                  <label for="descripcion" class="form-label">Descripci�n</label>
                  <textarea  name = "descripcion" class="form-control" rows="3" cols="20"></textarea>
                </div>
                  <div class="mb-3">
                  <label for="fecha" class="form-label">Fecha</label>
                  <input type="date" name = "fecha" class="form-control">
                </div>
                
                <button type="submit" class="btn btn-primary">Agregar Tarea</button>
              </form>
                    
            </div> 

  

        <div class="col-md-8">
          <!-- poner tabla aqu�-->
          <table class="table table-striped table-hover">
                <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td
</tr>
  </tbody>
            </table>
        </div>
                </div></div>

<!-- Incluci�n de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>