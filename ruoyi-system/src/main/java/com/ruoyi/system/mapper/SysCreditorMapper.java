package com.ruoyi.system.mapper;

import com.ruoyi.common.core.domain.entity.SysCreditor;
import com.ruoyi.common.core.domain.entity.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户表 数据层
 * 
 * @author ruoyi
 */
public interface SysCreditorMapper
{
    /**
     * 新增用户信息
     *
     * @param creditor 债权人信息
     * @return 结果
     */
    public int insertCreditor(SysCreditor creditor);
}
