package io.hailiang.web.book.config;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @Auther: luhailiang
 * @Date: 2018/8/21 13:24
 * @Description: Swagger2配置类
 */
@EnableSwagger2
@Configuration
public class Swagger2Config {

    /**
     * 生产环境可以设置关闭swagger
     */
    @Value(value = "${swagger.enabled}")
    Boolean swaggerEnabled;


    @Bean
    public Docket createApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .enable(swaggerEnabled)
                .select()
                //为当前包路径
                .apis(RequestHandlerSelectors.basePackage("io.hailiang.web.book.controller"))
                .paths(PathSelectors.any())
                .build();
    }

    //构建 api文档的详细信息函数
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                //页面标题
                .title("图书管理系统 使用 Swagger2 构建 API")
                //创建人
                .contact(new Contact("肆意。-", "https://blog.luhailiang.top", "1176239106@qq.com"))
                //版本号
                .version("1.0")
                //描述
                .description("API 描述")
                .build();
    }
}
