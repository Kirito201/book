package io.hailiang.web.book.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.util.Date;


@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class LendReturnList {
    private Integer lendReturnId;

    private Integer bookId;

    private Long userId;

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd")
    private Date lendDate;

    private Integer shouldLendDays;

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd")
    private Date shouldReturnDate;

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd")
    private Date returnDate;

    private Integer isDamage;  //0未损毁  1已损毁

    private String damageDegree;

    private String damageNote;

    private User user;

    private BookInfo bookInfo;

    private Integer extendedDays;

    private String bookNames;

}