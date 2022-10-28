package edu.hhu.songxinning.service.impl;

import edu.hhu.songxinning.dao.AdminDao;
import edu.hhu.songxinning.dao.impl.AdminDaoimpl;
import edu.hhu.songxinning.entity.Admin;
import edu.hhu.songxinning.service.AdminService;

public class AdminServiceimpl implements AdminService {

    //登录业务,Dao数据访问对象
    private AdminDao adminDao = new AdminDaoimpl();

    @Override
    public Admin login(String account, String password) {
        return adminDao.selectByAccountAndPassword(account, password);
    }
}
