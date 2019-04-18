package io.hailiang.web.book.service;

import io.hailiang.web.book.model.BookInfo;

import java.util.List;
import java.util.Map;

/**
 * @Auther: luhailiang
 * @Date: 2019-04-15 13:52
 * @Description: BookInfoService
 */
public interface BookInfoService {


    /**
     * @param bookInfo
     * @return : int
     * @author: luhailiang
     * @date: 2019-04-15 13:54
     * @description: 新增图书
     */
    int saveBookInfo(BookInfo bookInfo);

    /**
     * @param bookInfo
     * @return : int
     * @author: luhailiang
     * @date: 2019-04-15 13:55
     * @description: 编辑图书
     */
    int updateBookInfo(BookInfo bookInfo);


    /**
     * @param bookId
     * @return : int
     * @author: luhailiang
     * @date: 2019-04-15 13:56
     * @description: 删除图书
     */
    int deleteBookInfo(Integer bookId);


    /**
     * @param map
     * @return : java.util.List<io.hailiang.web.book.model.BookInfo>
     * @author: luhailiang
     * @date: 2019-04-15 15:53
     * @description: 查询图书列表
     */
    List<BookInfo> selectBookInfoList(Map<String, Object> map);

    /**
     * @param map
     * @return : int
     * @author: luhailiang
     * @date: 2019-04-15 16:03
     * @description: 查询图书列表总数
     */
    int getTotalBook(Map<String, Object> map);

    /**
     * @param bookId
     * @return : java.util.List<io.hailiang.web.book.model.BookInfo>
     * @author: luhailiang
     * @date: 2019-04-16 19:11
     * @description: 根据id查询图书
     */
    List<BookInfo> selectBookById(Integer bookId);


    /**
     * @param bookId
     * @return : io.hailiang.web.book.model.BookInfo
     * @author: luhailiang
     * @date: 2019-04-17 15:22
     * @description: 根据id查询图书
     */
    BookInfo selectBookInfoById(Integer bookId);

}
