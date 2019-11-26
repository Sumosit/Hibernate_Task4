package kz.project.dao;

import kz.project.entities.Notes;
import kz.project.entities.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import java.util.List;

@Component
@Scope("singleton")
public class NotesDAOImpl implements NotesDAO{
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public void addNote(Notes note) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(note);
        transaction.commit();
        session.close();
    }

    @Override
    public List getAllNotes() {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Notes> query = builder.createQuery(Notes.class);
        query.from(Notes.class);
        List<Notes> notes = session.createQuery(query).list();
        session.close();
        return notes;
    }

    @Override
    public List getUserNotes(Users user) {
        Session session = sessionFactory.openSession();
        String hql = "from Notes e where e.author = :author";
        Query query = session.createQuery(hql);
        query.setParameter("author", user.getLogin());
        List notes = query.getResultList();
        return notes;
    }

    @Override
    public Notes getNote(int id) {
        Session session = sessionFactory.openSession();
        Notes notes = (Notes) session.createQuery("SELECT c FROM Notes c WHERE c.id = :id")
                .setParameter("id", id).uniqueResult();
        session.close();
        return notes;
    }

    @Override
    public void updateNote(Notes note) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(note);
        transaction.commit();
        session.close();
    }

    @Override
    public void deleteNote(Notes note) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(note);
        transaction.commit();
        session.close();
    }
}
