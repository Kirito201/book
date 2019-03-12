package io.hailiang.web.book.controller;

import io.hailiang.web.book.annotation.UserLoginToken;
import io.hailiang.web.book.model.User;
import io.hailiang.web.book.service.UserService;
import io.hailiang.web.book.util.JsonData;
import io.hailiang.web.book.util.JwtUtil;
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
@RequestMapping("/api")
public class LoginController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    @ResponseBody
    public JsonData login(String userName) {
        User user = userService.findUserByUserName(userName);
        String token = JwtUtil.createToken(user);
        Map<String, Object> map = new HashMap<>();
        map.put("user", user);
        map.put("token", token);
        return JsonData.success(map, "登录成功！");


    }


    @GetMapping("/user")
    @ResponseBody
    @UserLoginToken
    public JsonData getUser(int userId) {
        User user = userService.findUserByUserId(userId);
        return JsonData.success(user);
    }

}
