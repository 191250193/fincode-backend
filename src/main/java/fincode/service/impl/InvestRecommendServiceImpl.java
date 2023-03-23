package fincode.service.impl;

import fincode.mapper.StockPriceMapper;
import fincode.model.StockPricePO;
import fincode.service.InvestRecommendService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author zlj
 * @date 2023/3/23
 */

@Service
public class InvestRecommendServiceImpl implements InvestRecommendService {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private StockPriceMapper stockPriceMapper;

    public void list(int page, int limit){

        StockPricePO stockPricePO = stockPriceMapper.findOneByCompanyId("000001.SZ");
        int lastUpdateDate = stockPricePO.getTime();

        //TODO

    }
}
