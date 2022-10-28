package edu.hhu.test;

import edu.hhu.songxinning.service.UserService;
import edu.hhu.songxinning.service.impl.UserServiceImpl;
import org.junit.Test;

public class TestUserService {

    private UserService userService = new UserServiceImpl();

    @Test

    public void testCheckAccount(){
        System.out.println(userService.userCheckAccount("lisi"));
    }

}
