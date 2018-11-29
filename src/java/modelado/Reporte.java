
package modelado;

public class Reporte {

private String tiempo;
private double total;
private double paquete;
private double sobre;

    public Reporte(String tiempo, double total) {
        this.tiempo = tiempo;
        this.total = total;
    }

    public Reporte(String tiempo, double sobre, double paquete) {
        this.tiempo = tiempo;
        this.sobre = sobre;
        this.paquete = paquete;
    }


    
}
