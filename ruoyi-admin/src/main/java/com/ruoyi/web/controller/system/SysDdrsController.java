package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysCreditor;
import com.ruoyi.common.core.domain.entity.SysDeclareForm;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.service.ISysCreditorService;
import com.ruoyi.system.service.ISysDeclareFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 债券申报
 *
 * @author ruoyi
 */
@RestController
@RequestMapping("/system/ddrs")
public class SysDdrsController extends BaseController {
    @Autowired
    private ISysDeclareFormService declareFormService;

    @Autowired
    private ISysCreditorService creditorService;

    @Autowired
    private TokenService tokenService;

    /**
     * 上传文件至服务器
     */
    @Log(title = "上传文件", businessType = BusinessType.INSERT)
    @PreAuthorize("@ss.hasPermi('system:ddrs:upload')")
    @PostMapping("/upload")
    public AjaxResult uploadFile(MultipartFile file, HttpServletRequest req) throws IOException {
        if (!file.isEmpty()) {
            AjaxResult ajax = AjaxResult.success();
            // 上传文件
            String pathFileName = FileUploadUtils.upload(RuoYiConfig.getUploadPath(), file);
            String url_prefix = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort();
            // 返回前端访问url
            String url = url_prefix + "/" + StringUtils.substring(pathFileName, Constants.RESOURCE_PREFIX.length() + 1);
            System.out.println(url);
            // 服务器端访问url
            String localUrl = RuoYiConfig.getProfile() + "/" + StringUtils.substring(pathFileName, Constants.RESOURCE_PREFIX.length() + 1);
            System.out.println(localUrl);

            ajax.put("url", url);
            return ajax;
        }
        return AjaxResult.error("上传文件异常，请联系管理员");
    }

    /**
     * 新增债权人
     *
     * @param creditor
     * @return
     * @throws IOException
     */
    @Log(title = "新增债权人", businessType = BusinessType.INSERT)
    @PreAuthorize("@ss.hasPermi('system:ddrs:insert')")
    @PostMapping("/insertCreditor")
    public AjaxResult insertCreditor(@Validated @RequestBody SysCreditor creditor) throws IOException {
        creditorService.insertCreditor(creditor);

        return AjaxResult.success("新增债权人成功！");
    }


    /**
     * 债券申报，提交申报单
     *
     * @param declareForm
     * @return
     * @throws IOException
     */
    @Log(title = "债券申报", businessType = BusinessType.INSERT)
    @PreAuthorize("@ss.hasPermi('system:ddrs:submit')")
    @PostMapping("/submitDeclareForm")
    public AjaxResult submitDeclareForm(@Validated @RequestBody SysDeclareForm declareForm) throws IOException {

        return AjaxResult.success("新增债券申报单成功！");
    }

}
