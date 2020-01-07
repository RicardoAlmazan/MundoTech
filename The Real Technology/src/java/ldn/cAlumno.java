
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ldn;

import java.sql.ResultSet;

public class cAlumno {

    private String _nombre = "";
    String _paterno = "";
    String _gametag = "";
    String _usuario = "";
    String _contra = "";
    String _email = "";
    String _imagen = "";
    int _activado = 0;
    String _error = "";

    public cAlumno() {

    }

    public String ActualizaAlumno(String tipo, String Nombre, String Paterno, String gametag, String contra, String email, String ncontra, int nivel) {
        String regreso = "";
        BD.cDatos sql = new BD.cDatos();
        try {
            sql.conectar();
            ResultSet rs = null;
            if (tipo.equals("1")) {
                rs = sql.consulta("call modiusr('" + Nombre + "','" + Paterno + "', '" + gametag + "','" + email + "', '" + contra + "', '" + ncontra + "');");
                if (rs.next()) {
                    regreso = rs.getString("msj");
                }
            } /*call modiusr('Ricardo','Trejo', 'Ricardo24','almazan625@gmail.com', '240599', '240599');*/ else {
                rs = sql.consulta("call addusr('" + Nombre + "','" + Paterno + "', '" + gametag + "','" + email + "', '" + contra + "'," + nivel + ");");
                if (rs.next()) {
                    regreso = rs.getString("msj");
                }

            }
            /*call addusr('Ricardo','Almazán', 'Ric','Ricardo2','almazan624@gmail.com', '240599',2);*/
            sql.cierraConexion();
        } catch (Exception xxxxxxxxxxxxD) {
            this._error = xxxxxxxxxxxxD.getMessage();
        }
        return regreso;
    }

    public String activaUsr(String usr, String pass) {
        String regreso = "";
        BD.cDatos sql = new BD.cDatos();
        try {
            sql.conectar();
            ResultSet rs = null;
            rs = sql.consulta("call sp_activaUsr('" + usr + "', '" + pass + "');");
            if (rs.next()) {
                regreso = rs.getString("msj");
            }

            sql.cierraConexion();
        } catch (Exception xxxxxxxxxxxxD) {
            this._error = xxxxxxxxxxxxD.getMessage();
        }
        return regreso;

    }

    public String actualizaImg(String img, String usr) {
        String regreso = "";
        BD.cDatos sql = new BD.cDatos();
        try {
            sql.conectar();
            ResultSet rs = null;
            rs = sql.consulta("call sp_ActualizaImgUsr('" + usr + "','" + img + "');");
            if (rs.next()) {
                regreso = rs.getString("msj");
            }

            sql.cierraConexion();
        } catch (Exception xxxxxxxxxxxxD) {
            this._error = xxxxxxxxxxxxD.getMessage();
        }
        return regreso;
    }

    /////getters & setters   
    public void setGametag(String idAlum) {
        this._gametag = idAlum;
        BD.cDatos sql = new BD.cDatos();
        try {
            sql.conectar();
            ResultSet rs = sql.consulta("select * from usuarios where gametag = '" + this._gametag + "'");

            if (rs.next()) {

                this._nombre = rs.getString("nombre");
                this._paterno = rs.getString("paterno");
                this._activado = rs.getInt("activado");
                this._email = rs.getString("email");
                this._imagen = rs.getString("imagen");
            }
            sql.cierraConexion();
        } catch (Exception xxxxD) {

        }
    }

    /*
     public void setUs(String idAlum) {
     this._usuario = idAlum;
     BD.cDatos sql = new BD.cDatos();
     try {
     sql.conectar();
     ResultSet rs = sql.consulta("select * from usuarios where Usuario = '" + this._usuario + "'");

     if (rs.next()) {
     this._gametag = rs.getString("gametag");
     this._nombre = rs.getString("nombre");
     this._paterno = rs.getString("paterno");
     this._usuario = rs.getString("usuario");
     this._email = rs.getString("email");
     this._contra = rs.getString("contra");
     this._imagen = rs.getString("imagen");
     }
     sql.cierraConexion();
     } catch (Exception xxxxD) {

     }
     }*/
    public ResultSet todos() {
        BD.cDatos sql = new BD.cDatos();
        ResultSet rsAlumnos = null;
        try {
            //conectamos a la base de datos mediante la clase CDATOS
            sql.conectar();
            //ejecutamos el metodo de CDATOS que realiza consultas en la BD previamente
            //establecida en la clase CDATOS y regresa RS
            rsAlumnos = sql.consulta("select * from usuarios");
            //sql.cierraConexion();
        } catch (Exception xxxxD) {
            this._error = xxxxD.getMessage();
        }
        return rsAlumnos;

    }

