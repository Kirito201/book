package io.hailiang.web.book.service.impl;

import com.google.common.base.Preconditions;
import io.hailiang.web.book.dao.BookInfoMapper;
import io.hailiang.web.book.model.BookInfo;
import io.hailiang.web.book.service.BookInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Auther: luhailiang
 * @Date: 2019-04-15 13:52
 * @Description: BookInfoServiceImpl
 */
@Service("bookInfoService")
public class BookInfoServiceImpl implements BookInfoService {

    @Resource
    private BookInfoMapper bookInfoMapper;

    /**
     * @param bookInfo
     * @return : int
     * @author: luhailiang
     * @date: 2019-04-15 13:54
     * @description: 新增图书
     */
    @Override
    public int saveBookInfo(BookInfo bookInfo) {
        BookInfo bookInfos = BookInfo.builder().bookIsbn(bookInfo.getBookIsbn())
                .bookName(bookInfo.getBookName())
                .bookAuthor(bookInfo.getBookAuthor())
                .bookPublish(bookInfo.getBookPublish())
                .bookPrice(bookInfo.getBookPrice())
                .bookState(bookInfo.getBookState())
                .bookType(bookInfo.getBookType())
                .bookShelf(bookInfo.getBookShelf())
                .bookIntroduction(bookInfo.getBookIntroduction()).build();
        return bookInfoMapper.insertSelective(bookInfos);
    }

    /**
     * @param bookInfo
     * @return : int
     * @author: luhailiang
     * @date: 2019-04-15 13:55
     * @description: 编辑图书
     */
    @Override
    public int updateBookInfo(BookInfo bookInfo) {

        BookInfo before = bookInfoMapper.selectByPrimaryKey(bookInfo.getBookId());
        Preconditions.checkNotNull(before, "需更新的图书不存在");
        BookInfo after = BookInfo.builder().bookId(bookInfo.getBookId())
                .bookIsbn(bookInfo.getBookIsbn())
                .bookName(bookInfo.getBookName())
                .bookAuthor(bookInfo.getBookAuthor())
                .bookPublish(bookInfo.getBookPublish())
                .bookPrice(bookInfo.getBookPrice())
                .bookState(bookInfo.getBookState())
                .bookType(bookInfo.getBookType())
                .bookShelf(bookInfo.getBookShelf())
                .bookIntroduction(bookInfo.getBookIntroduction()).build();
        return bookInfoMapper.updateByPrimaryKeySelective(after);
    }

    /**
     * @param bookId
     * @return : int
     * @author: luhailiang
     * @date: 2019-04-15 13:56
     * @description: 删除图书
     */
    @Override
    public int deleteBookInfo(Integer bookId) {
        BookInfo before = bookInfoMapper.selectByPrimaryKey(bookId);
        Preconditions.checkNotNull(before, "需删除的图书不存在");
        return bookInfoMapper.deleteByPrimaryKey(bookId);
    }

    /**
     * @param map
     * @return : java.util.List<io.hailiang.web.book.model.BookInfo>
     * @author: luhailiang
     * @date: 2019-04-15 15:53
     * @description: 查询图书列表
     */
    @Override
    public List<BookInfo> selectBookInfoList(Map<String, Object> map) {
        return bookInfoMapper.selectBookInfoList(map);
    }

    /**
     * @param map
     * @return : int
     * @author: luhailiang
     * @date: 2019-04-15 16:03
     * @description: 查询图书列表总数
     */
    @Override
    public int getTotalBook(Map<String, Object> map) {
        return bookInfoMapper.getTotalBook(map);
    }

    /**
     * @param bookId
     * @return : java.util.List<io.hailiang.web.book.model.BookInfo>
     * @author: luhailiang
     * @date: 2019-04-16 19:11
     * @description: 根据id查询图书
     */
    @Override
    public List<BookInfo> selectBookById(Integer bookId) {
        return bookInfoMapper.selectBookById(bookId);
    }

    /**
     * @param bookId
     * @return : io.hailiang.web.book.model.BookInfo
     * @author: luhailiang
     * @date: 2019-04-17 15:22
     * @description: 根据id查询图书
     */
    @Override
    public BookInfo selectBookInfoById(Integer bookId) {
        BookInfo before = bookInfoMapper.selectByPrimaryKey(bookId);
        Preconditions.checkNotNull(before, "图书不存在");
        return bookInfoMapper.selectByPrimaryKey(bookId);
    }


}
