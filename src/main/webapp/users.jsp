<%@page import="POJOs.User"%>
<%@page import="POJOs.Email"%>
<%@page import="controller.ControlUsersManager"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            int rol = -1;
            String url = "";
            if(session.getAttribute("rol") == null || rol == 0){
                session.setAttribute("flag", false);
                response.sendRedirect("menu.jsp");
            }
            rol = Integer.parseInt(session.getAttribute("rol").toString());
            //url = "https://avatars.dicebear.com/api/initials/" + session.getAttribute("email").toString() + ".svg?size=70&r=50";
            url = "https://avatars.dicebear.com/api/identicon/" + session.getAttribute("email").toString() + ".svg?b=white&size=70&r=50";
            
            
            String action = request.getParameter("action");
            String actionA = "" + session.getAttribute("action");
            int id = 0;
            
            ControlUsersManager manager = new ControlUsersManager();
            
            if(action != null || actionA != null){
                if(action == null) action = "";
                
                id = Integer.parseInt(request.getParameter("id"));
                if(action.compareTo("delete") == 0){
                    manager.setID(id);
                            
                    int cont = manager.execute(4);
                    if(cont != 1){%>
                        <div class="alert alert-danger" role="alert">Ha habido un error al eliminar la noticia</div>
                    <%}else{%>
                        <div class="alert alert-success" role="alert">Se ha eliminado la noticia correctamente</div>
                    <%} 
                }else{
                    session.removeAttribute("action");
                    if(actionA.compareTo("edit") == 0){%>
                        <div class="alert alert-success" role="alert">Se ha modificado correctamente la noticia</div>  
                    <%}else if(actionA.compareTo("insert") == 0){%>
                        <div class="alert alert-success" role="alert">Se ha insertado la noticia correctamente</div>
                    <%}   
                }
            }    
            manager.execute(1);
            ArrayList<User> list = manager.getList();
        %>
        
        <div class="container-fluid">
            <!-- HEADER -->
            <div class="row py-3">
                <div class="py-2 col-12">
                    <img class="float-start" src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="200" height="150">
                    <div class="float-end col-2 me-4">
                        <img class="pt-5 mx-auto d-block" src="<%= url%>">
                        <p class="fs-5 py-3 font-monospace text-center"><%= session.getAttribute("name")%></p>
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
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Correo</th>
                                <th>Rol</th>
                                <th>Ausencia</th>
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
                                    <td><%=user.getRol()%></td>
                                    <td><!-- %user.getAbscense()%> --></td>
                                    <td>
                                        <!-- EDIT BUTTON -->
                                        <form method="POST" action="form_users.jsp">
                                            <div class="d-grid gap-2">
                                                <input type="hidden" name="action" value="edit">
                                                <input name="url_image" type="hidden" value="<%=user.getID()%>">
                                                <input name="title" type="hidden" value=""<%=user.getName()%>">
                                                <input name="description" type="hidden" value="<%=user.getEmail().getEmail()%>">
                                                <input name="author" type="hidden" value="<%=user.getRol()%>">
                                                <!-- <input name="dateInit" type="hidden" value="%user.getAbscense()%>"> -->
                                                <input type="submit" value="Editar" class="btn btn-warning">
                                            </div>
                                        </form>
                                    </td>
                                    <td>
                                        <!-- DELETE BUTTON -->
                                        <form method="POST" action="users.jsp">
                                            <div class="d-grid gap-2">
                                                <input type="hidden" name="accion" value="delete">
                                                <input name="id" type="hidden" value="<%=user.getID()%>">
                                                <input type="submit" value="Eliminar" class="btn btn-danger">
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
                    <form method="POST" action="form_usuarios.jsp">
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
