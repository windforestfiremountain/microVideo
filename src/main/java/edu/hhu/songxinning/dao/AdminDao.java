package edu.hhu.songxinning.dao;

import edu.hhu.songxinning.entity.Admin;

public interface AdminDao {
    //做一个接口，返回值是Admin，面向用户的。
    Admin selectByAccountAndPassword(String account, String password);
}
