<%@page import="controller.ControlLogManager"%>
<%@page import="controller.ControlUsersManager"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.io.File"%>
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
                    String path = "";
                    String author = session.getAttribute("email").toString();
                    int mills = 30000;
                    String millsS = "";
                    
                    if(action == null) action = "insert";
                    String btnValue = "Insertar";
                    String actionValue = "Add";
                    ControlNewsManager managerN = new ControlNewsManager();
                    ControlLogManager managerL = new ControlLogManager();

                    if(action.compareTo("insert") == 0){%>
                        <div class="col-12">
                            <p class="fs-1 text-center font-monospace">Añadir Noticia</p>
                        </div>
                    <%}else if(action.compareTo("edit") == 0){
                        btnValue = "Editar";
                        actionValue = "Edit";

                        id = Integer.parseInt(request.getParameter("id"));
                        title = request.getParameter("title");

                        if(request.getParameter("description") != null) description = request.getParameter("description");
                        else description = "";

                        dateInit = request.getParameter("dateinit");
                        dateFin = request.getParameter("datefin");
                        if(request.getParameter("path") != null) path = request.getParameter("path");
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

                        mills = Integer.parseInt(request.getParameter("mills"));
                        dateInit = request.getParameter("dateinit");
                        dateFin = request.getParameter("datefin");
                        if(request.getParameter("path") != null) path = request.getParameter("path");

                        if(title == null || title.isBlank()){%>
                            <div class="alert alert-danger" role="alert">El título no puede estar en blanco</div>
                        <%}else if(dateInit == null || dateFin == null || dateInit.isBlank() || dateFin.isBlank()){%>
                            <div class="alert alert-danger" role="alert">Escoja las fechas</div>
                        <%}else{
                            managerN.setMills(mills);
                            managerN.setTitle(title);
                            managerN.setDescription(description);
                            managerN.setDateInit(dateInit);
                            managerN.setDateFin(dateFin);
                            managerN.setFile(new File(path));
                            managerN.setAuthor(author);

                            int cont = managerN.execute(1);

                            if(cont != 1){%>
                                <div class="alert alert-danger" role="alert">Ha habido un problema al añadir la noticia</div>
                            <%}else{
                                LocalDate localDate = LocalDate.now();
                                managerL.setAction("Creado la noticia: " + title);
                                managerL.setAuthor(session.getAttribute("name").toString());
                                managerL.setDate(localDate.getDayOfMonth() + "/" + localDate.getMonthValue() + "/" + localDate.getYear());

                                managerL.execute(1);
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
                        mills = Integer.parseInt(request.getParameter("mills"));

                        if(request.getParameter("description") != null) description = request.getParameter("description");
                        else description = "";

                        dateInit = request.getParameter("dateinit");
                        dateFin = request.getParameter("datefin");
                        if(request.getParameter("path") != null) path = request.getParameter("path");

                        if(dateInit == null || dateFin == null || dateInit.isBlank() || dateFin.isBlank()){%>
                            <div class="alert alert-danger" role="alert">Escoja las fechas</div>
                        <%}else{
                            managerN.setID(id);
                            managerN.setMills(mills);
                            managerN.setTitle(title);
                            managerN.setDescription(description);
                            managerN.setDateInit(dateInit);
                            managerN.setDateFin(dateFin);
                            managerN.setFile(new File(path));
                            managerN.setAuthor(author);

                            int cont = managerN.execute(2);

                            if(cont != 1){%>
                                <div class="alert alert-danger" role="alert">Ha habido un problema al editar la noticia</div>
                            <%}else{
                                LocalDate localDate = LocalDate.now();
                                managerL.setAction("Modificado la noticia: " + title);
                                managerL.setAuthor(session.getAttribute("name").toString());
                                managerL.setDate(localDate.getDayOfMonth() + "/" + localDate.getMonthValue() + "/" + localDate.getYear());

                                managerL.execute(1);
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
                    <div class="box py-3 col-8 mx-auto">
                        <textarea id="txtArea" maxlength="255" rows="4" type="text" class="form-control fs-5 text-center text-justify is-maxlength" name="description" placeholder="Cuerpo"><%= description%></textarea>
                        <div id="counter" class="float-end">0/255</div>
                    </div>
                    <script>
                        const message = document.getElementById('txtArea');
                        const counter = document.getElementById('counter');

                        message.addEventListener('input', function(e) {
                            const target = e.target;
                            const longitudMax = target.getAttribute('maxlength');
                            const longitudAct = target.value.length;
                            counter.innerHTML = `${longitudAct}/${longitudMax}`;
                        });
                    </script>
                    <!-- IMAGE -->
                    <div class="py-3 col-8 mx-auto">
                        <input class="form-control" type="file" id="formFile" name="path" value="<%= path%>">
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

                    <!-- TIME -->
                    <div class="py-3 col-8 mx-auto">
                        <label for="mills" class="form-label">Tiempo en Pantalla</label>
                        <select class="form-select" name="mills" aria-label="Default select example">
                            <%switch(mills){
                                case 30000: millsS = "30 segundos";
                                            break;
                                case 40000: millsS = "40 segundos";
                                            break;
                                case 50000: millsS = "50 segundos";
                                            break;
                                case 60000: millsS = "1 minuto";
                                            break;
                                case 70000: millsS = "1 minuto y 10 segundos";
                                            break;
                                case 80000: millsS = "1 minuto y 20 segundos";
                                            break;
                                case 90000: millsS = "1 minuto y 30 segundos";
                                            break;
                                case 100000: millsS = "1 minuto y 40 segundos";
                                            break;
                                case 110000: millsS = "1 minuto y 50 segundos";
                                            break;
                                case 120000: millsS = "2 minutos";
                                            break;
                            }%> 
                            
                            <option selected value="<%= mills%>"><%= millsS%></option>
                            <%if(mills != 30000)%> <option value="30000">30 segundos</option>
                            <%if(mills != 40000)%> <option value="40000">40 segundos</option>
                            <%if(mills != 50000)%> <option value="50000">50 segundos</option>
                            <%if(mills != 60000)%> <option value="60000">1 minuto</option>
                            <%if(mills != 70000)%> <option value="70000">1 minuto y 10 segundos</option>
                            <%if(mills != 80000)%> <option value="80000">1 minuto y 20 segundos</option>
                            <%if(mills != 90000)%> <option value="90000">1 minuto y 30 segundos</option>
                            <%if(mills != 100000)%> <option value="100000">1 minuto y 40 segundos</option>
                            <%if(mills != 110000)%> <option value="110000">1 minuto y 50 segundos</option>
                            <%if(mills != 120000)%> <option value="120000">2 minutos</option> 
                        </select>
                    </div>
                        
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
