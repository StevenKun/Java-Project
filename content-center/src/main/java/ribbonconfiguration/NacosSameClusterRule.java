package ribbonconfiguration;

import com.alibaba.cloud.nacos.NacosDiscoveryProperties;
import com.alibaba.nacos.api.exception.NacosException;
import com.alibaba.nacos.api.naming.NamingService;
import com.alibaba.nacos.api.naming.pojo.Instance;
import com.netflix.client.config.IClientConfig;
import com.netflix.loadbalancer.AbstractLoadBalancerRule;
import com.netflix.loadbalancer.Server;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class NacosSameClusterRule extends AbstractLoadBalancerRule {

    @Autowired
    private final NacosDiscoveryProperties nacosDiscoveryProperties;

    public NacosSameClusterRule(NacosDiscoveryProperties nacosDiscoveryProperties) {
        this.nacosDiscoveryProperties = nacosDiscoveryProperties;
    }

    @Override
    public void initWithNiwsConfig(IClientConfig iClientConfig) {

    }

    @Override
    public Server choose(Object o) {
        String clusterName = nacosDiscoveryProperties.getClusterName();
        NamingService namingService=nacosDiscoveryProperties.namingServiceInstance();
        try {
            List<Instance> instances = namingService.selectInstances(clusterName, true);
            List<Instance> sameClusterInstances =instances.stream()
                    .filter(instance -> Objects.equals(instance.getClusterName(),clusterName))
                    .collect(Collectors.toList());

            List<Instance> instancesToBeChosen =new ArrayList<>();
            if (CollectionUtils.isEmpty(sameClusterInstances)){
                instancesToBeChosen =instances;
            }else {
                instancesToBeChosen= sameClusterInstances;
            }


        } catch (NacosException e) {
            e.printStackTrace();
        }

        return null;
    }
}
