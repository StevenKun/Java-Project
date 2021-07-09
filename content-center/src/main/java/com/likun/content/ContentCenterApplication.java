package com.likun.content;

import com.alibaba.cloud.sentinel.annotation.SentinelRestTemplate;
import com.likun.content.configuration.GlobalFeignFeignConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan("com.likun")
@EnableFeignClients(defaultConfiguration = GlobalFeignFeignConfiguration.class)
public class ContentCenterApplication {

    public static void main(String[] args) {
        SpringApplication.run(ContentCenterApplication.class, args);
    }




    @Bean
    @LoadBalanced
    @SentinelRestTemplate(fallback = "fallback")
    public RestTemplate restTemplate(){
        return new RestTemplate();
    }

    public String fallback(){

        return "xian liule";
    }

}
