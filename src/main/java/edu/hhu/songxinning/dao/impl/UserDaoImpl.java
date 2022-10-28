package edu.hhu.songxinning.dao.impl;

import edu.hhu.songxinning.dao.UserDao;
import edu.hhu.songxinning.entity.User;
import edu.hhu.songxinning.util.JDBCUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.List;

public class UserDaoImpl implements UserDao {
    private QueryRunner queryRunner = new QueryRunner(JDBCUtil.getDruidDataSource());
    @Override
    public User selectByAccountAndPassword(String account, String password) {
        String sql =" select id,nick_name as nickName,account,password,gender," +
                " birthday,phone,email,description,birthplace " +
                " from t_user " +
                " where account=? and password=?";
        User user =null;
        try {
            user = queryRunner.query(sql,new BeanHandler<>(User.class),account,password);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    @Override
    public void update(User user) {
        String sql =" update t_user set" +
                " nick_name =?,account=?,password=?,gender=?," +
                " birthday =?,phone=?,email=?,description=?,birthplace=? " +
                " where id=? ";
       Object [] paramArray = new Object[]{
               user.getNickName(),user.getAccount(),user.getPassword(),user.getGender(),
               user.getBirthday(),user.getPhone(),user.getEmail(),user.getDescription(),user.getBirthplace(),user.getId()
       };
        try {
            queryRunner.update(sql,paramArray);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public boolean selectByAccount(String account) {
        String sql = "select count(*) from t_user where account=?";
        long count = 0;
//        boolean result = false;
        try {
            count = queryRunner.query(sql,new ScalarHandler<>(),account);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return count>0;
    }

            @Override
    public void insert(User user) {
//        id是自动增长的，所以是选择性插入。
        String sql =" insert into t_user (nick_name,account,password,gender,birthday,phone,email,description,birthplace) " +
                " value(?,?,?,?,?,?,?,?,?) ";
        Object [] paramArray = new Object[]{
                user.getNickName(),user.getAccount(),user.getPassword(),user.getGender(),
                user.getBirthday(),user.getPhone(),user.getEmail(),user.getDescription(),user.getBirthplace()
        };
        try {
            queryRunner.update(sql,paramArray);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public User selectById(int id) {
        String sql =" select id,nick_name as nickName,account,password,gender," +
                " birthday,phone,email,description,birthplace " +
                " from t_user " +
                " where id=? ";
        User user =null;
        try {
            user = queryRunner.query(sql,new BeanHandler<>(User.class),id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }

    @Override
    public void deleteById(int id) {
        String sql =" delete from t_user where id=?";
        try {
            queryRunner.update(sql,id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<User> selectAll() {
        String sql =" select id,nick_name as nickName,account,password,gender," +
                " birthday,phone,email,description,birthplace " +
                " from t_user " ;
        List <User> userList= null;
        try {
            userList = queryRunner.query(sql,new BeanListHandler<>(User.class));
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }


}
