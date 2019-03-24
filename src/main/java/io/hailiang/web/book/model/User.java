package io.hailiang.web.book.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
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
    private Integer userState;  //约定 1：正常状态  0：禁用状态   默认正常
    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date userCreateTime;
    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date userLastModifyTime;


}
