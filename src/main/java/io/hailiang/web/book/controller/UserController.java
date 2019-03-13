package io.hailiang.web.book.controller;

import io.hailiang.web.book.annotation.UserLoginToken;
import io.hailiang.web.book.model.User;
import io.hailiang.web.book.service.UserService;
import io.hailiang.web.book.util.JsonData;
import io.hailiang.web.book.util.JwtUtil;
import io.hailiang.web.book.util.Md5Util;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @Auther: luhailiang
 * @Date: 2019-03-12 17:07
 * @Description: UserController
 */
@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private UserService userService;


    /**
     * @param userName
     * @param userPassword
     * @return : io.hailiang.web.book.util.JsonData
     * @author: luhailiang
     * @date: 2019-03-13 07:59
     * @description: 用户登录
     */
    @PostMapping("/login")
    public JsonData login(String userName, String userPassword) {

        if (StringUtils.isEmpty(userName)) {
            return JsonData.fail("用户名不能为空！");
        }
        if (StringUtils.isEmpty(userPassword)) {
            return JsonData.fail("密码不能为空！");
        }
        User user = userService.findUserByUserName(userName);
        if (user == null) {
            return JsonData.fail("用户不存在！");
        }
        if (user.getUserState() == 0) {
            return JsonData.fail("账号已被停用！请联系管理员！");
        }
        Map<String, Object> map = new HashMap<>();
        if (Md5Util.md5(userPassword, Md5Util.SALT).equals(user.getUserPassword())) {
            String token = JwtUtil.createToken(user);
            map.put("token", token);
            return JsonData.success(map, "登录成功！");
        } else {
            return JsonData.fail("用户名或密码错误！");
        }
    }


    /**
     * @param token
     * @return : io.hailiang.web.book.util.JsonData
     * @author: luhailiang
     * @date: 2019-03-13 08:00
     * @description: 根据token查询当前用户
     */
    @GetMapping("/getCurrentUser")
    @UserLoginToken
    public JsonData getCurrentUserByUserId(String token) {
        String userId = JwtUtil.getUserId(token);
        User user = userService.findUserByUserId(Integer.parseInt(userId));
        user.setUserPassword(null);
        return JsonData.success(user);
    }


    /**
     * @param user
     * @return : io.hailiang.web.book.util.JsonData
     * @author: luhailiang
     * @date: 2019-03-13 18:21
     * @description: 新增用户
     */
    @PostMapping("/save")
    @UserLoginToken
    public JsonData saveUser(User user) {
        int count = userService.saveUser(user);
        if (count > 0) {
            return JsonData.success(count, "添加成功");
        } else {
            return JsonData.fail("添加失败");
        }

    }


    /**
     * @param user
     * @return : io.hailiang.web.book.util.JsonData
     * @author: luhailiang
     * @date: 2019-03-13 18:21
     * @description: 更新用户
     */
    @PutMapping("/update")
    @UserLoginToken
    public JsonData updateUser(User user) {
        int count = userService.updateUser(user);
        if (count > 0) {
            return JsonData.success(count, "更新成功");
        } else {
            return JsonData.fail("更新失败");
        }

    }

    /**
     * @param userId
     * @return : io.hailiang.web.book.util.JsonData
     * @author: luhailiang
     * @date: 2019-03-13 18:21
     * @description: 根据id删除用户
     */
    @DeleteMapping("/delete")
    @UserLoginToken
    public JsonData deleteUser(Integer userId) {
        int count = userService.deleteUser(userId);
        if (count > 0) {
            return JsonData.success(count, "删除成功");
        } else {
            return JsonData.fail("删除失败");
        }

    }
}
