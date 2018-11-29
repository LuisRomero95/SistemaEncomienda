
package modelado;

public class ReporteVehiculo {

private String tiempo;
private double total;
private double acura;
private double audi;
private double honda;
private double cadillac;
private double ford;

    public ReporteVehiculo(String tiempo, double total) {
        this.tiempo = tiempo;
        this.total = total;
    }

    public ReporteVehiculo(String tiempo, double acura, double audi, double honda, double cadillac, double ford) {
        this.tiempo = tiempo;
        this.acura = acura;
        this.audi = audi;
        this.honda = honda;
        this.cadillac = cadillac;
        this.ford = ford;
    }
    
}
