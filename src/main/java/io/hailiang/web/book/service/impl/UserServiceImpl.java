package io.hailiang.web.book.service.impl;

import com.google.common.base.Preconditions;
import io.hailiang.web.book.dao.UserMapper;
import io.hailiang.web.book.exception.ParamException;
import io.hailiang.web.book.model.User;
import io.hailiang.web.book.service.UserService;
import io.hailiang.web.book.util.Md5Util;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Auther: luhailiang
 * @Date: 2019-03-12 16:56
 * @Description: UserServiceImpl
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

    /**
     * @param user
     * @return : void
     * @author: luhailiang
     * @date: 2019-03-13 17:10
     * @description: 新增用户
     */
    @Override
    public int saveUser(User user) {
        if (checkUserNameExist(user.getUserName(), user.getUserId())) {
            throw new ParamException("用户名已被占用");
        }
        if (checkUserEmailExist(user.getUserEmail(), user.getUserId())) {
            throw new ParamException("邮箱已被占用");
        }
        if (checkUserPhoneExist(user.getUserPhone(), user.getUserId())) {
            throw new ParamException("手机号已被占用");
        }
        User users = User.builder()
                .userName(user.getUserName())
                .userPassword(Md5Util.md5(user.getUserPassword(), Md5Util.SALT))
                .userEmail(user.getUserEmail())
                .userPhone(user.getUserPhone())
                .build();
        int count = userMapper.insertSelective(users);
        return count;

    }

    /**
     * @param user
     * @return : void
     * @author: luhailiang
     * @date: 2019-03-13 17:15
     * @description: 更新用户
     */
    @Override
    public int updateUser(User user) {
        if (checkUserNameExist(user.getUserName(), user.getUserId())) {
            throw new ParamException("用户名已被占用");
        }
        if (checkUserEmailExist(user.getUserEmail(), user.getUserId())) {
            throw new ParamException("邮箱已被占用");
        }
        if (checkUserPhoneExist(user.getUserPhone(), user.getUserId())) {
            throw new ParamException("手机号已被占用");
        }
        User before = userMapper.selectByPrimaryKey(user.getUserId());
        Preconditions.checkNotNull(before, "需更新的用户不存在");
        User after = User.builder()
                .userId(user.getUserId())
                .userName(user.getUserName())
                .userPassword(Md5Util.md5(user.getUserPassword(), Md5Util.SALT))
                .userEmail(user.getUserEmail())
                .userPhone(user.getUserPhone())
                .userState(user.getUserState())
                .build();
        int count = userMapper.updateByPrimaryKeySelective(after);
        return count;
    }

    /**
     * @param userEmail
     * @param userId
     * @return : boolean
     * @author: luhailiang
     * @date: 2019-03-18 21:53
     * @description: check邮箱是否存在
     */
    public boolean checkUserEmailExist(String userEmail, Integer userId) {
        return userMapper.countByMail(userEmail, userId) > 0;

    }

    /**
     * @param userPhone
     * @param userId
     * @return : boolean
     * @author: luhailiang
     * @date: 2019-03-18 21:53
     * @description: check手机号是否存在
     */
    public boolean checkUserPhoneExist(String userPhone, Integer userId) {
        return userMapper.countByPhone(userPhone, userId) > 0;
    }

    /**
     * @param userName
     * @param userId
     * @return : boolean
     * @author: luhailiang
     * @date: 2019-03-18 21:54
     * @description: check用户名是否存在
     */
    public boolean checkUserNameExist(String userName, Integer userId) {
        return userMapper.countByName(userName, userId) > 0;
    }

    /**
     * @param userId
     * @return : void
     * @author: luhailiang
     * @date: 2019-03-13 17:15
     * @description: 根据id删除用户
     */
    @Override
    public int deleteUser(Integer userId) {

        User user = userMapper.selectByPrimaryKey(userId);
        Preconditions.checkNotNull(user, "需删除的用户不存在");
        int count = userMapper.deleteByPrimaryKey(userId);
        return count;

    }

    /**
     * @param map
     * @return : java.util.List<io.hailiang.web.book.model.User>
     * @author: luhailiang
     * @date: 2019-03-14 16:28
     * @description: 查询用户列表
     */
    @Override
    public List<User> selectUserList(Map<String, Object> map) {
        return userMapper.selectUserList(map);
    }

    /**
     * @param map
     * @return : int
     * @author: luhailiang
     * @date: 2019-03-15 17:14
     * @description: 查询用户总数
     */
    @Override
    public int getTotalUser(Map<String, Object> map) {
        return userMapper.getTotalUser(map);
    }

    /**
     * @param map
     * @return : int
     * @author: luhailiang
     * @date: 2019-03-29 22:19
     * @description: 为用户分配角色
     */
    @Override
    public int insertUserRoles(Map<String, Object> map) {
        return userMapper.insertUserRoles(map);
    }


}
