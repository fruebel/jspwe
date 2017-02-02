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
import soft.jf.seguridad.modelos.Areas;

/**
 *
 * @author fcantera
 */
public class AreasDAO {
    ConnectionFactory conexionFactory = new ConnectionFactory();

    public boolean CrearArea(Areas area) throws ClassNotFoundException, SQLException {

        Connection conexion = conexionFactory.conectar();

        if (conexion != null) {

            String sql = "insert into areas(idarea,descripcion,idregion,calle,numext,numint,localidad,municipio"
                    + ",cp,pais) ";
            sql += " values ('" + area.getIdarea() + "','" + area.getDescripcion() + "','" + area.getIdregion() + "','" 
                        + area.getCalle() + "','" + area.getNumext() + "','" + area.getNumint()
                        + "','" + area.getLocalidad() + "','" + area.getMunicipio() + "','" + area.getCp() + "','" 
                        + area.getPais() + "')";

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

    public boolean EditaArea(Areas area) throws ClassNotFoundException, SQLException {

        Connection conexion = conexionFactory.conectar();

        if (conexion != null) {

            String sql = "update areas set descripcion='" + usuario.getDescripcion() + "',idregion='" + area.getIdregion() + "',"
                    + "calle='" + area.getCalle() + "',numext='" + area.getnumex() + "',"
                    + "numint='" + area.numint() + "',localidad='" + area.getlocalidad() + "',"
                    + "municipio='" + area.getMunicipio() + "'"
                    + ",cp='" + area.getCp() + "',pais='" + area.getPais() + "' where idArea='" + area.getIdArea() + "'";

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

    public ArrayList<Segusuarios> ConsultarUsuarios() throws ClassNotFoundException, SQLException {

        Connection conexion = conexionFactory.conectar();
        ArrayList<Segusuarios> lista = new ArrayList<>();

        if (conexion != null) {

            String sql = "select u.*,e.estado,p.nombre as perfil from seg_usuarios u,estados_usuarios e,seg_perfiles p "
                    + "where u.idestado = e.idestado and u.idperfil=p.idperfil order by e.idestado asc ";
            ResultSet rs = conexionFactory.ejecutarConsulta(sql);

            System.out.println("Consulta usuarios " + sql);
            if (rs != null) {

                while (rs.next()) {
                    Segusuarios usuario = new Segusuarios();

                    usuario.setIdUsuario(rs.getString("idusuario"));
                    usuario.setContrasenia(rs.getString("contrasenia"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setApellidoPaterno(rs.getString("apellidopaterno"));
                    usuario.setApellidoMaterno(rs.getString("apellidomaterno"));
                    usuario.setFotografia(rs.getString("fotografia"));
                    usuario.setTelefono(rs.getString("telefono"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setUltimoAcceso(rs.getDate("ultimoacceso"));

                    Estadosusuarios estadousuario = new Estadosusuarios();
                    estadousuario.setIdestado(rs.getInt("idestado"));
                    estadousuario.setEstado(rs.getString("estado"));
                    usuario.setIdEstado(estadousuario);

                    Segperfiles perfil = new Segperfiles();
                    perfil.setPerfil(rs.getString("perfil"));
                    perfil.setIdperfil(rs.getInt("idperfil"));
                    usuario.setIdperfil(perfil);

                    usuario.setTema(rs.getString("tema"));
                    usuario.setLenguaje(rs.getString("lenguaje"));
                    usuario.setUltimaActualizacion(rs.getDate("ultimaactualizacion"));
                    usuario.setFechaRegistro(rs.getDate("fecharegistro"));
                    usuario.setIdUsuarioRegistro(rs.getString("idusuarioregistro"));
                    usuario.setSuperusuario(rs.getInt("superusuario"));

                    lista.add(usuario);
                }

            }
            conexionFactory.desconectar();
        } else {
            return null;
        }

        return lista;

    }

    public ArrayList<Segusuarios> ConsultarUsuariosxId(String idUsuario) throws ClassNotFoundException, SQLException {

        Connection conexion = conexionFactory.conectar();
        ArrayList<Segusuarios> lista = new ArrayList<>();

        if (conexion != null) {

            String sql = "select u.*,e.estado,p.nombre as perfil from seg_usuarios u,estados_usuarios e,seg_perfiles p "
                    + "where u.idestado = e.idestado and u.idperfil=p.idperfil and u.idusuario='" + idUsuario + "' order by e.idestado asc ";
            ResultSet rs = conexionFactory.ejecutarConsulta(sql);

            System.out.println(sql);
            if (rs != null) {

                while (rs.next()) {
                    Segusuarios usuario = new Segusuarios();

                    usuario.setIdUsuario(rs.getString("idusuario"));
                    usuario.setContrasenia(rs.getString("contrasenia"));
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setApellidoPaterno(rs.getString("apellidopaterno"));
                    usuario.setApellidoMaterno(rs.getString("apellidomaterno"));
                    usuario.setFotografia(rs.getString("fotografia"));
                    usuario.setTelefono(rs.getString("telefono"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setUltimoAcceso(rs.getDate("ultimoacceso"));

                    Estadosusuarios estadousuario = new Estadosusuarios();
                    estadousuario.setIdestado(rs.getInt("idestado"));
                    estadousuario.setEstado(rs.getString("estado"));
                    usuario.setIdEstado(estadousuario);

                    Segperfiles perfil = new Segperfiles();
                    perfil.setPerfil(rs.getString("perfil"));
                    perfil.setIdperfil(rs.getInt("idperfil"));
                    usuario.setIdperfil(perfil);

                    usuario.setTema(rs.getString("tema"));
                    usuario.setLenguaje(rs.getString("lenguaje"));
                    usuario.setUltimaActualizacion(rs.getDate("ultimaactualizacion"));
                    usuario.setFechaRegistro(rs.getDate("fecharegistro"));
                    usuario.setIdUsuarioRegistro(rs.getString("idusuarioregistro"));
                    usuario.setSuperusuario(rs.getInt("superusuario"));

                    lista.add(usuario);
                }

            }
            conexionFactory.desconectar();
        } else {
            return null;
        }

        return lista;

    }

    public String validaUsuario(String usuario, String contrasenia) throws ClassNotFoundException, SQLException {

        //ConnectionFactory connectionfactory = new ConnectionFactory();
        Connection conexion = conexionFactory.conectar();

        String existe = "";
        int existe1 = 0;

        if (conexion != null) {

            //valida nombre de usuario
            String sql = "select count(*) as existe from seg_usuarios where idusuario='" + usuario + "' and idestado=1";
            ResultSet rs = conexionFactory.ejecutarConsulta(sql);

            if (rs != null) {
                while (rs.next()) {
                    existe1 = rs.getInt("existe");
                    if (existe1 > 0) {
                        existe = "";
                    } else {
                        existe = "Usuario No existe / Inactivo"; //usuario no existe
                        return existe;
                    }
                }
            } else {
                existe = "Consulta de usuario vacia"; //consulta del usuario vacia 
                return existe;
            }

            //existe = "dfdfgdfgdfg";
            //return existe;
            //valida contraseña
            if (existe.equals("")) {

                sql = "select count(*) as existe from seg_usuarios where contrasenia='" + contrasenia + "'";

                ResultSet rsc = conexionFactory.ejecutarConsulta(sql);
                if (rsc != null) {
                    while (rsc.next()) {
                        existe1 = rsc.getInt("existe");
                        if (existe1 > 0) {
                            existe = "";
                        } else {
                            existe = "Error en contraseña"; //contraseña usuario no existe
                            return existe;
                        }
                    }
                } else {
                    existe = "Consulta de usuario vacia"; //consulta del usuario vacia 
                    return existe;
                }

            }

            /*if (existe.equals("")){

                                    sql = "select count(*) as existe from usuarios where contrasenia='"+contrasenia+"' "
                                                    + " and usuario= '"+usuario+"' ";

                                    ResultSet rsc = connectionfactory.ejecutarConsulta(sql);
                                    if (rsc != null) {
                                            if (rsc.next()) {
                                                    existe1 = rsc.getInt("existe");
                                                    if (existe1 > 0) {
                                                            existe = "";
                                                    } else {
                                                            existe = ""; //contraseña perfil no coincide
                                                            return existe;
                                                    }
                                            }	
                                    }
                                    else{
                                            existe = -7; //consulta del usuario vacia 
                                            return existe;
                                    }	

                            }*/
        } else {
            existe = "Error en conexion a base de datos"; //errror en conexion
        }
        //existe = "finzli";
        return existe;
    }

    public void actualizaultimoacceso(String usuario) throws ClassNotFoundException, SQLException {

        Connection conexion = conexionFactory.conectar();

        if (conexion != null) {

            String sql = "update seg_usuarios set ultimoacceso=now() where idusuario='" + usuario + "'";
            boolean r = conexionFactory.ejecutarSQL(sql);

        }

    }

    public int verificaUsuario(String usuario, String operacion) throws ClassNotFoundException, SQLException {

        Connection conexion = conexionFactory.conectar();
        int numero_registros = 0;
        String sql;
        if (operacion.equals("nuevo")) {
            sql = "select count(*) as existe from seg_usuarios where idusuario='" + usuario + "'";
        } else {
            sql = "select count(*) as existe from seg_usuarios where idusuario='" + usuario + "' and idusuario<>'" + usuario + "'";
        }

        if (conexion != null) {
            ResultSet rs = conexionFactory.ejecutarConsulta(sql);
            if (rs != null) {
                while (rs.next()) {
                    numero_registros = rs.getInt("existe");
                }
            }
        }
        return numero_registros;
    }
}
