package io.hailiang.web.book.controller;

import io.hailiang.web.book.annotation.LoginRequired;
import io.hailiang.web.book.util.CookieUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;


/**
 * @Auther: luhailiang
 * @Date: 2019-03-12 14:46
 * @Description:
 */
@Controller
public class AdminController {

    @GetMapping("/")
    public String login() {
        return "redirect:login.jsp";
    }

    @GetMapping("/admin/index")
    @LoginRequired
    public String admin(HttpServletRequest request) {
        return "admin";
    }

    @GetMapping("/admin/user")
    @LoginRequired
    public String adminUser(HttpServletRequest request) {
        return "user";
    }


}
