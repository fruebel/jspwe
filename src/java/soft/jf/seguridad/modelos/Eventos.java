/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soft.jf.seguridad.modelos;

import java.util.Date;

/**
 *
 * @author jbarrientos
 */
public class Eventos {
    
  private int idevento;
  private String idusuarioregistro;
  private String nombreevento;
  private Date fechaevento;
  private String direccionevento;
  private int participantesevento;
  private Date horaevento;
  private Date fecharegistro;
  private String idusuariomodifico;
  private Date fechamodifico;

    public int getIdevento() {
        return idevento;
    }

    public void setIdevento(int idevento) {
        this.idevento = idevento;
    }

    public String getIdusuarioregistro() {
        return idusuarioregistro;
    }

    public void setIdusuarioregistro(String idusuarioregistro) {
        this.idusuarioregistro = idusuarioregistro;
    }

    public String getNombreevento() {
        return nombreevento;
    }

    public void setNombreevento(String nombreevento) {
        this.nombreevento = nombreevento;
    }

    public Date getFechaevento() {
        return fechaevento;
    }

    public void setFechaevento(Date fechaevento) {
        this.fechaevento = fechaevento;
    }

    public String getDireccionevento() {
        return direccionevento;
    }

    public void setDireccionevento(String direccionevento) {
        this.direccionevento = direccionevento;
    }

    public int getParticipantesevento() {
        return participantesevento;
    }

    public void setParticipantesevento(int participantesevento) {
        this.participantesevento = participantesevento;
    }

    public Date getHoraevento() {
        return horaevento;
    }

    public void setHoraevento(Date horaevento) {
        this.horaevento = horaevento;
    }

    public Date getFecharegistro() {
        return fecharegistro;
    }

    public void setFecharegistro(Date fecharegistro) {
        this.fecharegistro = fecharegistro;
    }

    public String getIdusuariomodifico() {
        return idusuariomodifico;
    }

    public void setIdusuariomodifico(String idusuariomodifico) {
        this.idusuariomodifico = idusuariomodifico;
    }

    public Date getFechamodifico() {
        return fechamodifico;
    }

    public void setFechamodifico(Date fechamodifico) {
        this.fechamodifico = fechamodifico;
    }
  
  
}
