package kz.project.entities;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class Users {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private int id;
    @Column(name = "email", length = 255)
    private String email;
    @Column(name = "password", length = 255)
    private String password;
    @Column(name = "repassword", length = 255)
    private String repassword;
    @Column(name = "login", length = 255)
    private String login;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getRepassword() {
        return repassword;
    }

    public void setRepassword(String re_password) {
        this.repassword = re_password;
    }

    public Users() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Users(String email, String password, String repassword, String login) {
        this.email = email;
        this.password = password;
        this.repassword = repassword;
        this.login = login;
    }
}
