package edu.hhu.songxinning.service;

import edu.hhu.songxinning.entity.Admin;

public interface AdminService {
    //面向业务的
    Admin login(String account, String password);
}
