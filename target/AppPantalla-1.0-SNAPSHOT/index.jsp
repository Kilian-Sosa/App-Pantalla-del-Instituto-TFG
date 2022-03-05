<%@page import="controller.LogInManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador de la Pantalla</title>
        
        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        
        <!-- JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>   
    </head>
    
    <body>
        <!-- JAVA -->
        <%
            String action = request.getParameter("action");
            String email = "", password = "";
            
            LogInManager manager = new LogInManager();
            
            if(action != null){
                if(action.compareTo("login") == 0){
                        email = request.getParameter("email");
                        password = request.getParameter("password");
                        manager.setEmail(email);
                        manager.setPassword(password);
                        
                        if(email.isBlank() || email == null){%>
                            <div class="alert alert-danger" role="alert">El correo no puede estar vacío</div>
                        <%}else if(password.isBlank() || password == null){%>
                            <div class="alert alert-danger" role="alert">La contraseña no puede estar vacía</div>
                        <%}else{
                                int cont = manager.execute();
                                System.out.println(cont);

                                if(cont == 0){%>
                                    <div class="alert alert-danger" role="alert">El correo no coincide</div>
                                <%}else if(cont == -1){%>    
                                    <div class="alert alert-danger" role="alert">Contraseña incorrecta</div>
                                <%}else{
                                    response.sendRedirect("http://localhost:8080/Web/menu.jsp");
                                }
                            }
                }
            }%>
        
        <div class="container-fluid">
            
            <!-- ENCABEZADO -->
            <div class="row">
                <div class="py-3 col-12">
                    <img class="float-start" src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="150" height="150">
                </div>
                
                <div class="py-3 col-12">
                    <h1 class="fs-1 font-monospace text-center">Iniciar Sesión</h1>
                </div>
            </div>
            
            <!-- FORM -->
            <div class="form-group row">
                <form method="GET" action="index.jsp">
                    <div class="col-6 mx-auto my-4">
                        <input type="text" class="form-control fs-5 text-center" name="email" placeholder="Correo" value="<%= email%>">
                    </div>

                    <div class="col-6 mx-auto my-4">
                        <input type="password" class="form-control fs-5 text-center" name="password" placeholder="Contraseña" value="<%= password%>">
                    </div>
                    
                    <!-- BUTTON LOGIN -->
                    <div class="py-3 col-3 mx-auto d-grid gap-2">
                        <input type="hidden" name="action" value="login">
                        <input type="submit" value="Iniciar Sesión" class="btn btn-primary">
                    </div>     
                </form>
            </div>
            
        </div> <!-- END CONTAINER -->
                            
    </body>
</html>
