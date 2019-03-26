package io.hailiang.web.book.controller;

import io.hailiang.web.book.annotation.LoginRequired;
import io.hailiang.web.book.common.DataGridDataSource;
import io.hailiang.web.book.common.PageBean;
import io.hailiang.web.book.model.User;
import io.hailiang.web.book.service.MailService;
import io.hailiang.web.book.service.UserService;
import io.hailiang.web.book.common.JsonData;
import io.hailiang.web.book.service.VaptchaCheckService;
import io.hailiang.web.book.util.Md5Util;
import io.hailiang.web.book.util.PasswordCreateUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    @Resource
    private VaptchaCheckService vaptchaCheckService;


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
                          @RequestParam(value = "userPassword") String userPassword,
                          @RequestParam(value = "vaptchaToken") String vaptchaToken,
                          HttpServletRequest request,
                          HttpSession session) throws Exception {

        if (StringUtils.isEmpty(userName)) {
            return JsonData.fail("用户名不能为空！");
        }
        if (StringUtils.isEmpty(userPassword)) {
            return JsonData.fail("密码不能为空！");
        }
        if (StringUtils.isEmpty(vaptchaToken)) {
            return JsonData.fail("请进行人机验证！");
        }
        User user = userService.findUserByUserName(userName);
        if (user == null) {
            return JsonData.fail("用户不存在！");
        }
        if (user.getUserState() == 0) {
            return JsonData.fail("账号已被禁用！请联系管理员！");
        }
        if (!vaptchaCheckService.vaptchaCheck(vaptchaToken, request.getRemoteHost())) {
            return JsonData.fail("人机验证失败！");
        }
        if (Md5Util.md5(userPassword, Md5Util.SALT).equals(user.getUserPassword())) {
            session.setAttribute("user", user);
            return JsonData.success();
        } else {
            return JsonData.fail("用户名或密码错误！");
        }
    }


    /**
     * @param session
     * @return : io.hailiang.web.book.common.JsonData
     * @author: luhailiang
     * @date: 2019-03-26 21:27
     * @description: 获取当前登录用户信息
     */
    @GetMapping("/getCurrentUser")
    @LoginRequired
    public JsonData getCurrentUserById(HttpSession session) {
        User currentUser = (User) session.getAttribute("user");
        User user = userService.findUserByUserId(currentUser.getUserId());
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
    @LoginRequired
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
    @LoginRequired
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
    @LoginRequired
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
    @LoginRequired
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
    @LoginRequired
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
    @LoginRequired
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
    @LoginRequired
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
