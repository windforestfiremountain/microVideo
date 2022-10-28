package edu.hhu.songxinning.service.impl;

import edu.hhu.songxinning.dao.UserDao;
import edu.hhu.songxinning.dao.impl.UserDaoImpl;
import edu.hhu.songxinning.entity.User;
import edu.hhu.songxinning.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDaoImpl();

    @Override
    public User login(String account, String password) {
        return userDao.selectByAccountAndPassword(account, password);
    }

    @Override
    public void modify(User user) {
        userDao.update(user);
    }

    @Override
    public void add(User user) {
        userDao.insert(user);
    }

    @Override
    public void remove(int id) {
        userDao.deleteById(id);
    }

    @Override
    public boolean userCheckAccount(String account) {
        return userDao.selectByAccount(account);
    }

    @Override
    public User queryById(int id) {
        return userDao.selectById(id);
    }

    @Override
    public List<User> queryAll() {
        return userDao.selectAll();
    }
}
