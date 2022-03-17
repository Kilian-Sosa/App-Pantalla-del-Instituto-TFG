<%@page import="POJOs.Log"%>
<%@page import="controller.ControlLogManager"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial</title>
        
        <!-- CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" />
        
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
            if(session.getAttribute("rol") == null || rol == 0){
                session.setAttribute("flag", false);
                response.sendRedirect("menu.jsp");
            }
            rol = Integer.parseInt(session.getAttribute("rol").toString());
            //url = "https://avatars.dicebear.com/api/initials/" + session.getAttribute("email").toString() + ".svg?size=70&r=50";
            url = "https://avatars.dicebear.com/api/identicon/" + session.getAttribute("email").toString() + ".svg?b=white&size=70&r=50";
            
            String action = "", order = "";
            if(request.getParameter("order") != null) order = request.getParameter("order");
            ControlLogManager manager = new ControlLogManager();
            ArrayList<Log> list = new ArrayList();
            
            manager.execute(0);
            list = manager.getList();
            if(request.getParameter("action") != null) action = request.getParameter("action");
            switch(action){
                case "action":  list = manager.getListByOrder("nombre", order);
                              break;
                case "author":  list = manager.getListByOrder("correo", order);
                              break;
                case "date":  list = manager.getListByOrder("rol", order);
                              break;
            }
        %>
        
        <div class="container-fluid">
            <!-- HEADER -->
            <div class="row py-3">
                <div class="py-2 col-12">
                    <img class="float-start" src="images/logo.png" width="200" height="150">
                    <div class="float-end col-2 me-4">
                        <img class="pt-5 mx-auto d-block" src="<%= url%>">
                        <p class="fs-5 py-3 font-monospace text-center"><%= session.getAttribute("name")%></p>
                    </div>
                </div>
                
                <div class="col-12">
                    <p class="fs-1 text-center font-monospace">Historial</p>
                </div>
            </div>
            
                    
            <!-- TABLE LOG -->
            <div class="row col-11 mx-auto">
                <div class="col-12">
                    <table class="table table-striped align-middle">
                        <thead>
                            <tr>
                                <%if(order.equals("ASC")){%>
                                    <th><a href="log.jsp?action=action&order=DESC" name="action" value="action">Acción</a></th>
                                    <th><a href="log.jsp?action=author&order=DESC" name="action" value="author">Usuario</a></th>
                                    <th><a href="log.jsp?action=date&order=DESC" name="action" value="date">Fecha</a></th>
                                <%}else{%>    
                                    <th><a href="log.jsp?action=action&order=ASC" name="action" value="action">Acción</a></th>
                                    <th><a href="log.jsp?action=author&order=ASC" name="action" value="author">Usuario</a></th>
                                    <th><a href="log.jsp?action=date&order=ASC" name="action" value="date">Fecha</a></th>
                                <%}%>   
                            </tr>
                        </thead>
                        <tbody>
                            <%for(int i = 0; i < list.size(); i++){
                                Log log = list.get(i);%>
                                <tr>
                                    <td><%=log.getAction()%></td>
                                    <td><%=log.getAuthor()%></td>
                                    <td><%=log.getDate()%></td>
                                </tr>
                            <%}%>    
                        </tbody>
                    </table>
                </div>
            </div>
                            
            <!-- RETURN BUTTON -->
            <div class="row py-5">
                <form method="POST" action="menu.jsp">
                    <div class="col-2 mx-auto d-grid gap-2">
                        <input type="submit" value="Volver Atrás" class="btn btn-secondary">
                    </div>
                </form>
            </div>
        </div> <!-- END CONTAINER -->
    </body>
</html>
