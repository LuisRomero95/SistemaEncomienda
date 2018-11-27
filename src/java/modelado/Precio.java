
package modelado;

public class Precio {
    private int id;
    private int encomienda;    
    private String tipo;
    private int cantidad;
    private double peso;    
    private double resultado;
    
    
    private String mes;
    private double total;
    private double sobre;
    private double paquete;
    
    public Precio() {
    }

    public Precio(int id, int encomienda, String tipo, int cantidad, double peso, double resultado) {
        this.id = id;
        this.encomienda = encomienda;
        this.tipo = tipo;
        this.cantidad = cantidad;
        this.peso = peso;
        this.resultado = resultado;
    }
    
    public Precio(String mes, double total) {
        this.mes = mes;
        this.total = total;
    }    

    public Precio(String mes, double sobre, double paquete) {
        this.mes = mes;
        this.sobre = sobre;
        this.paquete = paquete;
    }    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEncomienda() {
        return encomienda;
    }

    public void setEncomienda(int encomienda) {
        this.encomienda = encomienda;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public double getResultado() {
        return resultado;
    }

    public void setResultado(double resultado) {
        this.resultado = resultado;
    }



}
