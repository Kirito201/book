package io.hailiang.web.book.service.impl;

import io.hailiang.web.book.dao.LendReturnListMapper;
import io.hailiang.web.book.model.LendReturnList;
import io.hailiang.web.book.service.LendBookService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @Auther: luhailiang
 * @Date: 2019-04-17 13:33
 * @Description:
 */
@Service("lendBookService")
public class LendBookServiceImpl implements LendBookService {

    @Resource
    private LendReturnListMapper lendReturnListMapper;

    /**
     * @param lendReturnList
     * @return : int
     * @author: luhailiang
     * @date: 2019-04-17 14:15
     * @description: 借书
     */
    @Override
    public int lendBook(LendReturnList lendReturnList) throws ParseException {
        Date d = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String currdate = format.format(d);
        //借出日期
        Date lendDate = format.parse(currdate);
        Calendar ca = Calendar.getInstance();
        ca.add(Calendar.DATE, lendReturnList.getShouldLendDays());// num为增加的天数，可以改变的
        d = ca.getTime();
        String enddate = format.format(d);
        //根据应借天数计算应还时间
        Date shouldReturnDate = format.parse(enddate);
        LendReturnList list = LendReturnList.builder()
                .bookId(lendReturnList.getBookId())
                .userId(lendReturnList.getUserId())
                .lendDate(lendDate)
                .shouldLendDays(lendReturnList.getShouldLendDays())
                .shouldReturnDate(shouldReturnDate).build();
        return lendReturnListMapper.insertSelective(list);
    }
}
