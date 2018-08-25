package com.stylefeng.guns.zy;

import com.baomidou.mybatisplus.mapper.SqlRunner;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Map;

class test {
    public static void main(String[] args) {
        Date d= new Date();
        GregorianCalendar gc=new GregorianCalendar();
        gc.setTime(d);
        gc.add(5,-1);
        SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        System.out.println("昨天的日期："+df.format(gc.getTime()));
        System.out.println("今天的日期："+df.format(d));
        System.out.println("两天前的日期：" + df.format(new Date(d.getTime() - 2 * 24 * 60 * 60 * 1000)));
        System.out.println("三天后的日期：" + df.format(new Date(d.getTime() + 3 * 24 * 60 * 60 * 1000)));
        System.out.println("hello https://tool.lu/");
    }

    public static void test2() {
        Date td = new Date();
        GregorianCalendar gc = new GregorianCalendar();
        gc.setTime(td);
        gc.add(5,-1);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String sql = "SELECT SUM(points), userId " +
                "FROM `t_points_account_journal` " +
                "WHERE `userId` = 1" +
                "and date(`dateTime`) = " + df.format(gc.getTime());
        Map<String, Object> data = SqlRunner.db().selectOne(sql);
        System.out.println(data);
    }
}