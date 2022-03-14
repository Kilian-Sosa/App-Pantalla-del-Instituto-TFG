<%@page import="java.util.ArrayList"%>
<%@page import="POJOs.News"%>
<%@page import="controller.ControlNewsManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" charset="UTF-8">
        <title>Administrador de la Pantalla</title>

        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="style.css" rel="stylesheet" />
        
        <!-- JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    
    <body>
        <%
            ControlNewsManager manager = new ControlNewsManager();
            manager.execute(0);
            ArrayList<News> list = manager.getList();
        %>
        <div class="container-fluid">
            <!-- HEADER -->
            <div class="row">
                <div class="py-2 col-12">
                    <img class="float-start" src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="200" height="150">
                </div>

                <div class="py-2 col-12">
                    <p class="fs-1 text-center font-monospace">Noticias</p>
                </div>
            </div>
        
            <!-- NEWS -->
            <div class="row justify-content-evenly">
                <div class="recuadro-noticia col-8 align-self-center">
                    <p class="fs-4 text-center font-monospace border-bottom"><%= list.get(0).getTitle()%></p>
                    <% if(!list.get(0).getUrl_Image().equals("")){%> 
                        <img src= <%= list.get(0).getUrl_Image()%> align=left  hspace=15 vspace=15>  
                       <%}else{%> 
                        <img src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="200" height="150" align=left  hspace=5 vspace=5>  
                       <%}%>
                    <p class="text-justify">
                        <%= list.get(0).getDescription()%>
                    </p>
                </div>
                
                <div class="recuadro-noticia col-3 align-self-center">
                    <p class="fs-4 text-center font-monospace border-bottom">Más Noticias</p>
                    <table class="table align-middle">
                        <thead>
                            <tr>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for(int i = 1; i < list.size(); i++){%>
                                <tr>
                                    <td><%=list.get(i).getTitle()%></td>
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
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div> <!-- END CONTAINER -->
    </body>
</html>
