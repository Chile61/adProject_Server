package com.stylefeng.guns.modular.zy.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import com.stylefeng.guns.common.persistence.model.Article;
import com.stylefeng.guns.modular.zy.service.IArticleService;

/**
 * article控制器
 *
 * @author fengshuonan
 * @Date 2018-01-21 12:49:20
 */
@Controller
@RequestMapping("/article")
public class ArticleController extends BaseController {

    private String PREFIX = "/zy/article/";

    @Autowired
    private IArticleService articleService;

    /**
     * 跳转到article首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "article.html";
    }

    /**
     * 跳转到添加article
     */
    @RequestMapping("/article_add")
    public String articleAdd() {
        return PREFIX + "article_add.html";
    }

    /**
     * 跳转到修改article
     */
    @RequestMapping("/article_update/{articleId}")
    public String articleUpdate(@PathVariable Integer articleId, Model model) {
        Article article = articleService.selectById(articleId);
        model.addAttribute("item",article);
        LogObjectHolder.me().set(article);
        return PREFIX + "article_edit.html";
    }

    /**
     * 获取article列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return articleService.selectList(null);
    }

    /**
     * 新增article
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Article article) {
        articleService.insert(article);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除article
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer articleId) {
        articleService.deleteById(articleId);
        return SUCCESS_TIP;
    }

    /**
     * 修改article
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Article article) {
        articleService.updateById(article);
        return super.SUCCESS_TIP;
    }

    /**
     * article详情
     */
    @RequestMapping(value = "/detail/{articleId}")
    @ResponseBody
    public Object detail(@PathVariable("articleId") Integer articleId) {
        return articleService.selectById(articleId);
    }
}
