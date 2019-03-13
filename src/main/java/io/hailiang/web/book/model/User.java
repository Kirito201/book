package io.hailiang.web.book.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
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

//    @NotBlank(message = "用户名不能为空")
    private String userName;

//    @Length(min = 6, max = 12, message = "密码长度需在6-12之间")
    private String userPassword;

//    @NotBlank(message = "邮箱不能为空")
//    @Email
    private String userEmail;

//    @NotBlank(message = "手机号不能为空")
    private String userPhone;

    private Integer userState;  //约定 1：启用状态  0：停用状态   默认启用

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date userCreateTime;

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date userLastModifyTime;


}
