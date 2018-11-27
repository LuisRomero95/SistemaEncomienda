
package modelado;

public class Cliente {
    
    private int id;    
    private String nom;
    private String ruc_dni;
    private String email;
    private String tel_fij;
    private String tel_cel;
    private String direc;
    private String distr;
    
    private String mes;
    private double total;
    
    private double empresa;
    private double persona;

    //Constructor vacío para crear objetos vacios
    public Cliente() {
    }

    //Constructor para inicializar todos los atributos de la clase

    public Cliente(int id, String nom, String ruc_dni, String email, String tel_fij, String tel_cel, String direc, String distr) {
        this.id = id;
        this.nom = nom;
        this.ruc_dni = ruc_dni;
        this.email = email;
        this.tel_fij = tel_fij;
        this.tel_cel = tel_cel;
        this.direc = direc;
        this.distr = distr;
    }

    public Cliente(String mes, double total) {
        this.mes = mes;
        this.total = total;
    }        
    
    public Cliente(String mes, double empresa, double persona) {
        this.mes = mes;
        this.empresa = empresa;
        this.persona = persona;
    }    
   
    //Para obtener o establecer los valores de los campos

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getRuc_dni() {
        return ruc_dni;
    }

    public void setRuc_dni(String ruc_dni) {
        this.ruc_dni = ruc_dni;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel_fij() {
        return tel_fij;
    }

    public void setTel_fij(String tel_fij) {
        this.tel_fij = tel_fij;
    }

    public String getTel_cel() {
        return tel_cel;
    }

    public void setTel_cel(String tel_cel) {
        this.tel_cel = tel_cel;
    }

    public String getDirec() {
        return direc;
    }

    public void setDirec(String direc) {
        this.direc = direc;
    }

    public String getDistr() {
        return distr;
    }

    public void setDistr(String distr) {
        this.distr = distr;
    }

    
}
