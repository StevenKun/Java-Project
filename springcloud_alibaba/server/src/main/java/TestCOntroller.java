import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestCOntroller {

    @GetMapping("/test")
    public String test(){
        return  "test";
    }
}
