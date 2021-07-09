package com.likun.content.service.content;


import com.likun.content.dao.content.ShareMapper;
import com.likun.content.domain.dto.content.ShareDTO;
import com.likun.content.domain.dto.user.UserDTO;
import com.likun.content.domain.entity.content.Share;
import com.likun.content.feignclient.UserCenterFeignClient;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.User;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Service
@RequiredArgsConstructor(onConstructor = @_(@Autowired))
@EnableDiscoveryClient
@Slf4j
public class ShareService {

    private final ShareMapper shareMapper;

   // private final RestTemplate restTemplate;


    private final UserCenterFeignClient userCenterFeignClient;
    private final DiscoveryClient discoveryClient;


    public ShareDTO getShareById(Integer id){
        Share share = shareMapper.selectByPrimaryKey(id);
        Integer userId =share.getUserId();

     /*   List<ServiceInstance> instances = discoveryClient.getInstances("user-center");
        String targetURL = instances.stream().map(instance -> instance.getUri().toString() + "/users/{id}")
                .findFirst().orElseThrow(() -> new IllegalArgumentException("当前没有实例"));
*/

        //log.info(targetURL);
        //消息得装配


     /*   UserDTO userDTO = restTemplate.getForObject("http://user-center/users/{id}", UserDTO.class, userId);
     */

        UserDTO userDTO = userCenterFeignClient.findById(userId);
        ShareDTO shareDTO = new ShareDTO();
        BeanUtils.copyProperties(share,shareDTO);
        shareDTO.setWxNickname(userDTO.getWxNickname());
        return shareDTO;



    }

}
