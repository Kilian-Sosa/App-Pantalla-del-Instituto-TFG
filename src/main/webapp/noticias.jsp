<%@page import="java.util.ArrayList"%>
<%@page import="POJOs.News"%>
<%@page import="controller.ControlNewsManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Noticias</title>

        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet" />
        
        <!-- JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    
    <body>
        <%
            //String email = request.getParameter("email");
            ControlNewsManager manager = new ControlNewsManager();
            int cont = manager.execute(0);
            ArrayList<News> list = manager.getList();
            
            if(cont == 0){
                if(list == null) list = new ArrayList();
                if(list.isEmpty()){
                    list.add(new News("Todavía no hay ninguna noticia", "Introduzca una noticia", "20/02/2022", "30/02/2022"));
                    list.get(0).setUrl_Image("");
                }
                System.out.println("No existen noticias en la base de datos");
            }
            %>
        <div class="container-fluid">
            
            <!-- ENCABEZADO -->
            <div class="row">
                <div class="py-3 col-12">
                    <img class="float-start" src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="150" height="150">
                </div>

                <div class="py-3 col-12">
                    <p class="fs-1 text-center font-monospace">Noticias</p>
                </div>
            </div>
        
            <!-- NOTICIAS -->
            <div class="row justify-content-evenly">
                <div class="recuadro-noticia col-8 align-self-center">
                    <p class="fs-4 text-center font-monospace border-bottom"><%= list.get(0).getTitle()%></p>
                    <% if(!list.get(0).getUrl_Image().equals("")){%> 
                        <img src= <%= list.get(0).getUrl_Image()%> align=left  hspace=15 vspace=15>  
                       <%}%> 
                    <p class="text-justify">
                        <%= list.get(0).getDescription()%>
                    </p>
                </div>
                
                <div class="recuadro-noticia col-3 align-self-center">
                    <p class="fs-4 text-center font-monospace border-bottom">Más Noticias:</p>
                    <table class="table align-middle">
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Titulo de noticias tochas</td>
                                <td>
                                    <div class="dropdown py-4">
                                        <button type="button" class="btn btn-light"><img src="https://cdn.discordapp.com/attachments/655942507955224587/948218645883027456/gear-solid.png" width="20" height="20"/></button>
                                        <div class="dropdown-content-noticias">
                                            <a href="#">Editar</a>
                                            <a href="#">Borrar</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Titulo de noticias pochas</td>
                                <td>
                                    <div class="dropdown py-4">
                                        <button type="button" class="btn btn-light"><img src="https://cdn.discordapp.com/attachments/655942507955224587/948218645883027456/gear-solid.png" width="20" height="20"/></button>
                                        <div class="dropdown-content-noticias">
                                            <a href="#">Editar</a>
                                            <a href="#">Borrar</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Titulo de noticias guapas</td>
                                <td>
                                    <div class="dropdown py-4">
                                        <button type="button" class="btn btn-light"><img src="https://cdn.discordapp.com/attachments/655942507955224587/948218645883027456/gear-solid.png" width="20" height="20"/></button>
                                        <div class="dropdown-content-noticias">
                                            <a href="#">Editar</a>
                                            <a href="#">Borrar</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Esto no es un título</td>
                                <td>
                                    <div class="dropdown py-4">
                                        <button type="button" class="btn btn-light"><img src="https://cdn.discordapp.com/attachments/655942507955224587/948218645883027456/gear-solid.png" width="20" height="20"/></button>
                                        <div class="dropdown-content-noticias">
                                            <a href="#">Editar</a>
                                            <a href="#">Borrar</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!-- CREAR -->
            <div class="row py-5">
                <form method="GET" action="form_noticias.jsp">
                    <div class="col-3 mx-auto d-grid gap-2">
                        <input type="hidden" name="action" value="insert">
                        <input type="submit" action="insert" value="Crear Noticia" class="btn btn-primary">
                        <input type="hidden" name="action" value="edit">
                        <input type="submit" action="edit" value="Modificar Noticia" class="btn btn-primary">
                    </div>
                </form>
            </div>
            
            <div class="row py-1">
                <form method="GET" action="menu.jsp">
                    <div class="col-3 mx-auto d-grid gap-2">
                        <input type="submit" value="Volver Atrás" class="btn btn-primary">
                    </div>
                </form>
            </div>
            
        </div> <!-- CIERRE CONTAINER -->

    </body>
</html>
