package io.hailiang.web.book.controller;

import io.hailiang.web.book.annotation.LoginRequired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;


/**
 * @Auther: luhailiang
 * @Date: 2019-03-12 14:46
 * @Description:
 */
@Controller
public class AdminDispatcherController {

    @GetMapping("/")
    public String login() {
        return "redirect:login.jsp";
    }

    @GetMapping("/logout")
    @LoginRequired
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:login.jsp";
    }

    @GetMapping("/admin/index")
    @LoginRequired
    public String admin() {
        return "admin/index";
    }

    @GetMapping("/admin/user")
    @LoginRequired
    public String adminUser() {
        return "admin/user";
    }

    @GetMapping("/admin/role")
    @LoginRequired
    public String adminRole() {
        return "admin/role";
    }

    @GetMapping("/admin/permission")
    @LoginRequired
    public String adminPermission() {
        return "admin/permission";
    }

    @GetMapping("/admin/booktype")
    @LoginRequired
    public String adminBookType() {
        return "admin/booktype";
    }

    @GetMapping("/admin/bookinfo")
    @LoginRequired
    public String adminBookInfo() {
        return "admin/bookinfo";
    }

    @GetMapping("/admin/booklend")
    @LoginRequired
    public String adminBookLend() {
        return "admin/booklend";
    }

    @GetMapping("/admin/bookreturn")
    @LoginRequired
    public String adminBookReturn() {
        return "admin/bookreturn";
    }

    @GetMapping("/admin/booksearch")
    @LoginRequired
    public String adminBookSearch() {
        return "admin/booksearch";
    }

    @GetMapping("/admin/lendrecord")
    @LoginRequired
    public String adminLendRecord() {
        return "admin/lendrecord";
    }

}
