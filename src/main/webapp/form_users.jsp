<%@page import="controller.ControlUsersManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión Alumnos</title>

        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet" />
        
        <!-- JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    
    <body>
        <!-- JAVA -->
        <% 
            if(session.getAttribute("email") == null){
                session.setAttribute("flag", false);
                response.sendRedirect("login.jsp");
            } 
            
            int rolP = -1;
            String url = "";
            rolP = Integer.parseInt(session.getAttribute("rol").toString());
            if(session.getAttribute("rol") == null || rolP == 0){
                session.setAttribute("flag", false);
                response.sendRedirect("menu.jsp");
            }
            //url = "https://avatars.dicebear.com/api/initials/" + session.getAttribute("email").toString() + ".svg?size=70&r=50";
            url = "https://avatars.dicebear.com/api/identicon/" + session.getAttribute("email").toString() + ".svg?b=white&size=70&r=50";
        %>
        <div class="container-fluid">
            <!-- HEADER -->
            <div class="row">
                <div class="py-2 col-12">
                    <img class="float-start" src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="200" height="150">
                    <div class="float-end col-2 me-4">
                        <img class="pt-5 mx-auto d-block" src="<%= url%>">
                        <p class="fs-5 font-monospace text-center"><%= session.getAttribute("name")%></p>
                    </div>
                </div>
                <%
                    String action = request.getParameter("action");
                    int id = -1;
                    String name = "";
                    String email = "";
                    String password = "";
                    int rol = 0;

                    if(action == null) action = "insert";
                    String btnValue = "Insertar";
                    String actionValue = "Add";
                    ControlUsersManager manager = new ControlUsersManager();

                    if(action.compareTo("insert") == 0){%>
                        <div class="col-12">
                            <p class="fs-1 text-center font-monospace">Añadir Usuario</p>
                        </div>
                    <%}
                    else if(action.compareTo("edit") == 0){
                        btnValue = "Editar";
                        actionValue = "Edit";
                        id = Integer.parseInt(request.getParameter("id"));
                        name = request.getParameter("name");
                        email = request.getParameter("email");
                        password = request.getParameter("password");
                        rol = Integer.parseInt(request.getParameter("rol"));
                    %>
                        <div class="col-12">
                            <p class="fs-1 text-center font-monospace">Editar Usuario</p>
                        </div>
                    <%}else if(action.compareTo("Add") == 0){%>
                        <div class="col-12">
                            <p class="fs-1 text-center font-monospace">Añadir Usuario</p>
                        </div>
                      <%
                        name = request.getParameter("name");
                        email = request.getParameter("email");
                        password = request.getParameter("password");
                        rol = Integer.parseInt(request.getParameter("rol"));

                        if(name == null || name.isBlank()){%>
                            <div class="alert alert-danger" role="alert">El nombre no puede estar en blanco</div>
                        <%}else if(email == null || email.isBlank()){%>
                            <div class="alert alert-danger" role="alert">El correo no puede estar en blanco</div>
                        <%}else if(password == null || password.isBlank()){%>
                            <div class="alert alert-danger" role="alert">Debe elegir una contraseña</div>
                        <%}else if(!email.contains("@")){%>
                            <div class="alert alert-danger" role="alert">El correo debe contener un @</div>
                        <%}else{
                            manager.setName(name);
                            manager.setEmail(email);
                            manager.setPassword(password);
                            manager.setRol(rol);

                            int cont = manager.execute(2);

                            if(cont != 1){%>
                                <div class="alert alert-danger" role="alert">Ya existe dicho correo</div>
                            <%}else{
                                session.setAttribute("action", "insert");
                                response.sendRedirect("http://localhost:8080/Web/users.jsp");
                            } 
                        }
                    }else if(action.compareTo("Edit") == 0){
                        btnValue = "Editar";
                        actionValue = "Edit";
                    %>
                        <div class="col-12">
                            <p class="fs-1 text-center font-monospace">Editar Usuario</p>
                        </div>
                      <%
                        id = Integer.parseInt(request.getParameter("id"));
                        name = request.getParameter("name");
                        email = request.getParameter("email");
                        password = request.getParameter("password");
                        rol = Integer.parseInt(request.getParameter("rol"));

                        if(name == null || name.isBlank()){%>
                            <div class="alert alert-danger" role="alert">El nombre no puede estar en blanco</div>
                        <%}else if(email == null || email.isBlank()){%>
                            <div class="alert alert-danger" role="alert">El correo no puede estar en blanco</div>
                        <%}else if(password == null || password.isBlank()){%>
                            <div class="alert alert-danger" role="alert">Debe elegir una contraseña</div>
                        <%}else if(!email.contains("@")){%>
                            <div class="alert alert-danger" role="alert">El correo debe contener un @</div>
                        <%}else if(id == 1 && rol != 1){%>
                            <div class="alert alert-danger" role="alert">Este usuario no puede ser degradado a Profesor</div>
                        <%}else{
                            manager.setID(id);
                            manager.setName(name);
                            manager.setEmail(email);
                            manager.setPassword(password);
                            manager.setRol(rol);

                            int cont = manager.execute(3);

                            if(cont != 1){%>
                                <div class="alert alert-danger" role="alert">Ya existe dicho correo</div>
                            <%}else{
                                session.setAttribute("action", "edit");
                                response.sendRedirect("users.jsp");
                            } 
                        }
                    }%>
            </div>
            <!-- FORM -->
            <div class="row">
                <form method="POST" action="form_users.jsp">
                    <div class="py-3 col-8 mx-auto">
                        <!-- ID -->
                        <input type="hidden" name="id" value="<%= id%>">

                        <!-- NAME -->
                        <div class="py-3 col-8 mx-auto">
                            <input type="text" class="form-control fs-5 text-center" name="name" placeholder="Nombre" value="<%= name%>">
                        </div>

                        <!-- EMAIL -->
                        <div class="py-3 col-8 mx-auto">
                            <input type="text" class="form-control fs-5 text-center" name="email" placeholder="Correo" value="<%= email%>">
                        </div>

                        <!-- PASSWORD -->
                        <div class="py-3 col-8 mx-auto">
                            <input type="text" class="form-control fs-5 text-center" name="password" placeholder="Contraseña" value="<%= password%>">
                        </div>

                        <!-- ROL -->
                        <div class="py-3 col-8 mx-auto">
                            <label for="rol" class="form-label">Rol del Usuario</label>
                            <select class="form-select" name="rol" aria-label="Default select example">
                                <%if(rol == 0){%> 
                                    <option selected value="0">Profesor</option>
                                    <option value="1">Administrador</option>
                                <%}else{%>
                                    <option selected value="1">Administrador</option>
                                    <option value="0">Profesor</option>
                                <%}%>    
                            </select>
                        </div>
                    </div>
                    <!-- BUTTON -->
                    <div class="py-3 col-5 mx-auto d-grid gap-2">
                        <input type="hidden" name="action" value="<%= actionValue%>">
                        <input type="submit" value="<%= btnValue%>" class="btn btn-primary">
                    </div>    
                </form>
            </div>
            
            <!-- RETURN BUTTON -->
            <div class="row">
                <form method="POST" action="users.jsp">
                    <div class="col-5 mx-auto d-grid gap-2">
                        <input type="submit" value="Volver Atrás" class="btn btn-secondary">
                    </div>
                </form>
            </div>
        </div> <!-- END CONTAINER -->

        <!-- Bootstrap JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
