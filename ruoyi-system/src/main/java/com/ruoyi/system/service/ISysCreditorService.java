package com.ruoyi.system.service;


import com.ruoyi.common.core.domain.entity.SysCreditor;

/**
 * 债权人 业务层
 * 
 * @author ruoyi
 */
public interface ISysCreditorService
{

    /**
     * 新增债权人
     * @param creditor
     * @return
     */
    public int insertCreditor(SysCreditor creditor);
}
