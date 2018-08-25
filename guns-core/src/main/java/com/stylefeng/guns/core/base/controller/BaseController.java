package com.stylefeng.guns.core.base.controller;

import com.baomidou.mybatisplus.plugins.Page;
import com.stylefeng.guns.core.base.tips.SuccessTip;
import com.stylefeng.guns.core.base.warpper.BaseControllerWarpper;
import com.stylefeng.guns.core.page.PageInfoBT;
import com.stylefeng.guns.core.support.HttpKit;
import com.stylefeng.guns.core.util.FileUtil;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BaseController {

    protected static String SUCCESS = "SUCCESS";
    protected static String ERROR = "ERROR";

    protected static String REDIRECT = "redirect:";
    protected static String FORWARD = "forward:";

    protected static SuccessTip SUCCESS_TIP = new SuccessTip();

    protected HttpServletRequest getHttpServletRequest() {
        return HttpKit.getRequest();
    }

    protected HttpServletResponse getHttpServletResponse() {
        return HttpKit.getResponse();
    }

    protected HttpSession getSession() {
        return HttpKit.getRequest().getSession();
    }

    protected HttpSession getSession(Boolean flag) {
        return HttpKit.getRequest().getSession(flag);
    }

    protected String getPara(String name) {
        return HttpKit.getRequest().getParameter(name);
    }

    protected void setAttr(String name, Object value) {
        HttpKit.getRequest().setAttribute(name, value);
    }

    protected Integer getSystemInvokCount() {
        return (Integer) this.getHttpServletRequest().getServletContext().getAttribute("systemCount");
    }

    /**
     * 把service层的分页信息，封装为bootstrap table通用的分页封装
     */
    protected <T> PageInfoBT<T> packForBT(Page<T> page) {
        return new PageInfoBT<T>(page);
    }

    /**
     * 包装一个list，让list增加额外属性
     */
    protected Object warpObject(BaseControllerWarpper warpper) {
        return warpper.warp();
    }

    /**
     * 删除cookie
     */
    protected void deleteCookieByName(String cookieName) {
        Cookie[] cookies = this.getHttpServletRequest().getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(cookieName)) {
                Cookie temp = new Cookie(cookie.getName(), "");
                temp.setMaxAge(0);
                this.getHttpServletResponse().addCookie(temp);
            }
        }
    }

    /**
     * 返回前台文件流
     *
     * @author fengshuonan
     * @date 2017年2月28日 下午2:53:19
     */
    protected ResponseEntity<byte[]> renderFile(String fileName, String filePath) {
        byte[] bytes = FileUtil.toByteArray(filePath);
        return renderFile(fileName, bytes);
    }

    /**
     * 返回前台文件流
     *
     * @author fengshuonan
     * @date 2017年2月28日 下午2:53:19
     */
    protected ResponseEntity<byte[]> renderFile(String fileName, byte[] fileBytes) {
        String dfileName = null;
        try {
            dfileName = new String(fileName.getBytes("gb2312"), "iso8859-1");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", dfileName);
        return new ResponseEntity<byte[]>(fileBytes, headers, HttpStatus.CREATED);
    }

    /**
     * 返回符合本团队规范的json结果
     * @param name 结果集的名称
     * @param map
     * @return
     */
    public Map returnStandardResult (String name, Map map) {
        Map<String, Object> standardMap = new HashMap<>();
        if (map == null || map.isEmpty()) {
            standardMap.put("status", 0);
        }
        else {
            standardMap.put("status", 1);
            standardMap.put(name, map);
        }
        return standardMap;
    }

    public Map returnStandardResult (String name, List<?> list) {
        Map<String, Object> standardMap = new HashMap<>();
        if (list == null || list.isEmpty()) {
            standardMap.put("status", 0);
        }
        else {
            standardMap.put("status", 1);
            standardMap.put(name, list);
        }
        return standardMap;
    }

    public Map returnStandardResult (String name, Object list) {
        //Map<String, Object> standardMap = (List<Map<String, Object>>) list;
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> newList =(List<Map<String, Object>>) list;
        Map<String, Object> standardMap = new HashMap<>();
        if (newList == null || newList.isEmpty()) {
            standardMap.put("status", 0);
        }
        else {
            standardMap.put("status", 1);
            standardMap.put(name, newList);
        }

        return standardMap;
    }


    public Map returnStandardResult (String name, PageInfoBT<?> page) {
        Map<String, Object> standardMap = new HashMap<>();
        if (page == null || page.getTotal() == 0) {
            standardMap.put("status", 0);
        }
        else {
            standardMap.put("status", 1);
            standardMap.put(name, page);
        }
        return standardMap;
    }

    public Map returnStandardDetail (String name, Object data) {
        //Map<String, Object> standardMap = (List<Map<String, Object>>) list;
        @SuppressWarnings("unchecked")
        Map<String, Object> standardMap = new HashMap<>();
        if (data == null) {
            standardMap.put("status", 0);
        }
        else {
            standardMap.put("status", 1);
            standardMap.put(name, data);
        }

        return standardMap;
    }
}
