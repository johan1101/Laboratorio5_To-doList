<!-- Inclución de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

<h1>Bienvenido, <%out.println(request.getParameter("usuarioI"));%><a href="index.jsp">Cerrar sesion</a></h1>

<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>