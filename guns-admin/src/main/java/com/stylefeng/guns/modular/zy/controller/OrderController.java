package com.stylefeng.guns.modular.zy.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.common.constant.Const;
import com.stylefeng.guns.common.constant.factory.ConstantFactory;
import com.stylefeng.guns.common.persistence.model.OrderProduct;
import com.stylefeng.guns.common.persistence.model.PointsAccountJournal;
import com.stylefeng.guns.common.persistence.model.TUser;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.common.persistence.model.Order;
import com.stylefeng.guns.core.log.LogObjectHolder;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.core.util.zyBackgroundUtil;
import com.stylefeng.guns.modular.zy.service.*;
import com.stylefeng.guns.modular.zy.service.impl.TUserServiceImpl;
import com.stylefeng.guns.modular.zy.warpper.OrderWarpper;
import com.stylefeng.guns.modular.zy.warpper.ProductWarpper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 定单信息控制器
 *
 * @author fengshuonan
 * @Date 2018-05-06 12:13:55
 */
@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {

    private String PREFIX = "/zy/order/";

    @Autowired
    private IOrderService orderService;

    @Autowired
    private ITUserService tUserService;

    @Autowired
    private IOrderProductService orderProductService;

    @Autowired
    private TUserServiceImpl tUserServiceImpl;

    @Autowired
    private IPointsAccountJournalService ptAcctJourService;
    /**
     * 跳转到定单信息首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "order.html";
    }

    /**
     * 跳转到添加定单信息
     */
    @RequestMapping("/order_add")
    public String orderAdd() {
        return PREFIX + "order_add.html";
    }

    /**
     * 跳转到修改定单信息
     */
    @RequestMapping("/order_update/{orderId}")
    public String orderUpdate(@PathVariable Integer orderId, Model model) {
        Order order = orderService.selectById(orderId);
        model.addAttribute("item",order);
        model.addAttribute("item",order);
        model.addAttribute("stateName", ConstantFactory.me().getOrderState(order.getState()));
        LogObjectHolder.me().set(order);
        return PREFIX + "order_edit.html";
    }

    /**
     * 商品参数
     */
    @RequestMapping(value = "/order_product/{orderId}")
    public String productParam(@PathVariable Integer orderId, Model model) {
        Order order = orderService.selectById(orderId);
        List<Map<String, Object>> orderProduct = orderProductService
                .selectMaps(new EntityWrapper<OrderProduct>()
                        .eq("orderId",orderId));

        Object objects = new ProductWarpper(orderProduct).warp();
        model.addAttribute("orderProduct", orderProduct);
        LogObjectHolder.me().set(order);
        return PREFIX + "order_product.html";
    }

    /**
     * 获取定单信息列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        //return orderService.selectList(null);
        List<Map<String, Object>> orderList = orderService.selectMaps(null);
        Object objects = new OrderWarpper(orderList).warp();
        return objects;
    }

    /**
     * 新增定单信息
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Order order) {
        orderService.insert(order);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除定单信息
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer orderId) {
        Order order = orderService.selectById(orderId);
        TUser tUser = tUserService.selectById(order.getUserId());
        tUser.setCloudPoints(tUser.getCloudPoints().add(order.getMoney()));
        tUserService.updateById(tUser);
        orderService.deleteById(orderId);
        return SUCCESS_TIP;
    }

    /**
     * 修改定单信息
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Order order) {
        orderService.updateById(order);
        return super.SUCCESS_TIP;
    }

    /**
     * 确认完成定单信息
     */
    @RequestMapping(value = "/okOrder")
    @ResponseBody
    public Object okOrder(@RequestParam Integer orderId) {
        Order order = orderService.selectById(orderId);
        order.setState(6);
        orderService.updateById(order);

        TUser tUser = tUserService.selectById(order.getUserId());
        //Param param = paramMapper.selectById(1);
        BigDecimal BDamount = new BigDecimal(order.getPoints());
        //写死倍数为1倍
        //BDamount = BDamount.multiply(param.getRechargeTimes());
        //BDamount = BDamount.multiply(1);
        tUser.setPoints(tUser.getPoints().add(BDamount));
        //写入日志
        PointsAccountJournal ptAcctJour = new PointsAccountJournal();
        ptAcctJour.setDescription(tUser.getAccount() + Const.DESC_ADMIN_DEP);
        ptAcctJour.setUserId(tUser.getId());
        ptAcctJour.setPoints(BDamount);
        ptAcctJour.setType(1);//管理员充值
        //获取各级推荐人、设定为股东的级别、各级提成系数
        String jsonPath = ToolUtil.getJarPath(this, Const.JSONRELPATH);
        Map<String, Object> jsonConfig = zyBackgroundUtil.getJsonConfig(jsonPath);
        Map<String, Object> superiors = tUserServiceImpl.getSuperiors(tUser);

        TUser first = (TUser)superiors.get("first");
        TUser second = (TUser)superiors.get("second");
        TUser third = (TUser)superiors.get("third");

        TUser comp = (TUser)superiors.get("comp");
        TUser tech = (TUser)superiors.get("tech");

        TUser lega = (TUser)superiors.get("lega");
        @SuppressWarnings("unchecked")
        Map<String, TUser> mana = (Map<String, TUser>)superiors.get("mana");

        assert jsonConfig != null;
        BigDecimal clientFirstComLev = new BigDecimal(jsonConfig.get("clientFirstCommissionLevel").toString());
        BigDecimal clientSecondComLev = new BigDecimal(jsonConfig.get("clientSecondCommissionLevel").toString());

        BigDecimal internalFirstComLev = new BigDecimal(jsonConfig.get("internalFirstCommissionLevel").toString());
        BigDecimal internalSecondComLev = new BigDecimal(jsonConfig.get("internalSecondCommissionLevel").toString());
        BigDecimal internalThirdComLev = new BigDecimal(jsonConfig.get("internalThirdCommissionLevel").toString());

        BigDecimal compComLev = new BigDecimal(jsonConfig.get("companyCommissionLevel").toString());
        BigDecimal techComLev = new BigDecimal(jsonConfig.get("technicalDepartmentCommissionLevel").toString());
        BigDecimal legaComLev = new BigDecimal(jsonConfig.get("legalPersonCommissionLevel").toString());

        BigDecimal manaComLev = new BigDecimal(jsonConfig.get("managerCommissionLevel").toString());

        String str = jsonConfig.get(Const.PARTNER_USER_LEVEL).toString();
        List<String> CloudCommissionLevel = Arrays.asList(str.split(","));

        if(first != null) {
            if (CloudCommissionLevel.contains(first.getLevel().toString())) {
                if (internalFirstComLev != null) {
                    tUserServiceImpl.depositCommission(first, internalFirstComLev, BDamount,true,tUser.getId(),false);
                }
            }else{
                if (clientFirstComLev != null) {
                    tUserServiceImpl.depositCommission(first, clientFirstComLev, BDamount,false,tUser.getId(),false);
                }
            }
        }

        if(second != null) {
            if (CloudCommissionLevel.contains(second.getLevel().toString())) {
                if (internalSecondComLev != null) {
                    tUserServiceImpl.depositCommission(second, internalSecondComLev, BDamount,true,tUser.getId(),false);
                }
            }else{
                if (clientSecondComLev != null) {
                    tUserServiceImpl.depositCommission(second, clientSecondComLev, BDamount,false,tUser.getId(),false);
                }
            }
        }

        if(third != null) {
            if (CloudCommissionLevel.contains(third.getLevel().toString())) {
                if (internalThirdComLev != null) {
                    tUserServiceImpl.depositCommission(third, internalThirdComLev, BDamount,true,tUser.getId(),false);
                }
            }
        }

        if(comp != null) {
            if (compComLev != null) {
                tUserServiceImpl.depositCommission(comp, compComLev, BDamount,true,tUser.getId(),true);
            }
        }

        if(tech != null) {
            if (techComLev != null) {
                tUserServiceImpl.depositCommission(tech, techComLev, BDamount,true,tUser.getId(),true);
            }
        }

        if(lega != null) {
            if (legaComLev != null) {
                tUserServiceImpl.depositCommission(lega, legaComLev, BDamount,true,tUser.getId(),true);
            }
        }

        if(mana != null) {
            if (manaComLev != null) {
                //tUserServiceImpl.depositCommission(mana, manaComLev, BDamount,true);
                for (TUser key : mana.values()) {
                    tUserServiceImpl.depositCommission(key, manaComLev, BDamount,true,tUser.getId(),true);
                }
            }
        }

        ptAcctJourService.insert(ptAcctJour);
        tUserService.updateById(tUser);

        return super.SUCCESS_TIP;
    }

    /**
     * 定单信息详情
     */
    @RequestMapping(value = "/detail/{orderId}")
    @ResponseBody
    public Object detail(@PathVariable("orderId") Integer orderId) {
        return orderService.selectById(orderId);
    }
}
