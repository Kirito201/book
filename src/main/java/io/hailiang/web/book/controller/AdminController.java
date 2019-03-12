package io.hailiang.web.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Auther: luhailiang
 * @Date: 2019-03-12 14:46
 * @Description:
 */
@Controller
public class AdminController {

    @RequestMapping("/")
    public String login() {
        return "redirect:login.jsp";
    }

    @RequestMapping("/admin/index")
    public String admin() {
        return "admin";
    }


}
