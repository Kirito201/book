package io.hailiang.web.book.controller;

import io.hailiang.web.book.annotation.LoginRequired;
import io.hailiang.web.book.common.JsonData;
import io.hailiang.web.book.model.BookInfo;
import io.hailiang.web.book.model.LendReturnList;
import io.hailiang.web.book.service.BookInfoService;
import io.hailiang.web.book.service.ReturnBookService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.text.ParseException;
import java.util.List;

/**
 * @Auther: luhailiang
 * @Date: 2019-04-18 21:32
 * @Description:
 */
@RestController
@RequestMapping("/book")
public class ReturnBookController {

    @Resource
    private ReturnBookService returnBookService;

    @Resource
    private BookInfoService bookInfoService;


    /**
     * @param bookId
     * @return : io.hailiang.web.book.common.JsonData
     * @author: luhailiang
     * @date: 2019-04-18 22:17
     * @description: 根据图书id查询图书及借阅者信息
     */
    @PostMapping("/bookInfoAndUserByBookId")
    @LoginRequired
    public JsonData selectBookInfoAndUserByBookId(Integer bookId) throws ParseException {

        List<LendReturnList> lendReturnLists = returnBookService.selectBookInfoAndUserByBookId(bookId);
        if (lendReturnLists.size() == 0) {
            return JsonData.fail("记录不存在");
        } else {
            return JsonData.success(lendReturnLists);
        }
    }


    /**
     * @param lendReturnList
     * @return : io.hailiang.web.book.common.JsonData
     * @author: luhailiang
     * @date: 2019-04-18 22:17
     * @description: 还书   超期罚款||损毁罚款  未完成
     */
    @PostMapping("/returnBook")
    @LoginRequired
    public JsonData returnBook(LendReturnList lendReturnList) throws ParseException {
        int i = returnBookService.returnBook(lendReturnList);
        //更新图书状态为正常
        BookInfo bookInfo = BookInfo.builder()
                .bookId(lendReturnList.getBookId())
                .bookState(0).build();
        bookInfoService.updateBookInfo(bookInfo);
        if (i > 0) {
            return JsonData.success(i, "还书成功");
        } else {
            return JsonData.fail("还书失败");
        }
    }
}
