
package modelado;

public class Ubicacion {

    private int id;
    private String titulo;
    private String cx;
    private String cy;

    public Ubicacion() {
    }   

    public Ubicacion(int id, String titulo, String cx, String cy) {
        this.id = id;
        this.titulo = titulo;
        this.cx = cx;
        this.cy = cy;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getCx() {
        return cx;
    }

    public void setCx(String cx) {
        this.cx = cx;
    }

    public String getCy() {
        return cy;
    }

    public void setCy(String cy) {
        this.cy = cy;
    }
    
   
    
}
