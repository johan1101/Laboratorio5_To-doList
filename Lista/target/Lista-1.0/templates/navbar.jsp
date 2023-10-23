<nav class="navbar navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" ><i class="fa-solid fa-list-check fa-xl"></i></a>
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
        <form class="d-flex" role="search" Action = "SvAnadirBuscar" method="GET">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="id">
        <button class="btn btn-outline-light" type="submit" >Buscar</button>
      </form>
    </div>
  </div>
</nav>
