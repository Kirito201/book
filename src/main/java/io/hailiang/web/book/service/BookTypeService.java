package io.hailiang.web.book.service;

import io.hailiang.web.book.model.BookType;

import java.util.List;

/**
 * @Auther: luhailiang
 * @Date: 2019-04-09 17:11
 * @Description: BookTypeService
 */
public interface BookTypeService {

    /**
     * @return : java.util.List<io.hailiang.web.book.model.BookType>
     * @author: luhailiang
     * @date: 2019-04-09 17:15
     * @description: 查询所有图书分类信息
     */
    List<BookType> queryAllBookType();

    /**
     * @param bookTypeId
     * @return : io.hailiang.web.book.model.BookType
     * @author: luhailiang
     * @date: 2019-04-10 10:49
     * @description: 通过id查询图书分类信息
     */
    List<BookType> selectBookTypeListByBookTypeId(Integer bookTypeId);


    /**
     * @param bookType
     * @return : int
     * @author: luhailiang
     * @date: 2019-04-10 13:20
     * @description: 新增分类
     */
    int saveBookType(BookType bookType);


    /**
     * @param bookType
     * @return : int
     * @author: luhailiang
     * @date: 2019-04-10 13:20
     * @description: 修改分类
     */
    int updateBookType(BookType bookType);

    /**
     * @param bookTypeId
     * @return : int
     * @author: luhailiang
     * @date: 2019-04-10 13:21
     * @description: 删除分类
     */
    int deleteBookType(Integer bookTypeId);


}