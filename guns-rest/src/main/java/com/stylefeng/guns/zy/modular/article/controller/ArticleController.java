package com.stylefeng.guns.zy.modular.article.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.zy.modular.dao.warpper.ArtcleWarpper;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
//import com.stylefeng.guns.zy.core.log.LogObjectHolder;
import com.stylefeng.guns.rest.common.persistence.model.Article;
import com.stylefeng.guns.zy.modular.article.service.IArticleService;

import java.util.List;
import java.util.Map;

/**
 * 文章管理控制器
 *
 * @author fengshuonan
 * @Date 2018-01-24 16:15:14
 */
@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController {

    private String PREFIX = "/article/article/";

    @Autowired
    private IArticleService articleService;

    /**
     * 跳转到文章管理首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "article.html";
    }

    /**
     * 跳转到添加文章管理
     */
    @RequestMapping("/article_add")
    public String articleAdd() {
        return PREFIX + "article_add.html";
    }

    /**
     * 跳转到修改文章管理
     */
    @RequestMapping("/article_update/{articleId}")
    public String articleUpdate(@PathVariable Integer articleId, Model model) {
        Article article = articleService.selectById(articleId);
        model.addAttribute("item",article);
        //LogObjectHolder.me().set(article);
        return PREFIX + "article_edit.html";
    }

    /**
     * 获取文章列表
     */
    @ApiOperation(value="获取获取文章列表", notes="获取获取文章列表")
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    @ResponseBody
    public Object list() {
        EntityWrapper<Article> wrapper = new EntityWrapper<>();
        wrapper.eq("publish", true);
        List<Map<String, Object>> article;
        article = articleService.selectMaps(wrapper);
        return super.returnStandardResult("data",super.warpObject(new ArtcleWarpper(article)));
    }

    /**
     * 新增文章管理
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Article article) {
        articleService.insert(article);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除文章管理
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer articleId) {
        articleService.deleteById(articleId);
        return SUCCESS_TIP;
    }

    /**
     * 修改文章管理
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Article article) {
        articleService.updateById(article);
        return super.SUCCESS_TIP;
    }

    /**
     * 文章管理详情
     */
    @RequestMapping(value = "/detail/{articleId}")
    @ResponseBody
    public Object detail(@PathVariable("articleId") Integer articleId) {
        return articleService.selectById(articleId);
    }
}
