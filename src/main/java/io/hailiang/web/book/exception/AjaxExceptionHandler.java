package io.hailiang.web.book.exception;

import io.hailiang.web.book.util.JsonData;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;

/**
 * @Auther: luhailiang
 * @Date: 2019-03-12 20:44
 * @Description:
 */

@RestControllerAdvice
public class AjaxExceptionHandler {

    @ExceptionHandler(value = Exception.class)
    public JsonData defaultErrorHandler(HttpServletRequest req,
                                        Exception e) throws Exception {

        e.printStackTrace();
        return JsonData.fail(e.getMessage());
    }
}
