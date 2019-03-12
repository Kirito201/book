package io.hailiang.web.book.model;

import lombok.*;

import java.util.Date;

/**
 * @Auther: luhailiang
 * @Date: 2019-03-12 10:28
 * @Description: UserModel
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class User {

    private Integer userId;
    private String userName;
    private String userPassword;
    private String userEmail;
    private String userPhone;
    private Integer userState;  //约定 1：启用状态  0：停用状态   默认启用
    private Date userCreateTime;
    private Date userLastModifyTime;


}