    public String todosHtml() {
        BD.cDatos sql = new BD.cDatos();
        ResultSet rsAlumnos = null;
        String html = "<div class= table-responsive><table class=\"table table-hover table-bordered\">"
                + "<thead>\n"
                + "        <tr style='background-color: rgba(66, 113, 139, 0.6); color: white;'>\n"
                + "            <th>Modificar</th>\n"
                + "            <th>Nombre</th>\n"
                + "            <th>A.Paterno</th>\n"
                + "            <th>Usuario</th>\n"
                + "            <th>Email</th>\n"
                + "            <th>Nivel</th>\n"
                + "        </tr>\n"
                + "    </thead>";
        try {
            //conectamos a la base de datos mediante la clase CDATOS
            sql.conectar();
            //ejecutamos el metodo de CDATOS que realiza consultas en la BD previamente
            //establecida en la clase CDATOS y regresa RS
            rsAlumnos = sql.consulta("select * from usuarios order by nivel, id");

            while (rsAlumnos.next()) {
                html += "<tr>";
                html += "<td>";
                html += "<a  class=\"btn btn-default\" onclick=\"return confirm('¿Estás seguro?');\" href=\"?xAcc=2&iPx=" + rsAlumnos.getString("gametag") + "\">Modificar</a>";
                html += "</td>";
                html += "<td>";
                html += rsAlumnos.getString("nombre");
                html += "</td>";
                html += "<td>";
                html += rsAlumnos.getString("paterno");
                html += "</td>";
                html += "<td>";
                html += rsAlumnos.getString("gametag");
                html += "</td>";
                html += "<td>";
                html += rsAlumnos.getString("email");
                html += "</td>";
                html += "<td>";
                html += rsAlumnos.getString("nivel");
                html += "</td>";
                html += "</tr>";
            }
            html += "</table></div>";
            sql.cierraConexion();
        } catch (Exception xxxxD) {
            //this._error = "<script>alert('"+xxxxD.getMessage()+"');</script>";
            html = "<script>alert('" + xxxxD.getMessage().replace("'", "") + "');</script>";
        }
        return html;

    }

    public String todosHtmlProfe() {
        BD.cDatos sql = new BD.cDatos();
        ResultSet rsAlumnos = null;
        String html = "<div class= table-responsive><table class=\"table table-hover table-bordered\">"
                + "<thead>\n"
                + "        <tr style='background-color: rgba(66, 113, 139, 0.6); color: white;'>\n"
                + "            <th>Seleccionar</th>\n"
                + "            <th>Nombre</th>\n"
                + "            <th>A.Paterno</th>\n"
                + "            <th>Usuario</th>\n"
                + "            <th>Email</th>\n"
                + "        </tr>\n"
                + "    </thead>";
        try {
            //conectamos a la base de datos mediante la clase CDATOS
            sql.conectar();
            //ejecutamos el metodo de CDATOS que realiza consultas en la BD previamente
            //establecida en la clase CDATOS y regresa RS
            rsAlumnos = sql.consulta("select * from usuarios where nivel=2 order by gametag");

            while (rsAlumnos.next()) {
                html += "<tr>";
                html += "<td>";
                html += "    <label class=\"checkbox-inline\">\n"
                        + "      <input type=\"checkbox\" value=\"\">Seleccionar\n"
                        + "    </label>";
                html += "</td>";
                html += "<td>";
                html += rsAlumnos.getString("nombre");
                html += "</td>";
                html += "<td>";
                html += rsAlumnos.getString("paterno");
                html += "</td>";
                html += "<td>";
                html += rsAlumnos.getString("gametag");
                html += "</td>";
                html += "<td>";
                html += rsAlumnos.getString("email");
                html += "</td>";
                html += "<td>";
                html += rsAlumnos.getString("nivel");
                html += "</td>";
                html += "</tr>";
            }
            html += "</table></div>";
            sql.cierraConexion();
        } catch (Exception xxxxD) {
            //this._error = "<script>alert('"+xxxxD.getMessage()+"');</script>";
            html = "<script>alert('" + xxxxD.getMessage().replace("'", "") + "');</script>";
        }
        return html;

    }

    public void setActivado(int _activado) {
        this._activado = _activado;
    }

    public int getActivado() {
        return _activado;
    }

    public String getNombre() {
        return _nombre;
    }

    public String getPaterno() {
        return _paterno;
    }

    public String getGametag() {
        return _gametag;
    }

    public String getUsuario() {
        return _usuario;
    }

    public String getContra() {
        return _contra;
    }

    public String getEmail() {
        return _email;
    }

    public void setNombre(String _nombre) {
        this._nombre = _nombre;
    }

    public void setPaterno(String _paterno) {
        this._paterno = _paterno;
    }

    public void setUsuario(String _usuario) {
        this._usuario = _usuario;
    }

    public void setContra(String _contra) {
        this._contra = _contra;
    }

    public void setEmail(String _email) {
        this._email = _email;
    }

    public String getImagen() {
        return _imagen;
    }

    public void setImagen(String _imagen) {
        this._imagen = _imagen;
    }

}
