package io.hailiang.web.book.service;

import io.hailiang.web.book.model.User;

/**
 * @Auther: luhailiang
 * @Date: 2019-03-12 16:55
 * @Description: UserService
 */
public interface UserService {

    public User findUserByUserId(Integer userId);

    public User findUserByUserName(String userName);
}
