
package modelado;

public class ReporteCliente {

private String tiempo;
private double total;
private double empresa;
private double persona;

    public ReporteCliente(String tiempo, double total) {
        this.tiempo = tiempo;
        this.total = total;
    }

    public ReporteCliente(String tiempo, double empresa, double persona) {
        this.tiempo = tiempo;
        this.empresa = empresa;
        this.persona = persona;
    }


    
}
