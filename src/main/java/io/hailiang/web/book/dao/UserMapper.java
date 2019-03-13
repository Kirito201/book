package io.hailiang.web.book.dao;


import io.hailiang.web.book.model.User;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);


    User selectByUserName(String userName);
}