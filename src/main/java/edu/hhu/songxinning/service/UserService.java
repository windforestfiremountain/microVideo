package edu.hhu.songxinning.service;

import edu.hhu.songxinning.entity.User;

import java.util.List;

public interface UserService {

    User login(String account, String password);

    void modify(User user);

    void add(User user);

    void remove(int id);

    boolean userCheckAccount(String account);


    User queryById(int id);

    List<User> queryAll();
}
