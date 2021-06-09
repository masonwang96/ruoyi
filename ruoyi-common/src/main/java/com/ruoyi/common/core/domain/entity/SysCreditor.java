package com.ruoyi.common.core.domain.entity;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.annotation.Excel.ColumnType;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 *  债券人 sys_creditor
 * 
 * @author Mason Wang
 */
public class SysCreditor extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 债权人ID */
    @Excel(name = "债权人ID", cellType = ColumnType.NUMERIC, prompt = "债权人编号")
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



    public SysCreditor()
    {

    }

    public SysCreditor(Long dfId)
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
