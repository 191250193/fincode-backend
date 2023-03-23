package fincode.mapper;

import fincode.model.StockTipDailyPO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;


/**
 * @author zlj
 * @date 2023/3/23
 */

@Mapper
public interface StockTipDailyMapper {

    //分页返回最新的股票数据列表
    @Select("select * from stock_tip_daily where strategy_id=#{strategy_id} and trade_date=#{trade_date} limit #{start}, #{pageSize}")
    List<StockTipDailyPO> findAllLatest(int strategy_id, int trade_date, int start, int pageSize);
}
