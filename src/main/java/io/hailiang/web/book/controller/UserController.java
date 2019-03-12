package io.hailiang.web.book.controller;

import io.hailiang.web.book.annotation.UserLoginToken;
import io.hailiang.web.book.model.User;
import io.hailiang.web.book.service.UserService;
import io.hailiang.web.book.util.JsonData;
import io.hailiang.web.book.util.JwtUtil;
import io.hailiang.web.book.util.Md5Util;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @Auther: luhailiang
 * @Date: 2019-03-12 17:07
 * @Description:
 */
@Controller
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    @ResponseBody
    public JsonData login(String userName, String userPassword) {

        if (StringUtils.isEmpty(userName)) {
            return JsonData.fail("用户名不能为空！");
        }
        if (StringUtils.isEmpty(userPassword)) {
            return JsonData.fail("密码不能为空！");
        }
        User user = userService.findUserByUserName(userName);
        if (user==null){
            return JsonData.fail("用户不存在！");
        }
        if (user.getUserState() == 0) {
            return JsonData.fail("账号已被停用！请联系管理员！");
        }
        Map<String, Object> map = new HashMap<>();
        if (Md5Util.md5(userPassword, Md5Util.SALT).equals(user.getUserPassword())) {
            String token = JwtUtil.createToken(user);
            user.setUserPassword(null);
            map.put("user", user);
            map.put("token", token);
            return JsonData.success(map, "登录成功！");
        } else {
            return JsonData.fail("用户名或密码错误！");
        }
    }


}
