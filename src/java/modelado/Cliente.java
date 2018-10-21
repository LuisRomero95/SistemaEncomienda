
package modelado;

public class Cliente {
    
    private int id;    
    private String nom;
    private String ruc_dni;
    private String email;
    private String tel_fij;
    private String tel_cel;
    private String direc;

    //Constructor vacío para crear objetos vacios
    public Cliente() {
    }

    //Constructor para inicializar todos los atributos de la clase

    public Cliente(int id, String nom, String ruc_dni, String email, String tel_fij, String tel_cel, String direc) {
        this.id = id;
        this.nom = nom;
        this.ruc_dni = ruc_dni;
        this.email = email;
        this.tel_fij = tel_fij;
        this.tel_cel = tel_cel;
        this.direc = direc;
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

    
}
