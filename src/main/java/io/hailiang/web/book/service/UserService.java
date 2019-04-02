package io.hailiang.web.book.service;

import io.hailiang.web.book.model.User;

import java.util.List;
import java.util.Map;

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


    /**
     * @param map
     * @return : java.util.List<io.hailiang.web.book.model.User>
     * @author: luhailiang
     * @date: 2019-03-14 16:28
     * @description: 查询用户列表
     */
    public List<User> selectUserList(Map<String, Object> map);


    /**
     * @param map
     * @return : int
     * @author: luhailiang
     * @date: 2019-03-15 17:14
     * @description: 查询用户总数
     */
    public int getTotalUser(Map<String, Object> map);

    /**
     * @param map
     * @return : int
     * @author: luhailiang
     * @date: 2019-03-29 22:19
     * @description: 为用户分配角色
     */
    public int insertUserRoles(Map<String, Object> map);
}
