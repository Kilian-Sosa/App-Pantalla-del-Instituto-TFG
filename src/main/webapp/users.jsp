<%@page import="POJOs.User"%>
<%@page import="POJOs.Email"%>
<%@page import="controller.ControlUsersManager"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador de la Pantalla</title>
        
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
            
            int rol = -1;
            String url = "";
            rol = Integer.parseInt(session.getAttribute("rol").toString());
            if(session.getAttribute("rol") == null || rol == 0){
                session.setAttribute("flag", false);
                response.sendRedirect("menu.jsp");
            }
            //url = "https://avatars.dicebear.com/api/initials/" + session.getAttribute("email").toString() + ".svg?size=70&r=50";
            url = "https://avatars.dicebear.com/api/identicon/" + session.getAttribute("email").toString() + ".svg?b=white&size=70&r=50";
            
            String action = "", actionA = "";
            if(request.getParameter("action") != null) action = request.getParameter("action");
            if(session.getAttribute("action") != null) actionA = session.getAttribute("action").toString();
            int id = 0;
            
            ControlUsersManager manager = new ControlUsersManager();
            
            if(!action.isBlank() || !actionA.isBlank()){
                if(request.getParameter("id") != null) id = Integer.parseInt(request.getParameter("id"));
                if(action.compareTo("delete") == 0){
                    if(id == 1){%>
                        <div class="alert alert-danger" role="alert">No se puede borrar este administrador</div>
                    <%}else{    
                        manager.setID(id);

                        int cont = manager.execute(4);
                        if(cont != 1){%>
                            <div class="alert alert-danger" role="alert">Ha habido un error al eliminar el usuario</div>
                        <%}else{%>
                            <div class="alert alert-success" role="alert">Se ha eliminado el usuario correctamente</div>
                        <%} 
                    }        
                }else{
                    session.removeAttribute("action");
                    if(actionA.compareTo("edit") == 0){%>
                        <div class="alert alert-success" role="alert">Se ha modificado correctamente el usuario</div>  
                    <%}else if(actionA.compareTo("insert") == 0){%>
                        <div class="alert alert-success" role="alert">Se ha insertado el usuario correctamente</div>
                    <%}   
                }
            }    
            manager.execute(1);
            ArrayList<User> list = manager.getList();
        %>
        
        <div class="container-fluid">
            <!-- HEADER -->
            <div class="row py-3">
                <div class="col-12">
                    <img class="float-start" src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="200" height="150">
                    <div class="float-end col-2 me-4">
                        <img class="pt-5 mx-auto d-block" src="<%= url%>">
                        <p class="fs-5 font-monospace text-center"><%= session.getAttribute("name")%></p>
                    </div>
                </div>
                
                <div class="col-12">
                    <p class="fs-1 text-center font-monospace">Gestor de Usuarios</p>
                </div>
            </div>
            
            <!-- USERS TABLE -->
            <div class="row col-11 mx-auto">
                <div class="col-12">
                    <table class="table table-striped align-middle">
                        <thead>
                            <tr>
                                <th><a href="users.jsp">ID</a></th>
                                <th><a href="users.jsp">Nombre</a></th>
                                <th><a href="users.jsp">Correo</a></th>
                                <th><a href="users.jsp">Rol</a></th>
                                <!-- <th><a href="users.jsp">Ausencia</a></th> -->
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>                         
                            <tr>                         
                            <%for(int i = 0; i < list.size(); i++){
                                User user = list.get(i);
                            %>
                                <tr>
                                    <td><%=user.getID()%></td>
                                    <td><%=user.getName()%></td>
                                    <td><%=user.getEmail().getEmail()%></td>
                                    <td><%= user.getRolS()%></td>
                                    <!-- user.getAbscense()%></td> -->
                                    <td>
                                        <!-- EDIT BUTTON -->
                                        <form method="POST" action="form_users.jsp">
                                            <div class="d-grid gap-2">
                                                <input type="hidden" name="action" value="edit">
                                                <input name="id" type="hidden" value="<%=user.getID()%>">
                                                <input name="name" type="hidden" value="<%=user.getName()%>">
                                                <input name="email" type="hidden" value="<%=user.getEmail().getEmail()%>">
                                                <input name="password" type="hidden" value="<%=user.getEmail().getPassword()%>">
                                                <input name="rol" type="hidden" value="<%=user.getRol()%>">
                                                <!-- <input name="absence" type="hidden" value="%user.getAbscense()%>"> -->
                                                <input type="submit" value="Editar" class="btn btn-primary">
                                            </div>
                                        </form>
                                    </td>
                                    <td>
                                        <!-- DELETE BUTTON -->
                                        <form method="POST" action="users.jsp">
                                            <div class="d-grid gap-2">
                                                <input type="hidden" name="action" value="delete">
                                                <input name="id" type="hidden" value="<%=user.getID()%>">
                                                <input type="submit" value="Eliminar" class="btn btn-secondary">
                                            </div>
                                        </form>
                                    </td>
                                </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="row py-5 col-11 mx-auto justify-content-evenly">
                <!-- RETURN BUTTON -->
                <div class="col-3">
                    <form method="POST" action="menu.jsp">
                        <div class="d-grid gap-2">
                            <input type="submit" value="Volver Atrás" class="btn btn-secondary">
                        </div>
                    </form>
                </div>
                
                <!-- INSERT BUTTON -->
                <div class="col-9">
                    <form method="POST" action="form_users.jsp">
                        <div class="d-grid gap-2">
                            <input type="hidden" name="action" value="insert">
                            <input type="submit" action="insert" value="Insertar" class="btn btn-primary">
                        </div>
                    </form>
                </div>
            </div>
        </div> <!-- END CONTAINER -->
    </body>
</html>
