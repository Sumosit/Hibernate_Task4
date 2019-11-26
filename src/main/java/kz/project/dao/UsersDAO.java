package kz.project.dao;

import kz.project.entities.Users;

public interface UsersDAO {
    void addUser(Users user);
    Users getUser(String fullname, String password);
    void changePassword(Users user);
    void changeLogin(Users user);
}
