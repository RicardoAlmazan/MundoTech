package BD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class cDatos {

    private String usrBD;
    private String passBD;
    private String urlBD;
    private String driverClassName;
    private Connection conn = null;
    private Statement estancia;

    public cDatos(String usuarioBD, String passwordBD, String url, String driverClassName) {
        this.usrBD = usuarioBD;
        this.passBD = passwordBD;
        this.urlBD = url;
        this.driverClassName = driverClassName;
    }

    public cDatos() {
        //poner los datos apropiados
        /*this.usrBD = "root";
        this.passBD = "n0m3l0s3";
        this.urlBD = "jdbc:mysql://127.0.0.1:3306/MundoTech?useSSL=false";*/
        this.usrBD = "traafsi1_richie";
        this.passBD = "24059910";
        this.urlBD = "jdbc:mysql://traaf.site:3306/traafsi1_mundotech?useSSL=false";
        this.driverClassName = "com.mysql.jdbc.Driver";
    }

    public int loguear(String us, String pass) {
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        int cont = 0;
        int nivel = 0;
        String sql = "call sp_valida('" + us + "','" + pass + "');";
        try {
            Class.forName(this.driverClassName);
            con = DriverManager.getConnection(this.urlBD, this.usrBD, this.passBD);
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                nivel = rs.getInt(1);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        return nivel;
    }

    //metodos para establecer los valores de conexion a la BD
    public void setUsuarioBD(String usuario) throws SQLException {
        this.usrBD = usuario;
    }

    public void setPassBD(String pass) {
        this.passBD = pass;
    }

    public void setUrlBD(String url) {
        this.urlBD = url;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public void setDriverClassName(String driverClassName) {
        this.driverClassName = driverClassName;
    }

    //Conexion a la BD
    public void conectar() throws SQLException {
        try {
            Class.forName(this.driverClassName).newInstance();
            this.conn = DriverManager.getConnection(this.urlBD, this.usrBD, this.passBD);

        } catch (Exception err) {
            System.out.println("Error " + err.getMessage());
        }
    }

    //Cerrar la conexion de BD
    public void cierraConexion() throws SQLException {
        this.conn.close();
    }

    //Metodos para ejecutar sentencias SQL
    public ResultSet consulta(String consulta) throws SQLException {
        this.estancia = (Statement) conn.createStatement();
        return this.estancia.executeQuery(consulta);
    }

    public void actualizar(String actualiza) throws SQLException {
        this.estancia = (Statement) conn.createStatement();
        estancia.executeUpdate(actualiza);
    }

    public ResultSet borrar(String borra) throws SQLException {
        Statement st = (Statement) this.conn.createStatement();
        return (ResultSet) st.executeQuery(borra);
    }

    public int insertar(String inserta) throws SQLException {
        Statement st = (Statement) this.conn.createStatement();
        return st.executeUpdate(inserta);
    }
}
