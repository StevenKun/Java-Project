package com.likun.content.configuration;

import feign.Logger;
import org.springframework.context.annotation.Bean;

public class GlobalFeignFeignConfiguration {

    @Bean
    public Logger.Level level(){
        return  Logger.Level.BASIC;
    }
}
