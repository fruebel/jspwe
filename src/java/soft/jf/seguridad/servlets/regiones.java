/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soft.jf.seguridad.servlets;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import soft.jf.seguridad.modelos.Regiones;
import soft.jf.seguridad.dao.RegionesDAO;
import soft.jf.seguridad.utils.MsgRespuesta;

/**
 *
 * @author fcantera
 */
public class regiones extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(true);
            String sessionUsuario = (String) session.getAttribute("sessionUsuaurio");

            Gson json;
            MsgRespuesta resp;
            Regiones obj;
            ArrayList<Regiones> lista;
            RegionesDAO objDAO;
            int existe;

            String action = request.getParameter("action");
            String idRow = request.getParameter("idRow");
            String nombre = request.getParameter("nombre");
            
            String data = "";
            String botonEditar = "";

            switch (action) {

                case "listar":

                    data = "<thead> ";
                    data = data + "<tr> ";
                    data = data + "<th></th> ";
                    data = data + "<th>Nombre</th> ";
                    data = data + "</tr> ";
                    data = data + "</thead> ";
                    data = data + "<tfoot> ";
                    data = data + "<tr> ";

                    data = data + "<th></th> ";
                    data = data + "<th>Nombre</th> ";
                    data = data + "</tr> ";
                    data = data + "</tfoot>";

                    data = data + "<tbody>";

                    obj = new Regiones();
                    objDAO = new RegionesDAO();
                    lista = new ArrayList<>();
                    String strActivo = "";
                    try {
                        lista = objDAO.ConsultarRegiones();
                        for (Regiones objregiones : lista) {

                            botonEditar = "<a id='" + objregiones.getIdregion() + "'  onclick='editar(this);'  class='btn-floating  waves-effect waves-light red tooltipped' href='#modal1' data-position='left' data-delay='100' data-tooltip='Editar Registro' ><i class='material-icons md-18'>mode_edit</i></a>";

                            data = data + " <tr> ";
                            data = data + " <td>" + botonEditar + "</td>";
                            data = data + " <td>" + objregiones.getIdregion() + " - " + objregiones.getNombre() + "</td>";
                            

                            data = data + " </tr>";
                        }
                        data = data + "</tbody>";
                        out.println(data);
                    } catch (ClassNotFoundException | SQLException ex) {
                        out.print("Error General Intente mas tarde!!!!" + ex.getMessage());
                        Logger.getLogger(regiones.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    break;

                case "consulta":

                    json = new Gson();
                    objDAO = new RegionesDAO();
                    lista = new ArrayList<>();
                     {
                        try {
                            lista = objDAO.ConsultarRegionxId(idRow);
                        } catch (ClassNotFoundException | SQLException ex) {
                            Logger.getLogger(regiones.class.getName()).log(Level.SEVERE, null, ex);
                            out.print("Error General Intente mas tarde!!!!" + ex.getMessage());
                        }
                    }
                    out.print(json.toJson(lista));

                    break;

                case "editar":

                    obj = new Regiones();
                    obj.setIdregion(Integer.parseInt(idRow));
                    obj.setNombre(nombre);
                    
                    objDAO = new RegionesDAO();
                    resp = new MsgRespuesta();
                    json = new Gson();

                    
                        
                            try {

                                boolean respuesta = objDAO.EditaRegion(obj);
                                if (respuesta) {
                                    resp.setRespuesta(true);
                                    resp.setMensaje("Region Editada Correctamente");

                                } else {

                                    resp.setRespuesta(false);
                                    resp.setMensaje("Error al editar la region");

                                }

                            } catch (ClassNotFoundException | SQLException ex) {
                                Logger.getLogger(regiones.class.getName()).log(Level.SEVERE, null, ex);
                                resp.setRespuesta(false);
                                resp.setMensaje("Error al editar la Region , Consulte al Administrador");

                            }
                        

                    
                    out.print(json.toJson(resp));
                    break;
                case "nuevo":

                    obj = new Regiones();
                    obj.setNombre(nombre);
                    
                    objDAO = new RegionesDAO();
                    resp = new MsgRespuesta();
                    json = new Gson();

                    try {
                        boolean respuesta = objDAO.CrearRegion(obj);
                        if (respuesta) {
                            resp.setRespuesta(true);
                            resp.setMensaje("Region Registrada Correctamente");
                            //out.print(json.toJson(resp));
                        } else {

                            resp.setRespuesta(false);
                            resp.setMensaje("Error al Registrar la Region");
                            //out.print(json.toJson(resp));

                        }
                    } catch (ClassNotFoundException | SQLException ex) {
                        Logger.getLogger(regiones.class.getName()).log(Level.SEVERE, null, ex);
                        resp.setRespuesta(false);
                        resp.setMensaje("Error al registrar la region , Consulte al Administrador");
                        //out.print(json.toJson(resp));
                    }
                    
                    out.print(json.toJson(resp)); 
                    break;
                default:
                    break;

            }
            out.flush();
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
