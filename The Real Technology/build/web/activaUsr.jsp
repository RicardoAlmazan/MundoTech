<%-- 
    Document   : activaUsr
    Created on : 10/05/2016, 09:52:16 PM
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String usr = request.getParameter("usr");
    String contra = request.getParameter("contra");
    String acc = "";
    String Acc = "";
    boolean prende = false;
    if (request.getParameter("xAcc") != null) {
        acc = request.getParameter("xAcc");
        if (acc.equals("1")) {
            prende = true;
            ldn.cAlumno alum = new ldn.cAlumno();
            String active = alum.activaUsr(usr, contra);
            if (active.equalsIgnoreCase("Usuario activado")) {
                response.sendRedirect("login.jsp?xAct=listo");
            } else {
                out.print("<script>"
                        + "var pagina = 'login.jsp'; "
                        + "document.location.href=pagina;"
                        + "alert('" + active + "');</script>");
            }
        } else if (acc.equals("2")) {
            prende = false;
            out.print("<script>"
                        + "var pagina = 'login.jsp'; "
                        + "document.location.href=pagina;"
                        + "</script>");
        }
    } else {
        Acc = "2";
        out.print("<script>"
                        + "var pagina = 'login.jsp'; "
                        + "document.location.href=pagina;"
                        + "</script>");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="activaUsr.jsp">
            <input type="hidden" id="xAcc" name="xAcc" value="<%=Acc%>" />
            <%if (!prende) {%>
            <input type="text" value="<%=usr%>" name="usr" id="usr">
            <input type="text" value="<%=contra%>" name="contra" id="contra">
            <%} else {%>
            <p>Listo, papu</p>

            <%}
            %>
        </form>
    </body>
</html>
