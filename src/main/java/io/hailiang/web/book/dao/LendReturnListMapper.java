package io.hailiang.web.book.dao;


import io.hailiang.web.book.model.LendReturnList;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface LendReturnListMapper {
    int deleteByPrimaryKey(Integer lendReturnId);

    int insert(LendReturnList record);

    int insertSelective(LendReturnList record);

    LendReturnList selectByPrimaryKey(Integer lendReturnId);

    int updateByPrimaryKeySelective(LendReturnList record);

    int updateByPrimaryKey(LendReturnList record);

    List<LendReturnList> selectBookInfoAndUserByBookId(Integer bookId);

    List<LendReturnList> selectLendReturnRecordByUserId(Map<String, Object> map);

    int getTotalRecord(Map<String, Object> map);
}