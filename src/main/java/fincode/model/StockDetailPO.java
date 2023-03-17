package fincode.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import java.time.LocalDateTime;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class StockDetailPO {
    Integer id;
    Integer stock_id;
    String name;
    String enname;
    String ts_code;
    String list_date;
    String area;
    Integer industry_id;
    Integer is_deleted;
    LocalDateTime gmt_created;
    LocalDateTime gmt_modified;

    String ext_info;
}
