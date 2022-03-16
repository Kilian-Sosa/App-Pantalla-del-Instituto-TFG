<%@page import="controller.ControlNewsManager"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Noticias</title>

        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" />
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.maxlength.css"> 
        <!-- JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript" src="js/jquery.plugin.js"></script> 
        <script type="text/javascript" src="js/jquery.maxLength.min.js"></script>
        <script type="text/javascript">
            $('#defaultLength').maxlength(); 
 
            $('#removeLength').click(function() { 
                var destroy = $(this).text() === 'Remove'; 
                $(this).text(destroy ? 'Re-attach' : 'Remove'); 
                $('#defaultLength').maxlength(destroy ? 'destroy' : {}); 
            }); 

            $('#disableLength').click(function() { 
                var enable = $(this).text() === 'Enable'; 
                $(this).text(enable ? 'Disable' : 'Enable'); 
                $('#defaultLength').maxlength(enable ? 'enable' : 'disable'); 
            });
        </script>
    </head>
    
    <body>
        <!-- JAVA -->
        <% 
            if(session.getAttribute("email") == null){
                session.setAttribute("flag", false);
                response.sendRedirect("login.jsp");
            } 
            String url = "";
            //url = "https://avatars.dicebear.com/api/initials/" + session.getAttribute("email").toString() + ".svg?size=70&r=50";
            url = "https://avatars.dicebear.com/api/identicon/" + session.getAttribute("email").toString() + ".svg?b=white&size=70&r=50";
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
                <%
                    String action = request.getParameter("action");
                    int id = 0;
                    String title = "";
                    String description = "";
                    String dateInit = "";
                    String dateFin = "";
                    String url_Image = "";
                    String author = session.getAttribute("email").toString();

                    if(action == null) action = "insert";
                    String btnValue = "Insertar";
                    String actionValue = "Add";
                    ControlNewsManager manager = new ControlNewsManager();

                    if(action.compareTo("insert") == 0){%>
                        <div class="col-12">
                            <p class="fs-1 text-center font-monospace">Añadir Noticia</p>
                        </div>
                    <%}
                    else if(action.compareTo("edit") == 0){
                        btnValue = "Editar";
                        actionValue = "Edit";

                        id = Integer.parseInt(request.getParameter("id"));
                        title = request.getParameter("title");

                        if(request.getParameter("description") != null) description = request.getParameter("description");
                        else description = "";

                        dateInit = request.getParameter("dateinit");
                        dateFin = request.getParameter("datefin");
                        if(request.getParameter("url_image") != null) url_Image = request.getParameter("url_image");
                        else url_Image = "";
                    %>
                        <div class="col-12">
                            <p class="fs-1 text-center font-monospace">Editar Noticia</p>
                        </div>
                    <%}else if(action.compareTo("Add") == 0){%>
                        <div class="col-12">
                            <p class="fs-1 text-center font-monospace">Añadir Noticia</p>
                        </div>
                      <%
                        title = request.getParameter("title");
                        if(request.getParameter("description") != null) description = request.getParameter("description");
                        else description = "";

                        dateInit = request.getParameter("dateinit");
                        dateFin = request.getParameter("datefin");
                        if(request.getParameter("url_image") != null) url_Image = request.getParameter("url_image");
                        else url_Image = "";

                        if(title == null || title.isBlank()){%>
                            <div class="alert alert-danger" role="alert">El título no puede estar en blanco</div>
                        <%}else if(dateInit == null || dateFin == null || dateInit.isBlank() || dateFin.isBlank()){%>
                            <div class="alert alert-danger" role="alert">Escoja las fechas</div>
                        <%}else{
                            manager.setTitle(title);
                            manager.setDescription(description);
                            manager.setDateInit(dateInit);
                            manager.setDateFin(dateFin);
                            manager.setUrl_Image(url_Image);
                            manager.setAuthor(author);

                            int cont = manager.execute(1);

                            if(cont != 1){%>
                                <div class="alert alert-danger" role="alert">Ha habido un problema al añadir la noticia</div>
                            <%}else{
                                session.setAttribute("action", "insert");
                                response.sendRedirect("news.jsp");
                            } 
                        }
                    }else if(action.compareTo("Edit") == 0){
                        btnValue = "Editar";
                        actionValue = "Edit";
                    %>
                        <div class="col-12">
                            <p class="fs-1 text-center font-monospace">Editar Noticia</p>
                        </div>
                      <%
                        id = Integer.parseInt(request.getParameter("id"));
                        title = request.getParameter("title");

                        if(request.getParameter("description") != null) description = request.getParameter("description");
                        else description = "";

                        dateInit = request.getParameter("dateinit");
                        dateFin = request.getParameter("datefin");
                        if(request.getParameter("url_image") != null) url_Image = request.getParameter("url_image");
                        else url_Image = "";

                        if(dateInit == null || dateFin == null || dateInit.isBlank() || dateFin.isBlank()){%>
                            <div class="alert alert-danger" role="alert">Escoja las fechas</div>
                        <%}else{
                            manager.setID(id);
                            manager.setTitle(title);
                            manager.setDescription(description);
                            manager.setDateInit(dateInit);
                            manager.setDateFin(dateFin);
                            manager.setUrl_Image(url_Image);
                            manager.setAuthor(author);

                            int cont = manager.execute(2);

                            if(cont != 1){%>
                                <div class="alert alert-danger" role="alert">Ha habido un problema al editar la noticia</div>
                            <%}else{
                                session.setAttribute("action", "edit");
                                response.sendRedirect("news.jsp");
                            } 
                        }
                    }%>
            </div>

            <!-- FORM -->
            <div class="row">
                <form method="POST" action="form_news.jsp">
                    <!-- ID -->
                    <input type="hidden" name="id" value="<%= id%>">
                    
                    <!-- TITLE -->
                    <div class="col-8 mx-auto">
                        <input type="text" class="form-control fs-5 text-center" name="title" placeholder="Título" value="<%= title%>">
                    </div>
                    
                    <!-- DESCRIPTION -->
                    <div class="py-3 col-8 mx-auto">
                        <textarea id="maxLength" rows="6" type="text" class="form-control fs-5 text-center text-justify is-maxlength" name="description" placeholder="Cuerpo (Máximo 400 caractéres)"><%= description%></textarea>
                    </div>
                    
                    <!-- IMAGE -->
                    <div class="py-3 col-8 mx-auto">
                        <input class="form-control" type="file" id="formFile" name="url_image" value="<%= url_Image%>">
                    </div>
                    
                    <div class="row justify-content-center">
                        <!-- START DATE -->
                        <div class="py-3 col-2 align-self-center">
                            <div class="input-group date" id="datepicker">
                                <input type="text" class="form-control" placeholder="Fecha Inicio" name="dateinit" value="<%= dateInit%>">
                                <span class="input-group-append">
                                    <span class="input-group-text bg-white d-block">
                                        <i class="fa fa-calendar"></i>
                                    </span>
                                </span>
                            </div>
                        </div>

                        <!-- END DATE -->
                        <div class="py-3 col-2 align-self-start">
                            <div class="input-group date" id="datepicker2">
                                <input type="text" class="form-control" placeholder="Fecha Fin" name="datefin" value="<%= dateFin%>">
                                <span class="input-group-append">
                                    <span class="input-group-text bg-white d-block">
                                        <i class="fa fa-calendar"></i>
                                    </span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <script type="text/javascript">
                        $(function() {
                            
                            $('#datepicker').datepicker({format: 'dd/mm/yyyy', startDate: '-0d', todayHighlight: 'true', weekStart:'1'});
                            $('#datepicker2').datepicker({format: 'dd/mm/yyyy', startDate: '+1d', todayHighlight: 'true', weekStart:'1'});
                        });
                    </script>

                    <!-- BUTTON -->
                    <div class="py-3 col-3 mx-auto d-grid gap-2">
                        <input type="hidden" name="action" value="<%= actionValue%>">
                        <input type="submit" value="<%= btnValue%>" class="btn btn-primary">
                    </div>    
                </form>
            </div>      
                    
            <!-- RETURN BUTTON -->
            <div class="row">
                <form method="POST" action="news.jsp">
                    <div class="col-3 mx-auto d-grid gap-2">
                        <input type="submit" value="Volver Atrás" class="btn btn-secondary">
                    </div>
                </form>
            </div>
        </div> <!-- END CONTAINER -->
    </body>
</html>
