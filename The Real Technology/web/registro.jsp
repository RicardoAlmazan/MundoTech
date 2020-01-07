<%-- 
    Document   : registro
    Created on : 29/04/2016, 09:53:51 PM
    Author     : The Real Technology
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session = "true" %>
<%
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

    }

    /*
    if(ready==false){
        response.sendRedirect("login.jsp");
    }*/
%>



<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="IMG/logo.png" />
        <meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
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

            <h1 style="font-size: 35px; padding-bottom: 30px;">Registro de Usuarios</h1>

            <form action="validaRegistro.jsp" method="POST" class="form-horizontal" name="formulario1" role="form" onsubmit="alert(niv.value)">
                <div class="form-group nivel">
                    <div class="col-lg-offset-1 col-lg-10">
                        <label for="nivel">Elija su tipo de usuario:</label>
                        <select class="form-control" id="nivel" name="nivel" 
                                data-toggle="tooltip" title="Defina su tipo de usuario." data-placement="right" >

                            <option value="0">Selecciona una opción</option>
                            <option value="3">Profesor</option>
                            <option value="2">Alumno</option>
                        </select>
                    </div>

                </div>
                <div class="form-group" id="nombreDiv">
                    <label for="nombre" class="col-lg-2 control-label">Nombre:</label>
                    <div class="col-lg-10">
                        <input type="text" name="nombre" class="form-control" data-toggle="tooltip" title="Escribe tu nombre real." data-placement="right" 
                               onkeypress="return presionaLetras(event);" id="nombre"
                               placeholder="Introduce tu nombre" maxlength="50" onpaste="return false;">
                        <span id="errorNombre" class=""></span>
                    </div>
                </div>
                <div class="form-group" id="paternoDiv">
                    <label for="paterno" class="col-lg-2 control-label">Apellido Paterno:</label>
                    <div class="col-lg-10 form-control-static">
                        <input type="text" name="paterno" class="form-control" id="paterno" onkeypress="return presionaLetras(event);"
                               data-toggle="tooltip" title="Escribe tu apellido real." data-placement="right" 
                               placeholder="Introduce tu apellido paterno" maxlength="20" onpaste="return false;">
                        <span id="errorPaterno" class=""></span>
                    </div>
                </div>
                <div class="form-group" id="gametagDiv">
                    <label for="gametag" class="col-lg-2 control-label">Nombre de Usuario: </label>
                    <div class="col-lg-10">

                        <input type="text" name="gametag" class="form-control" id="gametag" onkeypress="return sinEspeciales(event);" onchange="html_encode(this.value)"
                               data-toggle="tooltip" title="Es requerido para acceder a las actividades de la página." data-placement="right" 
                               placeholder="Introduce tu gametag" maxlength="30" required>
                        <span id="errorGametag" class=""></span>
                    </div>
                </div>
                <div class="form-group" id="emailDiv">
                    <label for="email" class="col-lg-2 control-label">Email:</label>
                    <div class="col-lg-10">
                        <input type="email" name="email" onchange="validarEmail(this.value)" class="form-control" id="email"
                               data-toggle="tooltip" title="Escribe tu email real." data-placement="right" 
                               placeholder="Introduce tu email" maxlength="100" required>
                        <span id="errorEmail" class=""></span>
                    </div>
                </div>
                <div class="form-group" id="contraDiv">
                    <label for="contra" class="col-lg-2 control-label">Contraseña:</label>
                    <div class="col-lg-10">
                        <input type="password" class="form-control" id="contra" name="contra" onkeypress="return sinEspeciales(event);"
                               data-toggle="tooltip" title="La contraseña debe contener mínimo 6 caracteres." data-placement="right" 
                               placeholder="Contraseña" maxlength="30" required>
                        <span id="errorContra" class=""></span>
                    </div>
                </div>
                <div class="form-group" id="nContraDiv">
                    <label for="contra" class="col-lg-2 control-label">Confirma contraseña:</label>
                    <div class="col-lg-10 form-control-static">
                        <input type="password" class="form-control" id="ncontra" name="ncontra" onkeypress="return sinEspeciales(event);"
                               data-toggle="tooltip" title="Vuelva a escribir su contraseña." data-placement="right" 
                               placeholder="Escribe nuevamente tu contraseña" maxlength="30" required
                               onpaste="return false">
                        <span id="errornContra" class=""></span>
                    </div>
                    <div id="errorContraN" class=""></div>
                </div>
                <div class="form-group" id="radio">
                    <div class="radio">
                        <label for="radio" class="center-block">Selecciona tu sexo</label>
                    </div>
                    <div class="radio">

                        <label><input type="radio" name="radio" value="Femenino"  checked>Femenino</label>
                        <label><input type="radio" name="radio" value="Masculino" >Masculino</label>
                        <input type="hidden" id="sex" name="sex">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-lg-offset-1 col-lg-10">
                        <input type="submit" onclick="validarFormulario();" class="btn btn-primary" value="Registrar">
                    </div>
                </div>


            </form>

            <div class="col-lg-offset-1 col-lg-10">
                <p class="text-muted text-center">¿Ya tienes una cuenta? <br><a href="login.jsp" class="btn btn-link">Inicia Sesión</a></p></div>

                    </div>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> <!-- jQuery Core -->
        <script src="JS/login.js" type="text/javascript"></script>
        <script src="_include/js/fileinput.min.js" type="text/javascript"></script>
        <script src="CSS/tooltip.js" type="text/javascript"></script>
        <script type="text/javascript">
                            $(function () {
                                $('[data-toggle="tooltip"]').tooltip()
                            });
        </script>

    </body>
</html>
