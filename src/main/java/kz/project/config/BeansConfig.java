package kz.project.config;

import kz.project.dao.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

@Configuration
@ComponentScan(basePackages = {"kz.project"})
public class BeansConfig {

    @Bean
    @Scope("singleton")
    public NotesDAO notesDAO() {
        return new NotesDAOImpl();
    }

    @Bean
    @Scope("singleton")
    public UsersDAO usersDAO() {
        return new UsersDAOImpl();
    }
}
