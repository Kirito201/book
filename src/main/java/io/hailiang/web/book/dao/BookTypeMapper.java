package io.hailiang.web.book.dao;


import io.hailiang.web.book.model.BookType;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BookTypeMapper {
    int deleteByPrimaryKey(Integer bookTypeId);


    int insertSelective(BookType record);

    BookType selectByPrimaryKey(Integer bookTypeId);

    int updateByPrimaryKeySelective(BookType record);


    List<BookType> queryAllBookType();

    List<BookType> selectBookTypeListByBookTypeId(Integer bookTypeId);

    int countByBookTypeName(@Param("bookTypeName") String bookTypeName, @Param("bookTypeId") Integer bookTypeId);
}