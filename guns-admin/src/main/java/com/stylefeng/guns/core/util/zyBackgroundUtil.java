package com.stylefeng.guns.core.util;

import com.alibaba.fastjson.JSON;
import org.apache.commons.io.IOUtils;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Map;

/**
 * 中盈创世后台系统工具
 */
public class zyBackgroundUtil {
    /**
     * 获取json文件中的配置
     */
    public static Map<String, Object> getJsonConfig(String jsonPath) {
        InputStream inputStream = null;
        try {
            inputStream = new FileInputStream(jsonPath);
            String text = IOUtils.toString(inputStream, "utf8");
            Map<String, Object> cnf = JSON.parseObject(text, Map.class);
            return cnf;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
