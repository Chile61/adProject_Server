package com.stylefeng.guns.common.annotion;

import com.stylefeng.guns.common.constant.dictmap.base.AbstractDictMap;
import com.stylefeng.guns.common.constant.dictmap.base.SystemDict;

import java.lang.annotation.*;

/**
 * 标记需要做业务日志的方法
 *
 * @author fengshuonan
 * @date 2017-03-31 12:46
 */
@Inherited //说明了Annotation所修饰的对象范围
@Retention(RetentionPolicy.RUNTIME) //定义了该Annotation被保留的时间长短
@Target({ElementType.METHOD}) //元注解是一个标记注解，@Inherited阐述了某个被标注的类型是被继承的
public @interface BussinessLog {

    /**
     * 业务的名称,例如:"修改菜单"
     */
    String value() default "";

    /**
     * 被修改的实体的唯一标识,例如:菜单实体的唯一标识为"id"
     */
    String key() default "id";

    /**
     * 字典(用于查找key的中文名称和字段的中文名称)
     */
    Class<? extends AbstractDictMap> dict() default SystemDict.class;
}
