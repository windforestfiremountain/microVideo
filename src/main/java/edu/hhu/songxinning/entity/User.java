package edu.hhu.songxinning.entity;

import lombok.Data;
//生成读写方法。满足java规范。
@Data
public class User {
    private Integer id;
    private String nickName;
    private String account;
    private String password;
    private String gender;
    private String birthday;
    private String phone;
    private String email;
    private String description;
    private String birthplace;
}
