package com.ruoyi.common.core.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.annotation.Excel.Type;
import com.ruoyi.common.annotation.Excels;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.boot.autoconfigure.domain.EntityScan;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

/**
 *  债券申报单 sys_declareform
 * 
 * @author Mason Wang
 */

public class SysDeclareForm extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 申报单ID */
    @Excel(name = "申报单序号", cellType = ColumnType.NUMERIC, prompt = "申报单编号")
    private Long dfId;

    /** 债权形成说明 */
    @Excel(name = "债权形成说明")
    private String description;

    /** 债权性质 */
    @Excel(name = "债权性质")
    private String nature;

    /** 币种 */
    @Excel(name = "币种")
    private String currency;

//    /** 币种 */
//    @Excel(name = "币种")
//    private String currency;
//
//    /** 本金 */
//    @Excel(name = "本金")
//    private String currency;
//
//    /** 利息 */
//    @Excel(name = "利息")
//    private String currency;
//
//    /** 罚金 */
//    @Excel(name = "罚金")
//    private String currency;
//
//    /** 复利 */
//    @Excel(name = "复利")
//    private String currency;
//
//    /** 违约金*/
//    @Excel(name = "违约金")
//    private String currency;
//
//    /** 律师费 */
//    @Excel(name = "律师费")
//    private String currency;
//
//    /** 诉讼费*/
//    @Excel(name = "诉讼费")
//    private String currency;
//
//    /** 保全费 */
//    @Excel(name = "保全费")
//    private String currency;
//
//    /** 迟延履行利息 */
//    @Excel(name = "迟延履行利息")
//    private String currency;





    public SysDeclareForm()
    {

    }

    public SysDeclareForm(Long dfId)
    {
        this.dfId = dfId;
    }

    public Long getDfId()
    {
        return dfId;
    }

    public void setDfId(Long dfId)
    {
        this.dfId = dfId;
    }


}
