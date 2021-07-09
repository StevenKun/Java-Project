package com.likun.content.configuration;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.netflix.ribbon.RibbonClients;
import org.springframework.context.annotation.Configuration;
import ribbonconfiguration.RibbonConfiguration;

/**
 * ribbon细粒度配置
 */
/*@Configuration
@RibbonClient(name = "user-center", configuration = RibbonConfiguration.class)*/

/**
 * ribbon全局配置
 */
@Configuration
/*@RibbonClients( defaultConfiguration = RibbonConfiguration.class)*/
public class ContentCenterRibbonConfiguration  {

}
