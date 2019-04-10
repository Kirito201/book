package io.hailiang.web.book.dao;


import io.hailiang.web.book.model.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(Role record);

    int countByRoleName(@Param("roleName") String roleName, @Param("roleId") Integer roleId);

    void deleteRoleUserRsByUserId(Long userId);

    void deleteRoleUserRsByRoleId(Integer roleId);

    List<Role> selectRoleList(Map<String, Object> map);

    int getTotalRole(Map<String, Object> map);

    List<Role> findByUserId(Long userId);

    int insertRolePermissions(Map<String, Object> map);
}