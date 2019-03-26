package io.hailiang.web.book.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Auther: luhailiang
 * @Date: 2019-03-26 22:10
 * @Description: PermissionModel
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class Permission {

    private Integer permissionId;
    private String permissionName;
    private String permissionUrl;
    private Integer permissionParentId;
    private String permissionIcon;
    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date permissionCreateTime;
    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date permissionLastModifyTime;
    private boolean open = true;
    private boolean checked = false;
    private List<Permission> children = new ArrayList<>();
}
