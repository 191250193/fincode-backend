package fincode.mapper;

import fincode.model.StockPricePO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface StockPriceMapper {
    @Select("select * " +
            "from stock_price " +
            "where companyId=#{tsCode} " +
            "and time<#{time} " +
            "order by time limit  #{limit}"

    )
    public List<StockPricePO> searchPrice(@Param("tsCode") String ts_code, @Param("time") Integer end, @Param("limit") Integer limit);
}
