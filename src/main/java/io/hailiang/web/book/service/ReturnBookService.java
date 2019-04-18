package io.hailiang.web.book.service;

import io.hailiang.web.book.model.LendReturnList;

import java.text.ParseException;
import java.util.List;

/**
 * @Auther: luhailiang
 * @Date: 2019-04-18 21:16
 * @Description:
 */
public interface ReturnBookService {

    /**
     * @param bookId
     * @return : java.util.List<io.hailiang.web.book.model.LendReturnList>
     * @author: luhailiang
     * @date: 2019-04-18 21:19
     * @description: 根据图书id查询图书及借阅者信息
     */
    List<LendReturnList> selectBookInfoAndUserByBookId(Integer bookId) throws ParseException;


    /**
     * @param lendReturnList
     * @return : int
     * @author: luhailiang
     * @date: 2019-04-18 22:05
     * @description: 还书
     */
    int returnBook(LendReturnList lendReturnList) throws ParseException;
}
