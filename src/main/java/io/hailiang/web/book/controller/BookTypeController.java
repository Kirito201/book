package io.hailiang.web.book.controller;

import io.hailiang.web.book.annotation.LoginRequired;
import io.hailiang.web.book.common.DataGridDataSource;
import io.hailiang.web.book.common.JsonData;
import io.hailiang.web.book.model.BookType;
import io.hailiang.web.book.service.BookTypeService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Auther: luhailiang
 * @Date: 2019-04-09 16:54
 * @Description: BookTypeController
 */
@RestController
@RequestMapping("/booktype")
public class BookTypeController {

    @Resource
    private BookTypeService bookTypeService;

    /**
     * @return : java.lang.Object
     * @author: luhailiang
     * @date: 2019-04-10 13:24
     * @description: 加载所有分类数据 展示树
     */
    @PostMapping("/loadAllBookTypeData")
    @LoginRequired
    public Object loadAllBookTypeData() {
        List<BookType> bookTypes = new ArrayList<>();
        List<BookType> bookTypeList = bookTypeService.queryAllBookType();
        Map<Integer, BookType> bookTypeMap = new HashMap<>();
        for (BookType bookType : bookTypeList) {
            bookTypeMap.put(bookType.getBookTypeId(), bookType);
        }
        for (BookType bookType : bookTypeList) {
            BookType child = bookType;
            if (child.getBookTypeParentId() == null) {
                bookTypes.add(bookType);
            } else {
                BookType parent = bookTypeMap.get(child.getBookTypeParentId());
                parent.getChildren().add(child);
            }
        }
        return bookTypes;
    }


    /**
     * @param bookTypeId
     * @return : io.hailiang.web.book.common.DataGridDataSource<io.hailiang.web.book.model.BookType>
     * @author: luhailiang
     * @date: 2019-04-10 13:24
     * @description: 根据id查询分类列表
     */
    @PostMapping("/listByBookTypeId")
    @LoginRequired
    public DataGridDataSource<BookType> selectBookTypeListByBookTypeId(@RequestParam(defaultValue = "0") Integer bookTypeId) {

        List<BookType> bookTypeList = bookTypeService.selectBookTypeListByBookTypeId(bookTypeId);
        DataGridDataSource<BookType> dataGridDataSource = new DataGridDataSource<>();
        dataGridDataSource.setRows(bookTypeList);
        dataGridDataSource.setTotal(bookTypeList.size());
        return dataGridDataSource;
    }


    /**
     * @param bookTypeId
     * @return : io.hailiang.web.book.common.JsonData
     * @author: luhailiang
     * @date: 2019-04-10 13:27
     * @description: 根据id删除分类
     */
    @DeleteMapping("/delete")
    @LoginRequired
    public JsonData deleteBookType(@RequestParam(value = "bookTypeId") Integer bookTypeId) {

        int count = bookTypeService.deleteBookType(bookTypeId);
        if (count > 0) {
            return JsonData.success(count, "删除成功");
        } else {
            return JsonData.fail("删除失败");
        }
    }


    /**
     * @param bookType
     * @return : io.hailiang.web.book.common.JsonData
     * @author: luhailiang
     * @date: 2019-04-10 13:47
     * @description: 新增分类
     */
    @PostMapping("/save")
    @LoginRequired
    public JsonData saveBookType(BookType bookType) {
        int count = bookTypeService.saveBookType(bookType);
        if (count > 0) {
            return JsonData.success(count, "新增成功");
        } else {
            return JsonData.fail("新增失败");
        }
    }

    /**
     * @param bookType
     * @return : io.hailiang.web.book.common.JsonData
     * @author: luhailiang
     * @date: 2019-04-10 13:48
     * @description: 修改分类
     */
    @PutMapping("/update")
    @LoginRequired
    public JsonData update(BookType bookType) {
        int count = bookTypeService.updateBookType(bookType);
        if (count > 0) {
            return JsonData.success(count, "修改成功");
        } else {
            return JsonData.fail("修改失败");
        }
    }
}
