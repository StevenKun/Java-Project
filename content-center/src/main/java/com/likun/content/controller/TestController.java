package com.likun.content.controller;

import com.alibaba.csp.sentinel.Entry;
import com.alibaba.csp.sentinel.SphU;
import com.alibaba.csp.sentinel.Tracer;
import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.alibaba.csp.sentinel.context.ContextUtil;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.likun.content.dao.content.ShareMapper;
import com.likun.content.domain.dto.user.UserDTO;
import com.likun.content.domain.entity.content.Share;
import com.likun.content.feignclient.TestBaiduFeignClient;
import com.likun.content.feignclient.TestUserCenterFeignClient;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.awt.geom.Ellipse2D;
import java.util.Date;
import java.util.List;

@RestController
@Slf4j
@RequiredArgsConstructor(onConstructor = @_(@Autowired))
public class TestController {


   private final ShareMapper shareMapper;

   private final DiscoveryClient discoveryClient;


   private final TestUserCenterFeignClient testUserCenterFeignClient;

   @Autowired
   private TestBaiduFeignClient testBaiduFeignClient;




   @GetMapping("/testShare")
    public List<Share> testInsert(){
       Share share =new Share();
       share.setCreateTime(new Date());
       share.setUpdateTime(new Date());
       share.setTitle("ww");
       share.setCover("xxx");
       share.setAuthor("qq");
       share.setBuyCount(3);


       this.shareMapper.insertSelective(share);

       List<Share> shareList =this.shareMapper.selectAll();
       return  shareList;


   }

   @GetMapping("test2")
   public List<ServiceInstance> testDiscoverclient(){
      return this.discoveryClient.getInstances("user-center");
   }

   @GetMapping("test-get")
   public UserDTO query(UserDTO userDTO){
      return testUserCenterFeignClient.query(userDTO);
   }

   @GetMapping("testbaidu")
   public String baiduIndex(){
      String a ="adbcdef";
      char[] chars = a.toCharArray();

      return this.testBaiduFeignClient.index();
   }

   @GetMapping("/test-sentinel-api")
   public String testSentinelAPI(@RequestParam(required = true) String a){
      Entry sentinel =null;

      String resouceName ="test-sentinel-api";
      ContextUtil.enter(resouceName,"test-sentinel-springcloud");
      try {
          sentinel = SphU.entry("test-sentinel-api");

          if (StringUtils.isBlank(a)){
               throw new IllegalArgumentException("參數非法");
          }
          return  a ;
      } catch (BlockException e) {
         log.warn("限流或者降級");
         return "限流或者降級";

      }

      finally {
         if (sentinel !=null){
            sentinel.exit();
         }

      }

   }
   @GetMapping("/test-sentinel-resource")
   @SentinelResource(value = "test-sentinel-api" ,fallback = "fallback",blockHandler = "block")
   public String testSentinelAPI1(@RequestParam(required = false) String a){

      if (StringUtils.isBlank(a)){
         throw new IllegalArgumentException("param is blank");
      }
      return a;
   }


   /**
    * 處理降級
    * @return
    */
   public String fallback(String a,BlockException e){
      log.warn("限流，或者降級了");

      return "限流，或者降級了1";
   }

   /**
    * 限流或者降級
    * @param a
    * @param e
    * @return
    */
   public String block(String a,BlockException e){
      log.warn("限流，或者降級了",e);
      return "限流，或者降級了2";
   }



   @Autowired
   private RestTemplate restTemplate;


   @GetMapping("/test-rest-template/{userId}")
   public UserDTO test(@PathVariable Integer userId){
     return this.restTemplate.getForObject("http://user-center/users/{userId}",UserDTO.class,userId);

   }

   public String fallback(){

      return "xian liule";
   }


}


