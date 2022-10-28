package edu.hhu.songxinning.dao;

import edu.hhu.songxinning.entity.User;

import java.util.List;

public interface UserDao {
   User selectByAccountAndPassword(String account, String password);

   void update(User user);

   boolean selectByAccount(String account);

   void insert(User user);

   User selectById(int id);

   void deleteById(int id);

   List<User> selectAll();

}
