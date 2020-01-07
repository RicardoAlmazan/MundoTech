package proceso;

import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.TimeZone;

public class cPais {

    private int _id_pais;
    private String _Nombre;
    private String _Nombre_com;
    private String _Bandera;
    private String _Escudo;
    private String _Capital;
    private String _Gentilicio;
    private int _Superficie;
    private float _Agua;
    private String _Punto_Alto;
    private int _Habitantes;
    private String _Moneda;
    private Date _Fecha;
    private String _Tipo;
    private String _Lema;
    private float _Lati;
    private float _Longi;
    private String _Himno;
    private String[] _Idioma;
    String _error;

    public cPais() {
    }

    public cPais(int id) {
        BD.cDatos sql = new BD.cDatos();
        ResultSet rsPais = null;
        try {
            //conecta a la base de datos
            sql.conectar();
            //realiza consultas
            rsPais = sql.consulta("select * from pais where id_pais = " + id);
            while (rsPais.next()) {
                this._id_pais = rsPais.getInt("id_pais");
                this._Nombre = rsPais.getString("Nombre");
                this._Nombre_com = rsPais.getString("Nombre_com");
                this._Lati = rsPais.getFloat("lat");
                this._Longi = rsPais.getFloat("lon");
                this._Bandera = rsPais.getString("Bandera");
                this._Escudo = rsPais.getString("Escudo");
                this._Capital = rsPais.getString("Capital");
                this._Gentilicio = rsPais.getString("Gentilicio");
                this._Superficie = rsPais.getInt("Superficie");
                this._Agua = rsPais.getFloat("Agua");
                this._Punto_Alto = rsPais.getString("Punto_Alto");
                this._Habitantes = rsPais.getInt("Habitantes");
                this._Moneda = rsPais.getString("Moneda");
                this._Himno = rsPais.getString("himno");
            }
            rsPais = sql.consulta("select fecha.fecha, tipo.tipo from fecha inner join pais on pais.id_pais = fecha.id_pais inner join tipo on fecha.id_tipo = tipo.id_tipo where fecha.id_pais = " + id);
            while (rsPais.next()) {
                this._Fecha = rsPais.getDate("Fecha");
                this._Tipo = rsPais.getString("Tipo");
            }
            rsPais = sql.consulta("select lema from lema where id_pais = " + id);
            while (rsPais.next()) {
                this._Lema = rsPais.getString("Lema");
            }
            rsPais = sql.consulta("select count(idioma) as cuantos from idioma where id_pais = " + id);
            while (rsPais.next()) {
                this._Idioma = new String[rsPais.getInt("cuantos")];
            }
            int x = 0;
            rsPais = sql.consulta("select idioma from idioma where id_pais = " + id);
            while (rsPais.next()) {
                this._Idioma[x] = rsPais.getString("idioma");
                x++;
            }
            sql.cierraConexion();
        } catch (Exception e) {
            this._error = e.getMessage();
        }
    }

    /*
    public ArrayList<String> setTodo() {
        ArrayList<String> paises = new ArrayList<String>();
        BD.cDatos sql = new BD.cDatos();
        int paisito;
        ResultSet rsPais = null;
        try {
            //conecta a la base de datos
            sql.conectar();
            //realiza consultas
            rsPais = sql.consulta("select * from pais");
            while (rsPais.next()) {
                paisito = rsPais.getInt("id_pais");
                cPais pa = new cPais(paisito);
                paises.add("['"+pa.getNombre()+"',"
                        + " '"+pa.getTodo(pa)+"', "
                        + "'', "
                        + "'', "
                        + "'',"
                        + ""+pa.getLati()+", "
                        + ""+pa.getLongi()+", "
                        + "'https://mapbuildr.com/assets/img/markers/default.png'],");
            }

            sql.cierraConexion();
        } catch (Exception e) {
            this._error = e.getMessage();
        }
        return (paises);
    }
    
    
    
     */
    public String paisAleatorio() {
        BD.cDatos sql = new BD.cDatos();
        String html = "";
        ResultSet rsPais = null;
        try {
            sql.conectar();

            rsPais = sql.consulta("select Nombre from pais");
            while (rsPais.next()) {
                html += "'"+rsPais.getString("Nombre")+"',";
            }

        } catch (Exception e) {
            html = "<script>alert('" + e.getMessage().replace("'", "") + "');</script>";
        }
        return html;
    }

