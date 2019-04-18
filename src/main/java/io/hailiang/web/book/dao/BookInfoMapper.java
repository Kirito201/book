package io.hailiang.web.book.dao;


import io.hailiang.web.book.model.BookInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BookInfoMapper {
    int deleteByPrimaryKey(Integer bookId);

    int insertSelective(BookInfo record);

    BookInfo selectByPrimaryKey(Integer bookId);

    int updateByPrimaryKeySelective(BookInfo record);

    List<BookInfo> selectBookInfoList(Map<String, Object> map);

    int getTotalBook(Map<String, Object> map);

    List<BookInfo> selectBookById(Integer bookId);
}