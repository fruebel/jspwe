/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soft.jf.seguridad.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import soft.jf.seguridad.bd.ConnectionFactory;

/**
 *
 * @author jbarrientos
 */
public class GeneralesDAO {

    ConnectionFactory conexionFactory = new ConnectionFactory();

    public String regresaCombo(String tabla, String where, String id, String texto) throws ClassNotFoundException, SQLException {

        Connection conexion = conexionFactory.conectar();
        String contenido = "";
        String query = "select " + id + " as id," + texto + " as texto from " + tabla + " where " + where + "  order by " + texto + " asc";
        System.out.println(query);
        if (conexion != null) {
            ResultSet rs = conexionFactory.ejecutarConsulta(query);
            String s;
            if (rs != null) {
                
                while (rs.next()) {
                    /*if (rs.getInt("id") == 2 )
                        s = "selected";
                    else
                        s="";
                    */    
                    contenido += "<option  value='" + rs.getInt("id") + "'>" + rs.getString("texto") + "</option>";
                }
            }
        }

        return contenido;
    }

}
