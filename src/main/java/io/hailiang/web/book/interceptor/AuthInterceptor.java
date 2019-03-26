package io.hailiang.web.book.interceptor;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import io.hailiang.web.book.model.Permission;
import io.hailiang.web.book.service.PermissionService;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AuthInterceptor extends HandlerInterceptorAdapter {

    @Resource
    private PermissionService permissionService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // 获取用户的请求地址
        String uri = request.getRequestURI();
//		String path = request.getSession().getServletContext().getContextPath();

        // 判断当前路径是否需要进行权限验证。
        // 查询所有需要验证的路径集合
        List<Permission> permissions = permissionService.queryAll();
        Set<String> uriSet = new HashSet<>();
        for (Permission permission : permissions) {
            if (permission.getPermissionUrl() != null && !"".equals(permission.getPermissionUrl())) {
                uriSet.add(permission.getPermissionUrl());
            }
        }

        if (uriSet.contains(uri)) {
            // 权限验证
            // 判断当前用户是否拥有对应的权限
            Set<String> authUriSet = (Set<String>) request.getSession().getAttribute("authUriSet");
            if (authUriSet.contains(uri)) {
                return true;
            } else {
                response.sendRedirect("/403.jsp");
                return false;
            }
        } else {
            return true;
        }
    }

}
