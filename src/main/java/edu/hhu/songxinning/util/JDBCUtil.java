package edu.hhu.songxinning.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.sql.*;
import java.util.Properties;

public class JDBCUtil {

    private static Properties druidProperties = new Properties();
    private static DataSource druidDataSource;

    static {
        try {
            druidProperties.load(JDBCUtil.class.getClassLoader().getResourceAsStream("druid.properties"));
            druidDataSource = DruidDataSourceFactory.createDataSource(druidProperties);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获得Druid数据源对象
     * @return Druid数据源对象
     */
    public static DataSource getDruidDataSource(){
        return druidDataSource;
    }

    /**
     * 从Druid获得一个数据库连接对象
     * @return 数据库连接对象
     */
    public static Connection getConnectionFromDruid(){
        Connection connection = null;
        try {
            connection = druidDataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    /**
     * 释放资源
     * @param resultSet 结果集对象
     * @param statement Statement对象
     * @param connection 连接对象
     */
    public static void releaseResources(ResultSet resultSet, Statement statement, Connection connection) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
