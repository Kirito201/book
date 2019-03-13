package io.hailiang.web.book.service;

import io.hailiang.web.book.model.User;

/**
 * @Auther: luhailiang
 * @Date: 2019-03-12 16:55
 * @Description: UserService
 */
public interface UserService {

    /**
     * @param userId
     * @return : io.hailiang.web.book.model.User
     * @author: luhailiang
     * @date: 2019-03-13 07:54
     * @description: 根据用户id查询用户
     */
    public User findUserByUserId(Integer userId);


    /**
     * @param userName
     * @return : io.hailiang.web.book.model.User
     * @author: luhailiang
     * @date: 2019-03-13 07:55
     * @description: 根据用户名查询用户
     */
    public User findUserByUserName(String userName);
}
