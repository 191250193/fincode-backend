package fincode.controller;

import fincode.model.ResultVO;
import fincode.model.StockPO;
import fincode.model.StockPricePO;
import fincode.service.StockPriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/stockprice")
public class StockPrice {
    @Autowired
    StockPriceService stockPriceService;
    @PostMapping("/listprice")
    ResultVO<?> listPrice(@RequestParam String code,@RequestParam Integer end,@RequestParam Integer limit){
        if(code==null||end==null||limit==null){
            return new ResultVO<>(1,"err", "错误的输入");
        }

        List<StockPricePO> result = stockPriceService.listPrice(code,end,limit);
        if(result!=null) return new ResultVO<>(0,"ok",result);
        else return new ResultVO<>(1,"err", "检索失败");

    }
    @PostMapping("/listpricebyid")
    ResultVO<?> listPriceById(@RequestParam Integer id,@RequestParam Integer end,@RequestParam Integer limit){
        if(id==null||end==null||limit==null){
            return new ResultVO<>(1,"err", "错误的输入");
        }

        List<StockPricePO> result = stockPriceService.listPriceById(id,end,limit);
        if(result!=null) return new ResultVO<>(0,"ok",result);
        else return new ResultVO<>(1,"err", "检索失败");

    }
}
