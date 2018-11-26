
package modelado;

public class Vehiculo {
    
    private int id;
    private String placa;
    private String conductor;
    private String ayudante;
    private String año;
    private String marca;    
    private String modelo;
    private String serie;    
    private int capmax;
    private int pasmax;
    
    private int total;

    public Vehiculo() {
    }

    public Vehiculo(int id, String placa, String conductor, String ayudante, String año, String marca, String modelo, String serie, int capmax, int pasmax) {
        this.id = id;
        this.placa = placa;
        this.conductor = conductor;
        this.ayudante = ayudante;
        this.año = año;
        this.marca = marca;
        this.modelo = modelo;
        this.serie = serie;
        this.capmax = capmax;
        this.pasmax = pasmax;
    }
    
    public Vehiculo(String marca, int total) {
        this.marca = marca;
        this.total = total;
    }       
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getConductor() {
        return conductor;
    }

    public void setConductor(String conductor) {
        this.conductor = conductor;
    }

    public String getAyudante() {
        return ayudante;
    }

    public void setAyudante(String ayudante) {
        this.ayudante = ayudante;
    }

    public String getAño() {
        return año;
    }

    public void setAño(String año) {
        this.año = año;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }


    
    

    public int getPasmax() {
        return pasmax;
    }

    public void setPasmax(int pasmax) {
        this.pasmax = pasmax;
    }

    public int getCapmax() {
        return capmax;
    }

    public void setCapmax(int capmax) {
        this.capmax = capmax;
    }


   
}

