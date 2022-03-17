<%@page import="controller.ControlUsersManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador de la Pantalla</title>
        
        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        
        <!-- JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>   
    </head>
    
    <body>
        <!-- JAVA -->
        <%
            String action = request.getParameter("action");
            String email = "", password = "";
            
            if(session.getAttribute("flag") != null){
                session.invalidate();%>
                <div class="alert alert-danger" role="alert">Antes de acceder al resto de funciones, debe iniciar sesión</div>
                <%}else if(session.getAttribute("flag2") != null){
                session.invalidate();%>
                <div class="alert alert-danger" role="alert">Has eliminado tu cuenta correctamente</div>
          <%}else if(session.getAttribute("email") != null)
                session.invalidate();
            else{
                ControlUsersManager manager = new ControlUsersManager();

                if(action != null){
                    if(action.compareTo("login") == 0){
                        email = request.getParameter("email");
                        password = request.getParameter("password");

                        if(email.isBlank() || email == null){%>
                            <div class="alert alert-danger" role="alert">El correo no puede estar vacío</div>
                        <%}else if(password.isBlank() || password == null){%>
                            <div class="alert alert-danger" role="alert">La contraseña no puede estar vacía</div>
                        <%}else{
                            manager.setEmail(email);
                            manager.setPassword(password);
                            int cont = manager.execute(0);

                            if(cont == 0){%>
                                <div class="alert alert-danger" role="alert">El correo no coincide</div>
                            <%}else if(cont == -1){%>    
                                <div class="alert alert-danger" role="alert">Contraseña incorrecta</div>
                            <%}else{
                                session.setAttribute("email", email);
                                session.setAttribute("password", password);
                                session.setAttribute("name", manager.getName());
                                session.setAttribute("rol", manager.getRol());
                                response.sendRedirect("menu.jsp");
                            }
                        }
                    }
                }
            }%>
        
        <div class="container-fluid">
            <!-- LOGO -->
            <div class="row">
                <div class="py-3">
                    <img class="float-start" src="images/logo.png" width="200" height="150">
                </div>
                <div class="py-2">
                    <h1 class="fs-1 font-monospace text-center">Iniciar Sesión</h1>
                </div>
            </div>
            
            <div class="row py-4 col-10 justify-content-evenly mx-auto recuadro-login">
                <div class="col-2">
                    <img src="https://images.genial.ly/genially/layouts/9dfa6849-4c71-4fca-83c6-5fa401b169a5.png" width="300" height="300">
                </div>
                
                <div class="col-8 align-self-center">
                    <!-- FORM -->
                    <div class="row form-group">
                        <form method="POST" action="login.jsp">
                            <div class="col-10 mx-auto my-4">
                                <input type="text" class="form-control fs-5 text-center" name="email" placeholder="Correo" value="<%= email%>">
                            </div>

                            <div class="col-10 mx-auto my-4">
                                <input type="password" class="form-control fs-5 text-center" name="password" placeholder="Contraseña" value="<%= password%>">
                            </div>

                            <!-- LOGIN BUTTON -->
                            <div class="py-3 col-3 mx-auto d-grid gap-2">
                                <input type="hidden" name="action" value="login">
                                <input type="submit" value="Iniciar Sesión" class="btn btn-primary">
                            </div>     
                        </form>
                    </div>
                </div>
            </div> 
        </div> <!-- END CONTAINER -->
    </body>
</html>