    public String todo() {
        BD.cDatos sql = new BD.cDatos();
        String nomCom = "País: ";
        String cap = "Capital: ";
        String idi = "Idioma: ";
        String superf = "Superficie: ";
        String genti = "Gentilicio: ";
        String habit = "No. de Habitantes: ";
        String puntAlt = "Punto más alto: ";
        String moneda = "Moneda: ";
        ResultSet rsPais = null;
        ResultSet rsIdioma = null;
        String html = "";

        try {

            sql.conectar();

            rsPais = sql.consulta("select * from pais");

            while (rsPais.next()) {
                this._id_pais = rsPais.getInt("id_pais");
                this._Nombre = rsPais.getString("Nombre");
                this._Nombre_com = rsPais.getString("Nombre_com");
                this._Lati = rsPais.getFloat("lat");
                this._Longi = rsPais.getFloat("lon");
                this._Bandera = rsPais.getString("Bandera");
                this._Escudo = rsPais.getString("Escudo");
                this._Capital = rsPais.getString("Capital");
                this._Gentilicio = rsPais.getString("Gentilicio");
                this._Superficie = rsPais.getInt("Superficie");
                this._Agua = rsPais.getFloat("Agua");
                this._Punto_Alto = rsPais.getString("Punto_Alto");
                this._Habitantes = rsPais.getInt("Habitantes");
                this._Moneda = rsPais.getString("Moneda");
                this._Himno = rsPais.getString("himno");

                html += "['";
                html += _Nombre;
                html += "', '";
                html += "<p><font size = 10px>";
                html += _Nombre;
                html += "</font></p><div class=pais><img width = 100px style=\"margin: auto;\" src=";
                html += _Bandera;
                html += "></img><img width = 100px style=\"margin: auto; float:bottom\" src=";
                html += _Escudo;
                html += "></img><br/></div<div class=mascara>";
                html += nomCom + _Nombre_com;
                html += "<br/><br/>" + cap + _Capital + "<br/><br/>" + idi;

                rsIdioma = sql.consulta("select idioma from idioma where id_pais = " + _id_pais);
                while (rsIdioma.next()) {

                    html += rsIdioma.getString("idioma");

                }

                html += "<br/><br/>" + superf;
                html += _Superficie + "<br/><br/>" + genti;
                html += _Gentilicio + "<br/><br/>" + habit + _Habitantes
                        + "<br/><br/>" + puntAlt + _Punto_Alto + "<br/><br/>"
                        + moneda + _Moneda + "<br/><br/>"
                        + "<audio controls>"
                        + "	<source src=" + _Himno + " type=audio/mpeg/>"
                        + "</audio>"
                        + "</div>',";
                html += "'', '', '', " + _Lati + ","
                        + " " + _Longi + ", 'https://mapbuildr.com/assets/img/markers/solid-pin-red.png'],";

            }

            sql.cierraConexion();
        } catch (Exception xxxxD) {
            //this._error = "<script>alert('"+xxxxD.getMessage()+"');</script>";
            html = "<script>alert('" + xxxxD.getMessage().replace("'", "") + "');</script>";
        }
        return html;

    }

    public int getId_pais() {
        return _id_pais;
    }

    public String getNombre() {
        return _Nombre;
    }

    public String getNombre_com() {
        return _Nombre_com;
    }

    public String getBandera() {
        return _Bandera;
    }

    public String getEscudo() {
        return _Escudo;
    }

    public String getCapital() {
        return _Capital;
    }

    public String getGentilicio() {
        return _Gentilicio;
    }

    public int getSuperficie() {
        return _Superficie;
    }

    public float getAgua() {
        return _Agua;
    }

    public String getPunto_Alto() {
        return _Punto_Alto;
    }

    public int getHabitantes() {
        return _Habitantes;
    }

    public String getMoneda() {
        return _Moneda;
    }

    public Date getFecha() {
        return _Fecha;
    }

    public String getTipo() {
        return _Tipo;
    }

    public String getLema() {
        return _Lema;
    }

    public String[] getIdioma() {
        return _Idioma;
    }

    public String getTodo(cPais pais) {

        String nomCom = "País: ";
        String cap = "Capital: ";
        String idi = "Idioma: ";
        String superf = "Superficie: ";
        String genti = "Gentilicio: ";
        String habit = "No. de Habitantes: ";
        String puntAlt = "Punto más alto: ";
        String moneda = "Moneda: ";
        /*
    Calendar calendario = new GregorianCalendar();

    int hora, minutos, segundos;
    minutos = calendario.get(Calendar.MINUTE);
    segundos = calendario.get(Calendar.SECOND);
    
    switch(pais.getId_pais()){
        case 1:
            hora =calendario.get(Calendar.HOUR_OF_DAY);
            break;
        case 2:
            hora =calendario.get(Calendar.HOUR_OF_DAY)+8;
            break;
        case 3:
            hora =calendario.get(Calendar.HOUR_OF_DAY) + 1;
            break;
        case 4:
            hora =calendario.get(Calendar.HOUR_OF_DAY)+7;
            break;
        case 5:
            hora =calendario.get(Calendar.HOUR_OF_DAY)+13;
            break;
        case 6:
            hora =calendario.get(Calendar.HOUR_OF_DAY)+8;
            break;
        case 7:
            hora =calendario.get(Calendar.HOUR_OF_DAY);
            break;
        case 8:
            hora =calendario.get(Calendar.HOUR_OF_DAY)+12;
            break;
    }
       Hora actual: " + "new java.text.SimpleDateFormat("HH:mm:ss").format( new java.util.Date())"*/

        return "<p><font size = 10px>" + pais.getNombre() + "</font></p><div class=pais><img width = 100px style=\"margin: auto;\" src=" + pais.getBandera() + "></img>"
                + "<img width = 100px style=\"margin: auto; float:bottom\" src=" + pais.getEscudo()
                + "></img><br/></div<div class=mascara>" + nomCom + pais.getNombre_com()
                + "<br/><br/>" + cap + pais.getCapital() + "<br/><br/>" + idi + idiomaF(pais)
                + "<br/><br/>" + superf + pais.getSuperficie() + "<br/><br/>" + genti
                + pais.getGentilicio() + "<br/><br/>" + habit + pais.getHabitantes()
                + "<br/><br/>" + puntAlt + pais.getPunto_Alto() + "<br/><br/>"
                + moneda + pais.getMoneda() + "<br/><br/>"
                + "<audio controls>"
                + "	<source src=" + pais.getHimno() + " type=audio/mpeg/>"
                + "</audio>"
                + "</div>";

    }

    public String getHimno() {
        return _Himno;
    }

    public String idiomaF(proceso.cPais pais) {
        String[] idioma;
        idioma = pais.getIdioma();
        for (int i = 0; i < idioma.length; i++) {

            return idioma[i];
        }
        return "";
    }

    public float getLati() {
        return _Lati;
    }

    public float getLongi() {
        return _Longi;
    }
}
