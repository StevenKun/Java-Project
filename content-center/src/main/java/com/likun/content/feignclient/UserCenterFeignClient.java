package com.likun.content.feignclient;

import com.likun.content.domain.dto.user.UserDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name = "user-center"/*configuration = UserCenterFeignConfiguration.class)*/)
public interface UserCenterFeignClient   {


    @GetMapping("/users/{id}")
    UserDTO findById(@PathVariable Integer id);



}
