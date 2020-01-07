

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.util.*"
        import="org.apache.commons.fileupload.*"
        import="org.apache.commons.fileupload.servlet.*"
        import="org.apache.commons.fileupload.disk.*"
        import="java.io.*"%>
<%@page session = "true" %>
<%

    HttpSession sesion = request.getSession();
    String usuario = "";
    String nivel;
    String liga = "";
    String nombre = "";
    String imagen = "";

    String ruta = "Archivos/";

    if (sesion.getAttribute("user") != null && session.getAttribute("nivel") != null) {
        usuario = session.getAttribute("user").toString();
        nivel = session.getAttribute("nivel").toString();
        nombre = session.getAttribute("nombre").toString();
        imagen = session.getAttribute("imagen").toString();

    } else {
        out.print("<script>location.replace('login.jsp');</script>");

    }

//Ruta donde se guardara el fichero C:\\Subidos\\
    ldn.cAlumno sql = new ldn.cAlumno();

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
                String name = file.getName();
                item.write(new File(destino, file.getName()));
                sql.setGametag(usuario);
                String actual = sql.actualizaImg(name, usuario);
                if (actual.equalsIgnoreCase("Imagen actualizada")) {

                    /*
                 alum.registraAlumno("Ricardo", "Alejandro", "Ricardo", "Ricardo", "Ricardo", "algo@algo.com", "Ricardo" , img, 2);*/
                    out.println("<script>"
                            + "location.replace('perfil.jsp');</script>");
                    sesion.removeAttribute("imagen");
                    sesion.setAttribute("imagen", ruta + name);
                }  else {
                    out.print("<script>"
                        + "var pagina = 'perfil.jsp'; "
                        + "document.location.href=pagina;"
                        + "alert('" + actual + "');</script>");
                }
            } // end if
        } // end while
    } // end if
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="IMG/logo.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width; initial-scale=1.0"> 
        <link href="_include/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="CSS/estilos-registro.css" rel="stylesheet" type="text/css"/>
        <link href="_include/css/fileinput.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <title>Registrar</title>
    </head>
    <body>
        <div class="container boxlogin text-center jumbotron">
            <h1 style="font-size: 35px; padding-bottom: 30px;">Actualiza tu imagen de perfil.</h1>
            <form action="registroImagen.jsp" method="POST" enctype="multipart/form-data" class="form-horizontal" role="form">
                <div class="form-group">

                    <label for="imagen" class="col-lg-2 control-label">Selecciona una imagen</label>
                    <div class=form-control-static">
                        <input type="file" id="imagen" class="form-control file-caption  kv-fileinput-caption"  name="imagen"  onchange="validaImagen(this, 1);"
                               accept="image/*" required>
                        <p class="help-block col-lg-offset--1 col-lg-10 ">Selecciona solo archivos .gif, .jpg o .png</p>
                        <div class="form-group">
                            <div class="col-lg-offset-1 col-lg-10">
                                <input type="submit"  class="btn btn-primary" value="Continuar">
                            </div>
                        </div>
                    </div>
                </div>

            </form>

        </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> <!-- jQuery Core -->
        <script src="JS/login.js" type="text/javascript"></script>
        <script src="_include/js/fileinput.min.js" type="text/javascript"></script>

        <script>
                            $(document).on('ready', function () {

                                $("#imagen").fileinput({
                                    overwriteInitial: true,
                                    maxFileSize: 1500,
                                    previewFileType: "image",
                                    showCaption: false,
                                    allowedFileExtensions: ["jpg", "png"],
                                    browseClass: "btn btn-default",
                                    browseLabel: "Imagen de perfil",
                                    browseIcon: "<i class=\"glyphicon glyphicon-picture\"></i> ",
                                    removeClass: "btn btn-danger",
                                    removeLabel: "Borrar",
                                    removeIcon: "<i class=\"glyphicon glyphicon-trash\"></i> ",
                                    showUpload: false
                                });

                            });
        </script>
    </body>
</html>
