<%-- 
    Document   : index
    Created on : Jan 17, 2022, 8:21:18 AM
    Author     : Hector
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- CODIGO JAVA -->
        <%
        
        %>
        
        <div class="container">
            
            <!-- ENCABEZADO -->
            <div class="row">
                <div class="py-3 col-12">
                    <img class="float-start" src="https://cdn.discordapp.com/attachments/944571344786432021/945247676029616178/logo.png" width="150" height="150">
                </div>
                
                <div class="col-12">
                    <p class="fs-1 text-center font-monospace">LOG</p>
                </div>
            </div>
            
            <!-- LOG -->
            <div class="row">
                
            </div>
            
            <!-- BOTÓN VOLVER -->
            <div class="row py-5">
                <form method="GET" action="menu.jsp">
                    <div class="col-2 mx-auto d-grid gap-2">
                        <input type="submit" value="Volver Atrás" class="btn btn-secondary">
                    </div>
                </form>
            </div>
                        
        </div> <!-- CIERRE CONTAINER -->
        
    </body>
</html>
