package kz.project.dao;

import kz.project.entities.Notes;
import kz.project.entities.Users;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.management.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import java.awt.geom.QuadCurve2D;
import java.util.List;

@Component
@Scope("singleton")
public class UsersDAOImpl implements UsersDAO{
    @Autowired
    SessionFactory sessionFactory;
    @Override
    public void addUser(Users user) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(user);
        transaction.commit();
        session.close();
    }

    @Override
    public Users getUser(String login, String password) {
        Session session = sessionFactory.openSession();
        Users users = (Users)session.createQuery("SELECT c FROM Users c WHERE c.login = :login and c.password = :password")
                .setParameter("login", login)
                .setParameter("password", password).uniqueResult();
        session.close();
        return users;
    }

    @Override
    public void changeLogin(Users user) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(user);
        transaction.commit();
        session.close();
    }

    @Override
    public void changePassword(Users user) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(user);
        transaction.commit();
        session.close();
    }

}
