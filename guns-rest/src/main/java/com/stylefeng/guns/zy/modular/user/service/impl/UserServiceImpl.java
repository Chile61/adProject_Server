package com.stylefeng.guns.zy.modular.user.service.impl;

import com.stylefeng.guns.core.qr.ImgQrTool;
import com.stylefeng.guns.core.qr.QrImage;

import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.rest.common.persistence.model.User;
import com.stylefeng.guns.rest.common.persistence.dao.UserMapper;

import com.stylefeng.guns.zy.modular.user.service.IUserService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.stylefeng.guns.zy.modular.util.ZyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * <p>
 * 管理员表 服务实现类
 * </p>
 *
 * @author jerry
 * @since 2018-01-04
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    ZyUtil zyUtil;

    public String genRegisterQr(Object content, String name) {
        //TODO 这里有个路径是硬编码
        String recomQRcode = ToolUtil.getJarPath(this, "zyAssets/");
        QrImage para = new QrImage.Builder()
                .setFileOutputPath(recomQRcode + name + ".jpg")
                .setQrContent(content.toString())
                .setQrHeight(300)
                .setQrWidth(300)
                .setQrIconFilePath(recomQRcode + "timg.jpg")
                .setTopWrodHeight(100)
                .setWordContent("")
                .setWordSize(18).build();
        ImgQrTool.createQrWithFontsAbove(para);
        return name + ".jpg";
    }
}
