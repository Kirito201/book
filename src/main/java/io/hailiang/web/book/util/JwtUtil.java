package io.hailiang.web.book.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import io.hailiang.web.book.model.User;

/**
 * @Auther: luhailiang
 * @Date: 2019-03-12 16:42
 * @Description: JWT工具类
 */
public class JwtUtil {

    public static String createToken(User user) {
        String token = "";
        token = JWT.create().withAudience(Integer.toString(user.getUserId()))// 将 user id 保存到 token 里面
                .sign(Algorithm.HMAC256(user.getUserPassword()));// 以 password 作为 token 的密钥
        return token;
    }
}
