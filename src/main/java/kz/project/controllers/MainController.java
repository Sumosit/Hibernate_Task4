package kz.project.controllers;

import kz.project.dao.NotesDAO;
import kz.project.dao.UsersDAO;
import kz.project.entities.Notes;
import kz.project.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;

import java.util.List;

@Controller
@RequestMapping(name = "task4")
public class MainController {
    @Autowired
    HttpServletRequest request;
    @Autowired
    NotesDAO notesDAO;
    @Autowired
    UsersDAO usersDAO;

    /////////////////////////////////////////////////////
    // Notes
    @RequestMapping(value = "/notes", method = RequestMethod.GET)
    public ModelAndView notesGet(){
        ModelAndView mw = new ModelAndView("notes");
        Users user = (Users) request.getSession().getAttribute("user_data");

        List<Notes> notes = notesDAO.getAllNotes();

        mw.addObject("user", user);
        mw.addObject("notes", notes);
        return mw;
    }
    @RequestMapping(value = "/addNote", method = RequestMethod.POST)
    public String addNote(@RequestParam(name = "author") String author,
                          @RequestParam(name = "content") String content){
        Notes note = new Notes(author, content, null);
        notesDAO.addNote(note);
        return "redirect:/notes";
    }
    /////////////////////////////////////////////////////
    // Logout
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout() {
        request.getSession().invalidate();
        return "redirect:/login";
    }
    /////////////////////////////////////////////////////
    // Login
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView getLogin() {
        ModelAndView mw = new ModelAndView("login");
        return mw;
    }
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String postLogin(@RequestParam(value = "login") String login,
                                  @RequestParam(value = "password") String password) {
        request.getSession().invalidate();
        Users user = usersDAO.getUser(login, password);
        if (user != null) {
            System.out.println("LOGIN SUCCESSFUL");
            request.getSession().setAttribute("user_data", user);
            return "redirect:/notes";
        }
        return "redirect:/login";
    }
    /////////////////////////////////////////////////////
    // Register
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView getRegister() {
        ModelAndView mw = new ModelAndView("register");
        return mw;
    }
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String postRegister(@RequestParam(value = "email") String email,
                                     @RequestParam(value = "login") String login,
                                     @RequestParam(value = "password") String password,
                                     @RequestParam(value = "repassword") String repassword) {
        ModelAndView mw = new ModelAndView("register");
        request.getSession().invalidate();
        Users user = usersDAO.getUser(login, password);
        if (user != null && repassword.equals(password)) {
            return "redirect:/register";
        }
        Users newuser = new Users(email, login, password, repassword);

        request.getSession().setAttribute("user_data", newuser);
        usersDAO.addUser(newuser);
        return "redirect:/login";
    }
    /////////////////////////////////////////////////////
    // Profile
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView profile() {
        ModelAndView mw = new ModelAndView("profile");
        Users user = (Users) request.getSession().getAttribute("user_data");
        mw.addObject("user", user);
        return mw;
    }
    @RequestMapping(value = "/changepassword", method = RequestMethod.POST)
    public String changePassword(@RequestParam(value = "oldpassword") String oldp,
                                 @RequestParam(value = "newpassword") String newp,
                                 @RequestParam(value = "renewpassword") String renewp) {
        Users user = (Users) request.getSession().getAttribute("user_data");
        String login = user.getLogin();
        String password = user.getPassword();
        if (password.equals(oldp) && newp.equals(renewp)) {
            user.setPassword(newp);
            user.setRepassword(newp);
            usersDAO.changePassword(user);
            request.getSession().setAttribute("user_data", new Users(null, newp, newp, login));
        }
        return "redirect:/profile";
    }
    @RequestMapping(value = "/changelogin", method = RequestMethod.POST)
    public String changeLogin(@RequestParam(value = "login") String newlogin) {
        Users user = (Users) request.getSession().getAttribute("user_data");
        List<Notes> notes = notesDAO.getUserNotes(user);

        for (Notes c : notes) {
            c.setAuthor(newlogin);
            notesDAO.updateNote(c);
            System.out.println(c.getAuthor());
        }

        user.setLogin(newlogin);
        usersDAO.changeLogin(user);
        request.getSession().setAttribute("user_data", user);
        return "redirect:/profile";
    }
    /////////////////////////////////////////////////////
    // Edit Note
    @RequestMapping(value = "/editnote", method = RequestMethod.GET)
    public ModelAndView getEditPost(@RequestParam(value = "id") int id) {
        ModelAndView mw = new ModelAndView("editNote");
        Notes note = notesDAO.getNote(id);
        mw.addObject("note", note);
        return mw;
    }
    @RequestMapping(value = "/editnote", method = RequestMethod.POST)
    public ModelAndView postEditPost(@RequestParam(value = "id") int id) {
        ModelAndView mw = new ModelAndView("editNote");
        Notes note = notesDAO.getNote(id);
        mw.addObject("note", note);
        return mw;
    }
    @RequestMapping(value = "/editnotedo", method = RequestMethod.POST)
    public String doEditPost(@RequestParam(value = "id") int id,
                             @RequestParam(value = "content") String content,
                             @RequestParam(value = "author") String author) {
        Notes note = new Notes();
        note.setId(id);
        note.setContent(content);
        note.setAuthor(author);
        notesDAO.updateNote(note);
        return "redirect:/notes";
    }
    /////////////////////////////////////////////////////
    // Delete Note
    @RequestMapping(value = "/deletenote", method = RequestMethod.POST)
    public String deletePost(@RequestParam(value = "id") int id) {
        Notes note = new Notes();
        note.setId(id);
        notesDAO.deleteNote(note);
        return "redirect:/notes";
    }
    /////////////////////////////////////////////////////
    // Read More
    @RequestMapping(value = "/readmore", method = RequestMethod.POST)
    public ModelAndView readMore(@RequestParam(name = "id") int id){
        Notes note = notesDAO.getNote(id);
        ModelAndView mw = new ModelAndView("readmore");
        mw.addObject("note", note);
        return mw;
    }
}
