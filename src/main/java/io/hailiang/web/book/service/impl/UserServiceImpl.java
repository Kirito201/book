package io.hailiang.web.book.service.impl;

import io.hailiang.web.book.dao.UserMapper;
import io.hailiang.web.book.model.User;
import io.hailiang.web.book.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Auther: luhailiang
 * @Date: 2019-03-12 16:56
 * @Description:
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    /**
     * @param userId
     * @return : io.hailiang.web.book.model.User
     * @author: luhailiang
     * @date: 2019-03-13 07:54
     * @description: 根据用户id查询用户
     */
    @Override
    public User findUserByUserId(Integer userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    /**
     * @param userName
     * @return : io.hailiang.web.book.model.User
     * @author: luhailiang
     * @date: 2019-03-13 07:55
     * @description: 根据用户名查询用户
     */
    @Override
    public User findUserByUserName(String userName) {
        return userMapper.selectByUserName(userName);
    }


}
