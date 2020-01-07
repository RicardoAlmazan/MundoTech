<%-- 
    Document   : validaRegistro
    Created on : 2/05/2016, 09:46:13 PM
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.util.*"
        import="org.apache.commons.fileupload.*"
        import="org.apache.commons.fileupload.servlet.*"
        import="org.apache.commons.fileupload.disk.*"
        import="java.io.*"%>
<%@page import="proceso.cMail"%>
<%@page session = "true" %>
<%
    HttpSession sesion = request.getSession();
    String user;
    String level;
    String liga = "";

    if (sesion.getAttribute("user") != null && session.getAttribute("nivel") != null) {
        out.print("<script>"
                + "var pagina = 'javascript:history.go(-1)'; "
                + "document.location.href=pagina;"
                + "alert('Acceso denegado');</script>");
    } else {

    }

%>


<%    ldn.cAlumno alum = new ldn.cAlumno();
    String nombre = request.getParameter("nombre");
    String paterno = request.getParameter("paterno");
    String acc = "";
    String gametag = request.getParameter("gametag");
    String email = request.getParameter("email");
    String contra = request.getParameter("contra");
    String ncontra = request.getParameter("ncontra");
    String sexo = request.getParameter("sex").toString();

    if (request.getParameter("xAcc") != null) {
        acc = request.getParameter("xAcc");
        if (acc.equals("1")) {
        }
    } else {

        String mensaje = "<h1>¡Gracias por registrarte, " + nombre + " " + paterno + "!</h1><br>";
        mensaje += "<p style='color: blue;'>Los datos proporcionados por ti son:</p> <p style='color: red;' >Nombre de usuario: " + gametag + "</p>"+"<p style='color: red;' >Contraseña: " + contra + "</p>"
                + "<a href=\"http://localhost:8080/The_Real/activaUsr.jsp?xAcc=1&usr=" + gametag + "&contra=" + contra + "\">Activar</a>";

        String asunto = "Registro completado.";
        cMail mail = new cMail();

        String nivel = request.getParameter("nivel");
        int niv = 0;
        if (Integer.parseInt(nivel) == 3) {
            niv = 3;
        } else if (Integer.parseInt(nivel) == 2) {
            niv = 2;
        }

        if (niv != 0) {
            String alerta = alum.ActualizaAlumno("0", nombre, paterno, gametag, contra, email, ncontra, niv);
            if (alerta.equalsIgnoreCase("Usuario registrado con éxito.")) {
                boolean resultado = mail.enviarCorreo(email, mensaje, asunto);
                if (resultado) {

                    response.sendRedirect("login.jsp");

                } else {
                    out.print("CORREO ELECTRONICO NO ENVIADO....." + "\n\n" + "<a href='registro.jsp'>VOLVER AL INDEX</a>");
                }

            } else {
                //out.print("<script>alert('Usuario no registrado, intenta otra vez.');"
                  //      + "document.location.href='registro.jsp';</script>");
                out.print("<script>"+
                "var pagina = 'javascript:history.go(-1)'; document.location.href=pagina;alert('" + alerta + "');</script>");
            }
        } else {
            out.print("<script>"+
                "var pagina = 'javascript:history.go(-1)'; document.location.href=pagina;</script>");
        }


%>
<%--
    
    ldn.cAlumno alum = new ldn.cAlumno();

    String acc = "";
    nombre = request.getParameter("nombre");
    paterno = request.getParameter("paterno");
    usuario = request.getParameter("usuario");
    gametag = request.getParameter("gametag");
    email = request.getParameter("email");
    contra = request.getParameter("contra");
    ncontra = request.getParameter("ncontra");
    //Ruta donde se guardara el fichero C:\\Subidos\\
    File destino = new File("E:\\The Real Technology-DefinitivoAHORASI - copia (2)\\The Real Technology\\web\\Archivos\\");
    ServletRequestContext src = new ServletRequestContext(request);

    if (ServletFileUpload.isMultipartContent(src)) {
        DiskFileItemFactory factory = new DiskFileItemFactory((1024 * 1024), destino);
        ServletFileUpload upload = new ServletFileUpload(factory);

        java.util.List lista = upload.parseRequest(src);
        File file = null;
        java.util.Iterator it = lista.iterator();

        while (it.hasNext()) {
            FileItem item = (FileItem) it.next();
            if (item.isFormField()) {
            } else {
                file = new File(item.getName());
                String img = destino + file.getName();
                item.write(new File(destino, file.getName()));
                alum.registraAlumno(nombre, paterno, gametag, usuario, contra, email, ncontra, img, 2);
                /*alum.registraAlumno("Ricardo", "Alejandro", "Ricardo", "Ricardo", "Ricardo", "algo@algo.com", "Ricardo" , img, 2);*/
                out.println("<script>alert('Registro realizado con exito');document.location.href = 'registro.jsp';</script>");
                
            } // end if
        } // end while
    } // end if

--%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <input type="hidden" value="<%=acc%>">
        <%--<h1><%=nombre%></h1>
        <h1><%=paterno%></h1>

        <h1><%=gametag%></h1>
        <h1><%=email%></h1>
        <h1><%=niv%></h1>--%>
        <%}%>
    </body>
</html>
