<%@page import="java.util.ArrayList"%>
<%@page import="POJOs.News"%>
<%@page import="controller.ControlNewsManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador de Noticias</title>

        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet" />
        
        <!-- JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    
    <body>
        <%
            if(session.getAttribute("email") == null){
                session.setAttribute("flag", false);
                response.sendRedirect("index.jsp");
            } 
            
            String action = request.getParameter("action");
            String actionA = "" + session.getAttribute("action");
            String title = "";
            
            ControlNewsManager manager = new ControlNewsManager();
            
            if(action != null || actionA != null){
                if(action == null) action = "";
                
                title = request.getParameter("title");
                if(action.compareTo("delete") == 0){
                    manager.setTitle(title);
                            
                    int cont = manager.execute(2);
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
            manager.execute(0);
            ArrayList<News> list = manager.getList();
        %>
        <div class="container-fluid">
            
            <!-- HEADER -->
            <div class="row">
                <div class="py-3 col-12">
                    <img class="float-start" src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="200" height="150">
                </div>

                <div class="col-12">
                    <p class="fs-1 text-center font-monospace">Noticias</p>
                </div>
            </div>
            
            <!-- NEWS TABLE -->
            <div class="row col-11 mx-auto">
                <div class="col-12">
                    <table class="table table-striped align-middle">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>URL</th>
                                <th>Titulo</th>
                                <th>Cuerpo</th>
                                <th>Autor</th>
                                <th>Dia Inicio</th>
                                <th>Dia Fin</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>                         
                            <%for(int i = 0; i < list.size(); i++){
                                News news = list.get(i);
                            %>
                                <tr>
                                    <td><%=news.getID()%></td>
                                    <td><%=news.getUrl_Image()%></td>
                                    <td><%=news.getTitle()%></td>
                                    <td><%=news.getDescription()%></td>
                                    <td><%=news.getAuthor()%></td>
                                    <td><%=news.getDate_Init()%></td>
                                    <td><%=news.getDate_Fin()%></td>
                                    <td>
                                        <!-- EDIT BUTTON -->
                                        <form method="POST" action="form_news.jsp">
                                            <div class="d-grid gap-2">
                                                <input type="hidden" name="action" value="edit">
                                                <input name="url_image" type="hidden" value="<%=news.getUrl_Image()%>">
                                                <input name="title" type="hidden" value=""<%=news.getTitle()%>">
                                                <input name="description" type="hidden" value="<%=news.getDescription()%>">
                                                <input name="author" type="hidden" value="<%=news.getAuthor()%>">
                                                <input name="dateInit" type="hidden" value="<%=news.getDate_Init()%>">
                                                <input name="dateFin" type="hidden" value="<%=news.getDate_Fin()%>">
                                                <input type="submit" value="Editar" class="btn btn-warning">
                                            </div>
                                        </form>
                                    </td>
                                    <td>
                                        <!-- DELETE BUTTON -->
                                        <form method="POST" action="news.jsp">
                                            <div class="d-grid gap-2">
                                                <input type="hidden" name="accion" value="delete">
                                                <input name="title" type="hidden" value=""<%=news.getTitle()%>">
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
                    <form method="GET" action="menu.jsp">
                        <div class="d-grid gap-2">
                            <input type="submit" value="Volver Atrás" class="btn btn-secondary">
                        </div>
                    </form>
                </div>

                <!-- INSERT BUTTON -->
                <div class="col-9">
                    <form method="POST" action="form_news.jsp">
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
