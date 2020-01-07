<%-- 
    Document   : login
    Created on : 14/04/2016, 05:44:15 PM
    Author     : The Real Technology
<link rel="icon" type="image/png" href="/images/mifavicon.png" />

--%>

<%@page import="BD.cDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session = "true" %>
<%@page import="java.sql.ResultSet"%>

<%
    if (request.getParameter("cerrar") != null) {
        session.invalidate();
    }
    HttpSession sesion = request.getSession();
    String usuario;
    String nivel;
    String liga = "";

    if (sesion.getAttribute("user") != null && session.getAttribute("nivel") != null) {
        out.print("<script>"
                + "var pagina = 'javascript:history.go(-1)'; "
                + "document.location.href=pagina;"
                + "</script>");
    } else {
        boolean xActNot = false;
        String xAct = request.getParameter("xAct");
        if (xAct != null) {
            if (xAct.equals("listo")) {
                xActNot = true;
            } else {
                xAct = "Nel";
                xActNot = false;
            }

        } else {
            xActNot = false;
            xAct = "Nel";
        }

        String resultado = "";
        cDatos op = new cDatos();
        if (!xActNot) {
            if (request.getParameter("btnIngresar") != null) {
                String nombre = request.getParameter("txtUsuario");
                String contra = request.getParameter("txtContra");
                String password = "";
                String paterno = "";
                String gametag = "";
                String nombreReal = "";
                String email = "";
                String imagen = "";
                String src = "Archivos/";
                ldn.cAlumno alums = new ldn.cAlumno();
                switch (op.loguear(nombre, contra)) {
                    case 1:

                        alums.setGametag(nombre);
                        if (alums.getActivado() != 1) {
                            resultado = "<div class=\"modal fade\" id=\"alerta\" role=\"dialog\">"
                                    + "<div class=\"modal-dialog\">"
                                    + "<div class=\"modal-content\">"
                                    + "<div class=\"modal-header\">"
                                    + "<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>"
                                    + "<div class='form-group has-error'><label class='control-label'><h2 class=\"modal-title\">Usuario aún no activado</h2></label></div>"
                                    + "</div>"
                                    + "<div class=\"modal-body\">"
                                    + "<p>Aún no se ha activado su cuenta. Por favor visite su correo electrónico para activar su cuenta y poder disfrutar de todos los recursos que le ofrece <a class=\"text-muted\">The Real Technology.</a></p>"
                                    + "</div>"
                                    + "<div class=\"modal-footer\">"
                                    + "<button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Cerrar</button>"
                                    + "</div>"
                                    + "</div>"
                                    + "</div>"
                                    + "</div>"
                                    + "</div>"
                                    + "<script>"
                                    + "$(document).ready(function(){"
                                    + "$(\"#alerta\").modal();"
                                    + "});"
                                    + "</script>";
                        } else {
                            sesion.setAttribute("user", nombre);
                            sesion.setAttribute("nivel", "1");
                            response.sendRedirect("indexMain.jsp");
                        }
                        break;

                    case 2:

                        alums.setGametag(nombre);
                        if (alums.getActivado() != 1) {

                            /*resultado = "<div class='form-group has-error'><label class='control-label'>Usuario aún no activado</label></div>";*/
                            resultado = "<div class=\"modal fade\" id=\"alerta\" role=\"dialog\">"
                                    + "<div class=\"modal-dialog\">"
                                    + "<div class=\"modal-content\">"
                                    + "<div class=\"modal-header\">"
                                    + "<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>"
                                    + "<div class='form-group has-error'><label class='control-label'><h2 class=\"modal-title\">Usuario aún no activado</h2></label></div>"
                                    + "</div>"
                                    + "<div class=\"modal-body\">"
                                    + "<p>Aún no se ha activado su cuenta. Por favor visite su correo electrónico para activar su cuenta y poder disfrutar de todos los recursos que le ofrece <a class=\"text-muted\">The Real Technology.</a></p>"
                                    + "</div>"
                                    + "<div class=\"modal-footer\">"
                                    + "<button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Cerrar</button>"
                                    + "</div>"
                                    + "</div>"
                                    + "</div>"
                                    + "</div>"
                                    + "</div>"
                                    + "<script>"
                                    + "$(document).ready(function(){"
                                    + "$(\"#alerta\").modal();"
                                    + "});"
                                    + "</script>";
                        } else {
                            nombreReal = alums.getNombre();
                            paterno = alums.getPaterno();

                            email = alums.getEmail();
                            imagen = alums.getImagen();
                            sesion.setAttribute("user", nombre);
                            sesion.setAttribute("nivel", "2");
                            sesion.setAttribute("nombre", nombreReal);
                            sesion.setAttribute("imagen", src + imagen);
                            sesion.setAttribute("paterno", paterno);
                            sesion.setAttribute("contraseña", password);
                            sesion.setAttribute("email", email);
                            response.sendRedirect("mapa_1.jsp");
                        }
                        break;
                    case 3:
                        alums.setGametag(nombre);
                        if (alums.getActivado() != 1) {
                            resultado = "<div class=\"modal fade\" id=\"alerta\" role=\"dialog\">"
                                    + "<div class=\"modal-dialog\">"
                                    + "<div class=\"modal-content\">"
                                    + "<div class=\"modal-header\">"
                                    + "<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>"
                                    + "<div class='form-group has-error'><label class='control-label'><h2 class=\"modal-title\">Usuario aún no activado</h2></label></div>"
                                    + "</div>"
                                    + "<div class=\"modal-body\">"
                                    + "<p>Aún no se ha activado su cuenta. Por favor visite su correo electrónico para activar su cuenta y poder disfrutar de todos los recursos que le ofrece <a class=\"text-muted\">The Real Technology.</a></p>"
                                    + "</div>"
                                    + "<div class=\"modal-footer\">"
                                    + "<button type=\"button\" class=\"btn btn-danger\" data-dismiss=\"modal\">Cerrar</button>"
                                    + "</div>"
                                    + "</div>"
                                    + "</div>"
                                    + "</div>"
                                    + "</div>"
                                    + "<script>"
                                    + "$(document).ready(function(){"
                                    + "$(\"#alerta\").modal();"
                                    + "});"
                                    + "</script>";
                        } else {
                            sesion.setAttribute("user", nombre);
                            sesion.setAttribute("nivel", "3");
                            response.sendRedirect("indexProfe.jsp");
                        }
                        break;
                    default:
                        resultado = "<div class='form-group has-error'><label class='control-label'>Usuario o contraseña incorrectos</label></div>";
                        break;
                }
            }
        } else {
            resultado = "<div class=\"modal fade\" id=\"alerta\" role=\"dialog\">"
                    + "<div class=\"modal-dialog\">"
                    + "<div class=\"modal-content\">"
                    + "<div class=\"modal-header\">"
                    + "<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>"
                    + "<div class='form-group has-success'><label class='control-label'><h2 class=\"modal-title\">Usuario activado</h2></label></div>"
                    + "</div>"
                    + "<div class=\"modal-body\">"
                    + "<p>¡Gracias por activar su cuenta! Ahora puedes disfrutar todos los recurso que te ofrece <a class=\"text-muted\">The Real Technology.</a></p>"
                    + "<p>Por favor inicia sesión.</p>"
                    + "</div>"
                    + "<div class=\"modal-footer\">"
                    + "<button type=\"button\" class=\"btn btn-success\" data-dismiss=\"modal\" >Cerrar</button>"
                    + "</div>"
                    + "</div>"
                    + "</div>"
                    + "</div>"
                    + "</div>"
                    + "<script>"
                    + "$(document).ready(function(){"
                    + "$(\"#alerta\").modal();"
                    + "});"
                    + "</script>";
            xAct = "nel";
        }

%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="IMG/logo.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width; initial-scale=1.0"> 
        <title>Ingresar</title>
        <link href="CSS/estilos-login.css" rel="stylesheet" type="text/css"/>
        <!-- Estilos CSS vinculados -->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="jumbotron boxlogin">
            <form name="flogin" id="flogin" action="login.jsp" method="POST" onsubmit="valida();">
                <h1 style="font-size: 35px;">Iniciar Sesión</h1>
                <label>Nombre de usuario:</label>
                <input type="text" name="txtUsuario" id="username" class="form-control"/>
                <label>Contraseña:</label>
                <input type="password" name="txtContra" id="password" class="form-control"/>
                <input type="hidden" id="xAct" name="xAct" value="<%=xAct%>" /> 
                <center>
                    <input type="submit"  name="btnIngresar" id="ingresar"  value="Ingresar" class="btn btn-primary"/><br><br>
                    <p class="text-muted text-center">¿No tienes una cuenta? <br><a href="registro.jsp" class="btn btn-link">Regístrate</a></p>
                        <%= resultado%>
                </center>
            </form>
            <%}%>
        </div>
        <script src="JS/login_Valida.js" type="text/javascript"></script>
    </body>
</html>
