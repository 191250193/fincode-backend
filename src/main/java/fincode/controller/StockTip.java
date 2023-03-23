package fincode.controller;

import fincode.model.ResultVO;
import fincode.model.StockTipApiListTipsReq;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author zlj
 * @date 2023/3/23
 */

@RestController
@RequestMapping("/stocktip")
public class StockTip {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    // @summary 列出某股票和对应的一批策略给出的投资建议组合
    @PostMapping("/listtips")
    public ResultVO<?> listTips(@Validated @RequestBody StockTipApiListTipsReq stockTipApiListTipsReq, BindingResult result){
        if (result.hasErrors()){
            List<FieldError> fieldErrors = result.getFieldErrors();

            fieldErrors.forEach(fieldError -> {
                logger.error(fieldError.getField() + fieldError.getDefaultMessage());
            });

            String errorMessage = "";
            for (FieldError fieldError : fieldErrors){
                errorMessage += fieldError.getDefaultMessage();
            }
            return new ResultVO<>(1,errorMessage);
        }
        return null;
    }
}
