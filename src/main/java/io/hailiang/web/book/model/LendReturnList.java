package io.hailiang.web.book.model;

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

    private Date lendDate;

    private Integer shouldLendDays;

    private Date shouldReturnDate;

    private Date returnDate;

    private Integer isDamage;  //0未损毁  1已损毁

    private String damageDegree;

    private String damageNote;


}