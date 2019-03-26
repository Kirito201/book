package io.hailiang.web.book.service;

import io.hailiang.web.book.model.Permission;
import io.hailiang.web.book.model.User;

import java.util.List;

/**
 * @Auther: luhailiang
 * @Date: 2019-03-26 23:03
 * @Description: PermissionService
 */
public interface PermissionService {

    /**
     * @param user
     * @return : java.util.List<io.hailiang.web.book.model.Permission>
     * @author: luhailiang
     * @date: 2019-03-26 23:04
     * @description: 获取用户权限信息
     */
    List<Permission> queryPermissionsByUser(User user);

    /**
     * @return : java.util.List<io.hailiang.web.book.model.Permission>
     * @author: luhailiang
     * @date: 2019-03-26 23:29
     * @description: 获取所有权限列表
     */
    List<Permission> queryAll();
}
