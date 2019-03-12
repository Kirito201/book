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

    @Override
    public User findUserByUserId(Integer userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    @Override
    public User findUserByUserName(String userName) {
        return userMapper.selectByUserName(userName);
    }
}
