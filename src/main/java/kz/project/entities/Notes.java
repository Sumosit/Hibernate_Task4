package kz.project.entities;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "notes")
public class Notes {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private int id;
    @Column(name = "author", length = 255)
    private String author;
    @Column(name = "content", length = 255)
    private String content;
    @Column(name = "postDate")
    private Timestamp postDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getPostDate() {
        return postDate;
    }

    public void setPostDate(Timestamp postDate) {
        this.postDate = postDate;
    }

    public Notes() {
    }

    public Notes(String author, String content, Timestamp postDate) {
        this.author = author;
        this.content = content;
        this.postDate = postDate;
    }
}
