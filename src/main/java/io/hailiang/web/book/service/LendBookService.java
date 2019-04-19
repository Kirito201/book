package io.hailiang.web.book.service;

import io.hailiang.web.book.model.LendReturnList;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

/**
 * @Auther: luhailiang
 * @Date: 2019-04-17 13:32
 * @Description:
 */
public interface LendBookService {

    /**
     * @param lendReturnList
     * @return : int
     * @author: luhailiang
     * @date: 2019-04-17 14:15
     * @description: 借书
     */
    int lendBook(LendReturnList lendReturnList) throws ParseException;


    /**
     * @param map
     * @return : java.util.List<io.hailiang.web.book.model.LendReturnList>
     * @author: luhailiang
     * @date: 2019-04-19 15:39
     * @description: 根据用户ID查询借还记录
     */
    List<LendReturnList> selectLendReturnRecordByUserId(Map<String, Object> map) throws ParseException;

    /**
     * @param map
     * @return : int
     * @author: luhailiang
     * @date: 2019-04-19 16:29
     * @description: 根据用户ID查询借还记录总数
     */
    int getTotalRecord(Map<String, Object> map);
}