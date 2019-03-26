package io.hailiang.web.book;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.boot.web.servlet.ErrorPageRegistrar;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;


@Slf4j
@SpringBootApplication
public class BookApplication {

    @Bean
    public ErrorPageRegistrar errorPageRegistrar() {

        return registry -> {
            registry.addErrorPages(
                    new ErrorPage(HttpStatus.NOT_FOUND, "/404.jsp"),
                    new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/500.jsp")
            );
        };
    }

    public static void main(String[] args) {
        SpringApplication.run(BookApplication.class, args);
        log.info("启动成功！");
    }

}
