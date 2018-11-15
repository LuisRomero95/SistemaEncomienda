
package modelado;

import java.sql.Date;

public class Encomienda {
    private int id;
    private String emisor; //cliente
    private String usuario;    
    private String vehiculo;    
    private String receptor; //Adcional
    private String descripcion; //adicional
    private Date fecha;
    private String tipo;
    
    private String mes;
    private double total;
    
    public Encomienda() {
    }         

    public Encomienda(int id, String emisor, String usuario, String vehiculo, String receptor, String descripcion, Date fecha, String tipo) {
        this.id = id;
        this.emisor = emisor;
        this.usuario = usuario;
        this.vehiculo = vehiculo;
        this.receptor = receptor;
        this.descripcion = descripcion;
        this.fecha = fecha;
        this.tipo = tipo;
    }

    public Encomienda(String mes, double total) {
        this.mes = mes;
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmisor() {
        return emisor;
    }

    public void setEmisor(String emisor) {
        this.emisor = emisor;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getVehiculo() {
        return vehiculo;
    }

    public void setVehiculo(String vehiculo) {
        this.vehiculo = vehiculo;
    }

    public String getReceptor() {
        return receptor;
    }

    public void setReceptor(String receptor) {
        this.receptor = receptor;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    

  
}
