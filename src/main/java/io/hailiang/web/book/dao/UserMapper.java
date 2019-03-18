package io.hailiang.web.book.dao;


import io.hailiang.web.book.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


@Mapper
public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);


    User selectByUserName(String userName);

    List<User> selectUserList(Map<String, Object> map);

    int getTotalUser(Map<String, Object> map);

    int countByMail(@Param("userEmail") String userEmail, @Param("userId") Integer userId);

    int countByPhone(@Param("userPhone") String userPhone, @Param("userId") Integer userId);

    int countByName(@Param("userName") String userName, @Param("userId") Integer userId);
}