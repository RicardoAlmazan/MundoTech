package proceso;

import BD.cDatos;
import java.sql.ResultSet;
import java.sql.SQLException;
public class cInfo {

    String dato;
    int datoi;
    float datof;
    public cInfo() throws SQLException {
    }
    public int consultaint(String consulta, String column) throws SQLException{
        int num = 0;
        cDatos obj = new cDatos();
        ResultSet rs;
        try {
            //conecta a la base de datos
            obj.conectar();
            //realisa consultas
            rs = obj.consulta(consulta);
            while(rs.next())
            {
                num = rs.getInt(column);
            }
            obj.cierraConexion();
        } catch (Exception e) 
        {
           
        }
        return num;
    }
    public void consultafloat(String consulta) throws SQLException{
        
    }
    public void consultaString(String consulta) throws SQLException{
       
    }
}
