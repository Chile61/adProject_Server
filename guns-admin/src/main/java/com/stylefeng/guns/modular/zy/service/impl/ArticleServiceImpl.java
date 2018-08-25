package com.stylefeng.guns.modular.zy.service.impl;

import com.stylefeng.guns.common.persistence.model.Article;
import com.stylefeng.guns.common.persistence.dao.ArticleMapper;
import com.stylefeng.guns.modular.zy.service.IArticleService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 文章表 服务实现类
 * </p>
 *
 * @author jerry
 * @since 2018-01-21
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements IArticleService {
	
}
