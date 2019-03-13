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


    /**
     * @param user
     * @return : void
     * @author: luhailiang
     * @date: 2019-03-13 17:10
     * @description: 新增用户
     */
    public int saveUser(User user);

    /**
     * @param user
     * @return : void
     * @author: luhailiang
     * @date: 2019-03-13 17:15
     * @description: 更新用户
     */
    public int updateUser(User user);

    /**
     * @param userId
     * @return : void
     * @author: luhailiang
     * @date: 2019-03-13 17:15
     * @description: 根据id删除用户
     */
    public int deleteUser(Integer userId);
}
