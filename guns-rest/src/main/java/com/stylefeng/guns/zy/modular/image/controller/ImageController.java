package com.stylefeng.guns.zy.modular.image.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.util.ToolUtil;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.awt.print.Printable;
import java.nio.file.Paths;

//import com.stylefeng.guns.zy.core.log.LogObjectHolder;

/**
 * 图片控制器
 *
 * @author fengshuonan
 * @Date 2018-01-01 14:44:05
 */
@Controller
@RequestMapping("/images")
public class ImageController extends BaseController {

    private ResourceLoader loader = new DefaultResourceLoader();
    /**
     * 显示图片
     */
    @ApiOperation(value="显示图片", notes="")
    @RequestMapping(value = "/{filename:.+}", method= RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<?> getFile(@PathVariable String filename) {
        try {
            String filePath = "file:" + ToolUtil.getJarPath(this, "zyAssets/image/")+filename;
            System.out.print("filePath:"+filePath);
            return ResponseEntity.ok(loader.getResource(filePath));
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }
}
