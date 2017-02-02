/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soft.jf.seguridad.modelos;

/**
 *
 * @author Fcantera
 */
public class Areas {
    private int idarea;
    private String descripcion;
    private Regiones idregion;
    private String calle;
    private String numext;
    private String numint;
    private String localidad; 
    private String municipio;
    private String cp;
    private String pais;

    public int getIdarea() {
        return idarea;
    }

    public void setIdarea(int idarea) {
        this.idarea = idarea;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Regiones getIdregion() {
        return idregion;
    }

    public void setIdregion(Regiones idregion) {
        this.idregion = idregion;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getNumext() {
        return numext;
    }

    public void setNumext(String numext) {
        this.numext = numext;
    }

    public String getNumint() {
        return numint;
    }

    public void setNumint(String numint) {
        this.numint = numint;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public String getMunicipio() {
        return municipio;
    }

    public void setMunicipio(String municipio) {
        this.municipio = municipio;
    }

    public String getCp() {
        return cp;
    }

    public void setCp(String cp) {
        this.cp = cp;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
    
    
}
