package fincode.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author zlj
 * @date 2023/3/23
 */

@RestController
@RequestMapping("/investrec")
public class InvestRecommend {

    // @summary 获取投资推荐
    @PostMapping("/list")
    public void list(@RequestParam int page, @RequestParam int limit){
        //TODO
    }
}
