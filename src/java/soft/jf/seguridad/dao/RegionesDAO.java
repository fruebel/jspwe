/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soft.jf.seguridad.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import soft.jf.seguridad.bd.ConnectionFactory;
import soft.jf.seguridad.modelos.Regiones;


/**
 *
 * @author gonzoaz
 */
public class RegionesDAO {
    ConnectionFactory conexionFactory = new ConnectionFactory();

    public boolean CrearRegion(Regiones region) throws ClassNotFoundException, SQLException {

        Connection conexion = conexionFactory.conectar();

        if (conexion != null) {

            String sql = "insert into regiones(idregion,nombre) ";
            sql += " values (NULL,'" + region.getNombre() + "')";

            System.out.println(sql);

            boolean exitoso = conexionFactory.ejecutarSQL(sql);
            conexionFactory.desconectar();

            if (exitoso) {
                return true;
            } else {
                return false;
            }

        } else {
            return false;
        }
    }
    
    public boolean EditaRegion(Regiones region) throws ClassNotFoundException, SQLException {

        Connection conexion = conexionFactory.conectar();

        if (conexion != null) {

            String sql = "update regiones set idregion='" + region.getIdregion() 
                    + "',nombre='" + region.getNombre() + "'"
                    + " where idregion='" + region.getIdregion() + "'";

            System.out.println(sql);

            boolean exitoso = conexionFactory.ejecutarSQL(sql);
            conexionFactory.desconectar();

            if (exitoso) {
                return true;
            } else {
                return false;
            }

        } else {
            return false;
        }
    }

    public ArrayList<Regiones> ConsultarRegiones() throws ClassNotFoundException, SQLException {

        Connection conexion = conexionFactory.conectar();
        ArrayList<Regiones> lista = new ArrayList<>();

        if (conexion != null) {

            String sql = "select r.idregion, r.nombre from regiones r "
                    + " order by r.idregion asc ";
            ResultSet rs = conexionFactory.ejecutarConsulta(sql);

            System.out.println("Consulta regiones " + sql);
            if (rs != null) {

                while (rs.next()) {
                    Regiones region = new Regiones();

                    region.setIdregion(rs.getInt("idregion"));
                    region.setNombre(rs.getString("nombre"));
                    
                    lista.add(region);
                }

            }
            conexionFactory.desconectar();
        } else {
            return null;
        }

        return lista;

    }

    public ArrayList<Regiones> ConsultarRegionxId(String idRegion) throws ClassNotFoundException, SQLException {

        Connection conexion = conexionFactory.conectar();
        ArrayList<Regiones> lista = new ArrayList<>();

        if (conexion != null) {

            String sql = "select r.idregion, r.nombre from regiones r "
                    + "where r.idregion = '" + idRegion + "' order by r.idregion asc ";
            ResultSet rs = conexionFactory.ejecutarConsulta(sql);

            System.out.println(sql);
            if (rs != null) {

                while (rs.next()) {
                    Regiones region = new Regiones();

                    region.setIdregion(rs.getInt("idregion"));
                    region.setNombre(rs.getString("nombre"));
                    
                    lista.add(region);
                }

            }
            conexionFactory.desconectar();
        } else {
            return null;
        }

        return lista;

    }
    
}
