package io.hailiang.web.book.controller;

import io.hailiang.web.book.annotation.UserLoginToken;
import io.hailiang.web.book.common.DataGridDataSource;
import io.hailiang.web.book.common.PageBean;
import io.hailiang.web.book.model.User;
import io.hailiang.web.book.service.MailService;
import io.hailiang.web.book.service.UserService;
import io.hailiang.web.book.common.JsonData;
import io.hailiang.web.book.util.JwtUtil;
import io.hailiang.web.book.util.Md5Util;
import io.hailiang.web.book.util.PasswordCreateUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: luhailiang
 * @Date: 2019-03-12 17:07
 * @Description: UserController
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private MailService mailService;


    /**
     * @param userName
     * @param userPassword
     * @return : io.hailiang.web.book.common.JsonData
     * @author: luhailiang
     * @date: 2019-03-13 07:59
     * @description: 用户登录
     */
    @PostMapping("/login")
    public JsonData login(@RequestParam(value = "userName") String userName,
                          @RequestParam(value = "userPassword") String userPassword) {

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
            return JsonData.fail("账号已被禁用！请联系管理员！");
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
     * @return : io.hailiang.web.book.common.JsonData
     * @author: luhailiang
     * @date: 2019-03-13 08:00
     * @description: 根据token查询当前用户
     */
    @GetMapping("/getCurrentUser")
    @UserLoginToken
    public JsonData getCurrentUserByUserId(@RequestParam(value = "token") String token) {
        if (StringUtils.isEmpty(token)) {
            return JsonData.fail("token不能为空");
        }
        String userId = JwtUtil.getUserId(token);
        User user = userService.findUserByUserId(Integer.parseInt(userId));
        user.setUserPassword(null);
        return JsonData.success(user);
    }


    /**
     * @param user
     * @return : io.hailiang.web.book.common.JsonData
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
     * @return : io.hailiang.web.book.common.JsonData
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
     * @return : io.hailiang.web.book.common.JsonData
     * @author: luhailiang
     * @date: 2019-03-13 18:21
     * @description: 根据id删除用户
     */
    @DeleteMapping("/delete")
    @UserLoginToken
    public JsonData deleteUser(@RequestParam(value = "userId") Integer userId) {
        int count = userService.deleteUser(userId);
        if (count > 0) {
            return JsonData.success(count, "删除成功");
        } else {
            return JsonData.fail("删除失败");
        }
    }


    /**
     * @param toMail
     * @param userId
     * @return : io.hailiang.web.book.common.JsonData
     * @author: luhailiang
     * @date: 2019-03-13 21:55
     * @description: 重置用户密码并发送邮件
     */
    @PostMapping("/sendMail")
    @UserLoginToken
    public JsonData sendMail(@RequestParam(value = "toMail") String toMail,
                             @RequestParam(value = "userId") Integer userId) {
        if (StringUtils.isEmpty(toMail)) {
            return JsonData.fail("用户邮箱不能为空");
        }
        //TODO 随机生成密码
        String defaultPassword = PasswordCreateUtil.createPassWord(8);
        User user = new User();
        user.setUserId(userId);
        user.setUserPassword(defaultPassword);
        int count = userService.updateUser(user);
        if (count > 0) {
            mailService.sendSimpleMail(toMail, "重置密码", "您的初始密码为：" + defaultPassword);
            return JsonData.success(count, "重置密码成功");
        } else {
            return JsonData.fail("重置密码失败");
        }
    }


    /**
     * @param userId
     * @return : io.hailiang.web.book.common.JsonData
     * @author: luhailiang
     * @date: 2019-03-13 22:23
     * @description: 根据用户id禁用用户
     */
    @PostMapping("/disable")
    @UserLoginToken
    public JsonData disable(@RequestParam(value = "userId") Integer userId) {
        User user = new User();
        user.setUserId(userId);
        user.setUserState(0);
        int count = userService.updateUser(user);
        if (count > 0) {
            return JsonData.success(count, "禁用成功");
        } else {
            return JsonData.fail("禁用失败");
        }
    }

    /**
     * @param userId
     * @return : io.hailiang.web.book.common.JsonData
     * @author: luhailiang
     * @date: 2019-03-13 22:27
     * @description: 根据id启用用户
     */
    @PostMapping("/enable")
    @UserLoginToken
    public JsonData enable(@RequestParam(value = "userId") Integer userId) {
        User user = new User();
        user.setUserId(userId);
        user.setUserState(1);
        int count = userService.updateUser(user);
        if (count > 0) {
            return JsonData.success(count, "启用成功");
        } else {
            return JsonData.fail("启用失败");
        }
    }


    /**
     * @param userName
     * @param page
     * @param rows
     * @return : io.hailiang.web.book.common.JsonData
     * @author: luhailiang
     * @date: 2019-03-14 18:30
     * @description: 带条件服务端分页查询用户列表
     */
    @PostMapping("/list")
    public DataGridDataSource<User> getUserList(@RequestParam(value = "userName", required = false, defaultValue = "") String userName,
                                                @RequestParam(value = "userEmail", required = false, defaultValue = "") String userEmail,
                                                @RequestParam(value = "userPhone", required = false, defaultValue = "") String userPhone,
                                                @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                                @RequestParam(value = "rows", required = false, defaultValue = "5") Integer rows) {

        PageBean pageBean = new PageBean(page, rows);
        Map<String, Object> map = new HashMap<>();
        map.put("userName", "%" + userName + "%");
        map.put("userEmail", "%" + userEmail + "%");
        map.put("userPhone", "%" + userPhone + "%");
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<User> userList = userService.selectUserList(map);
        int totalUser = userService.getTotalUser(map);
        DataGridDataSource<User> dataGridDataSource = new DataGridDataSource<>();
        dataGridDataSource.setTotal(totalUser);
        dataGridDataSource.setRows(userList);
        return dataGridDataSource;
    }

}
