package fincode.model;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class StockFollowedPO {
    private Integer id;
    private Integer user_id;

    private Integer stock_id;
    private LocalDateTime gmt_created;

    private LocalDateTime gmt_modified;



    public StockFollowedPO(Integer user_id, Integer stock_id) {
        this.user_id = user_id;
        this.stock_id = stock_id;
    }
}
