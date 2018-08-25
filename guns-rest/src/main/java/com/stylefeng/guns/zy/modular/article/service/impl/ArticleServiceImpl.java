package com.stylefeng.guns.zy.modular.article.service.impl;

import com.stylefeng.guns.rest.common.persistence.model.Article;
import com.stylefeng.guns.rest.common.persistence.dao.ArticleMapper;
import com.stylefeng.guns.zy.modular.article.service.IArticleService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 文章表 服务实现类
 * </p>
 *
 * @author Chile
 * @since 2018-01-24
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements IArticleService {
	
}
