package com.ruoyi.system.service.impl;

import com.ruoyi.common.core.domain.entity.SysCreditor;
import com.ruoyi.system.mapper.SysCreditorMapper;
import com.ruoyi.system.service.ISysCreditorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 债权人 业务层处理
 *
 * @author ruoyi
 */
@Service
public class SysCreditorServiceImpl implements ISysCreditorService {
    private static final Logger log = LoggerFactory.getLogger(SysCreditorServiceImpl.class);

    @Autowired
    private SysCreditorMapper creditorMapper;

    @Override
    @Transactional
    public int insertCreditor(SysCreditor creditor) {
        // 新增债权人信息
        int rows = creditorMapper.insertCreditor(creditor);

        return rows;
    }
}
