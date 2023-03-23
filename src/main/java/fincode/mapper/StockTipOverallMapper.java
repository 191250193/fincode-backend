package fincode.mapper;


import fincode.model.StockTipOverallPO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface StockTipOverallMapper {

    //根据id获取股票信息
    @Select("select * from stock_tip_overall where strategy_id=#{strategy_id} and stock_id=#{stock_id}")
    StockTipOverallPO findAllByStockId(int strategy_id, int stock_id);

    //根据match_rate或profit_rate降序获取股票信息
    @Select("select * from stock_tip_overall where strategy_id=#{strategy_id} order by #{orderByField} desc limit #{start}, #{pageSize}")
    List<StockTipOverallPO> findAllByOrder(int strategy_id, String orderByField, int start, int pageSize);
}
