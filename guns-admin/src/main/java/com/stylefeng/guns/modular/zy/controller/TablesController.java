package com.stylefeng.guns.modular.zy.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.SqlRunner;
import com.baomidou.mybatisplus.plugins.Page;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.stylefeng.guns.common.persistence.dao.ConversionLogMapper;
import com.stylefeng.guns.common.persistence.dao.PointsAccountJournalMapper;
import com.stylefeng.guns.common.persistence.model.ConversionLog;
import com.stylefeng.guns.common.persistence.model.PointsAccountJournal;
import com.stylefeng.guns.core.db.Db;
import com.stylefeng.guns.modular.zy.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * zyAdminUsers控制器
 *
 * @author jerry
 * @Date 2018-02-22 22:36:24
 */
@Controller
@RequestMapping("/tables")
public class TablesController {

    private String PREFIX = "/zy/tables/";

    @Autowired
    private ITUserService itUserService;

    @Autowired
    private IConversionLogService cnvLogService;

    @Resource
    private ConversionLogMapper cnvLogMapper;

    @Resource
    private PointsAccountJournalMapper ptAcctJourMapper;

    @Autowired
    private ICloudPointsAccountJournalService cloudptAcctJourService;

    @Autowired
    private IConversionSumLogService cnvSumLogService;

    @Autowired
    private IPointsAccountJournalService ptAcctJourService;

    @Autowired
    private ICloudPointsAccountJournalService cloudAcctJourService;

    @Autowired
    private IWithdrawLogService withdrawLogService;

    /**
     * 用户积分报表
     */
    @RequestMapping("/tUsers")
    public String tUsersTable () {return PREFIX + "tUsers_table.html";}

    /**
     * 用户积分报表数据接口
     */
    @RequestMapping(value = "list")
    @ResponseBody
    public Object list(@RequestParam Integer tUserId) {

        List<ConversionLog> cnvs = cnvLogMapper.selectPage(
                new Page<ConversionLog>(1,30),
                new EntityWrapper<ConversionLog>().eq("userId", tUserId));
        List<PointsAccountJournal> ptAcctJours = ptAcctJourMapper.selectPage(
                new Page<PointsAccountJournal>(1, 30),
                new EntityWrapper<PointsAccountJournal>().eq("userId", tUserId));

        List<Map<String, Object>> results = new ArrayList<Map<String, Object>>();
        for(ConversionLog var : cnvs) {
            ObjectMapper oMapper = new ObjectMapper();
            Map<String, Object> map = oMapper.convertValue(var, Map.class);
            results.add(map);
        }

        for(PointsAccountJournal var : ptAcctJours) {
            ObjectMapper oMapper = new ObjectMapper();
            Map<String, Object> map = oMapper.convertValue(ptAcctJours, Map.class);
            results.add(map);
        }
        return cnvs;
    }
}
