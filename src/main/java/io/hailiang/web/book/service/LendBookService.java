package io.hailiang.web.book.service;

import io.hailiang.web.book.model.LendReturnList;

import java.text.ParseException;

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
}
