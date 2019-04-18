package io.hailiang.web.book.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.math.BigDecimal;
import java.util.Date;


/**
 * @Auther: luhailiang
 * @Date: 2019-04-15 10:28
 * @Description: BookInfoModel
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class BookInfo {
    private Integer bookId;

    private String bookIsbn;

    private String bookName;

    private String bookAuthor;

    private String bookPublish;

    private BigDecimal bookPrice;

    private Integer bookState;

    private Integer bookType;

    private Integer bookShelf;

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date bookCreateTime;

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date bookLastModifyTime;

    private String bookIntroduction;

    private String types;

}