package edu.hhu.songxinning.dao.impl;

import edu.hhu.songxinning.dao.AdminDao;
import edu.hhu.songxinning.entity.Admin;
import edu.hhu.songxinning.util.JDBCUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class AdminDaoimpl implements AdminDao {

    private QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDruidDataSource());

    //java中需要对象操作数据库。
    @Override
    public Admin selectByAccountAndPassword(String account, String password) {
        String sql ="select id,name,account,password " +
                    "from t_admin " +
                    "where account=? and password=?";
        //进行声明
        Admin admin = null;
        //创建try catch环境
        try {
            admin = queryRunner.query(sql,new BeanHandler<>(Admin.class),account,password);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return admin;//返回admin
    }
}
