package kz.project.dao;

import kz.project.entities.Notes;
import kz.project.entities.Users;

import java.util.ArrayList;
import java.util.List;

public interface NotesDAO {
    void addNote(Notes note);
    List<Notes> getAllNotes();
    List<Notes> getUserNotes(Users user);
    Notes getNote(int id);
    void updateNote(Notes note);
    void deleteNote(Notes note);
}
