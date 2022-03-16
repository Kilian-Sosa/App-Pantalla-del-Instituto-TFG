<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión Alumnos</title>
        
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
            
            String url = "";
            //url = "https://avatars.dicebear.com/api/initials/" + session.getAttribute("email").toString() + ".svg?size=70&r=50";
            url = "https://avatars.dicebear.com/api/identicon/" + session.getAttribute("email").toString() + ".svg?b=white&size=70&r=50";
        %>
        
        <div class="container">
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
            
            <!-- LOG -->
            <div class="row">
                
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
