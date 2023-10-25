<!-- HEADER -->
<header>
   
  <!--NAV BAR-->  
  <nav class="navbar navbar-expand-lg" style="background-color: #512da8;">
  <div class="container-fluid">
    <!--Icono-->
    <a class="navbar-brand" ><i class="fa-solid fa-list-check fa-xl" style="color:white;"></i></a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <!--Boton regreso al inicio-->
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="login.jsp?usuarioI=<%out.print(usuario);%>" style="color:white;">INICIO</a>
        </li>
      </ul>
        <!--SEARCH-->
      <form action="SvAnadirBuscar" method="GET" class="d-flex" >
        <input type="number" class="form-control me-2" type="search" placeholder="Ingrese el id" aria-label="Search" name="buscar"  min="0" step="1" >
        <input type="text" name="usuarioI" class="form-control" value="<%=usuario%>" hidden>
        <button class="btn btn-outline-light" type="submit">Buscar</button>
      </form>
    </div>
  </div>
</nav>
        
</header>
        
        
        