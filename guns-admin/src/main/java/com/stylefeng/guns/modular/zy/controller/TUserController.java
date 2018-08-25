package com.stylefeng.guns.modular.zy.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.common.annotion.BussinessLog;
import com.stylefeng.guns.common.constant.Const;
import com.stylefeng.guns.common.exception.BizExceptionEnum;
import com.stylefeng.guns.common.persistence.dao.ParamMapper;
import com.stylefeng.guns.common.persistence.dao.TUserMapper;
import com.stylefeng.guns.common.persistence.model.*;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.db.Db;
import com.stylefeng.guns.core.exception.GunsException;
import com.stylefeng.guns.core.shiro.ShiroKit;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.core.util.zyBackgroundUtil;
import com.stylefeng.guns.modular.zy.service.ICloudPointsAccountJournalService;
import com.stylefeng.guns.modular.zy.service.IPointsAccountJournalService;
import com.stylefeng.guns.modular.zy.service.IWithdrawLogService;
import com.stylefeng.guns.modular.zy.service.impl.TUserServiceImpl;
import com.stylefeng.guns.modular.zy.warpper.TUserWarpper;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import com.stylefeng.guns.modular.zy.service.ITUserService;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * zyAdminUsers控制器
 *
 * @author jerry
 * @Date 2018-01-06 22:36:24
 */
@Controller
@RequestMapping("/tUser")
public class TUserController extends BaseController {

    private String PREFIX = "/zy/tUser/";

    @Autowired
    private ITUserService tUserService;

    @Autowired
    private TUserServiceImpl tUserServiceImpl;

    @Autowired
    private IPointsAccountJournalService ptAcctJourService;

    @Autowired
    private ICloudPointsAccountJournalService cloudAcctJourService;

    @Autowired
    private IWithdrawLogService withdrawLogService;

    @Resource
    private TUserMapper tUserMapper;
    /**
     * 跳转到zyAdminUsers首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "tUser.html";
    }

    /**
     * 跳转到添加zyAdminUsers
     */
    @RequestMapping("/tUser_add")
    public String tUserAdd() {
        return PREFIX + "tUser_add.html";
    }

    /**
     * 跳转到修改zyAdminUsers
     */
    @RequestMapping("/tUser_update/{tUserId}")
    public String tUserUpdate(@PathVariable Integer tUserId, Model model) {
        TUser tUser = tUserService.selectById(tUserId);
        model.addAttribute("item",tUser);
        LogObjectHolder.me().set(tUser);
        return PREFIX + "tUser_edit.html";
    }

    /**
     * 跳转到网页注册页面
     * @param superior 推荐人ID
     */
    @ApiOperation(value="网页版用户注册", notes="/register_page/{superior}")
    @ApiImplicitParam(name = "superior", value = "推荐人id", required = true, dataType = "string", paramType = "query")
    @RequestMapping(value = "/register_page", method= RequestMethod.GET)
    public String tUserRegisterPage(@RequestParam String superior, Model model) {
        model.addAttribute("superior", superior);
        return PREFIX + "register.html";
    }

    /**
     * 跳转到充值积分页面
     */
    @RequestMapping("/tUser_deposit/{tUserId}")
    public String tUserDeposit(@PathVariable Integer tUserId, Model model) {
        TUser tUser = tUserService.selectById(tUserId);
        model.addAttribute("item",tUser);
        LogObjectHolder.me().set(tUser);
        return PREFIX + "tUser_deposit_points.html";
    }

    /**
     * 跳转到充值现金账户页面
     */
    @RequestMapping("/tUser_deposit_cash/{tUserId}")
    public String tUserCash(@PathVariable Integer tUserId, Model model) {
        TUser tUser = tUserService.selectById(tUserId);
        model.addAttribute("item",tUser);
        LogObjectHolder.me().set(tUser);
        return PREFIX + "tUser_deposit_cash.html";
    }
    /**
     * 账户充值现金
     */
    @RequestMapping(value = "/deposit_cash")
    @ResponseBody
    public Object depositCash(String depositCash) {
        TUser tUser = (TUser) LogObjectHolder.me().get();
        BigDecimal BDcash = new BigDecimal(depositCash);
        tUser.setCash(tUser.getCash().add(BDcash));
        tUserService.updateById(tUser);
        return "充值现金操作成功";
    }

    /**
     * 账户充值
     */
    @RequestMapping(value = "/deposit")
    @ResponseBody
    public Object deposit(Integer depositPoints) {
        TUser tUser = (TUser) LogObjectHolder.me().get();
        //Param param = paramMapper.selectById(1);
        BigDecimal BDamount = new BigDecimal(depositPoints.toString());
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
        return "充值积分操作成功";
    }

    /**
     * 跳转到云积分提现页面
     */
    @RequestMapping("/tUser_withdraw/{tUserId}")
    public String tUserWithdraw(@PathVariable Integer tUserId, Model model) {
        TUser tUser = tUserService.selectById(tUserId);
        model.addAttribute("item",tUser);
        LogObjectHolder.me().set(tUser);
        return PREFIX + "tUser_withdraw_cloudpoints.html";
    }

    /**
     * 云积分提现
     */
    @RequestMapping(value = "/withdraw")
    @ResponseBody
    public Object withdraw(Integer withdrawCloudPoints) {
        TUser tUser = (TUser) LogObjectHolder.me().get();
        BigDecimal BDamount = new BigDecimal(withdrawCloudPoints.toString());
        if (BDamount.compareTo(tUser.getCloudPoints()) <= 0) {
            BigDecimal Zero = new BigDecimal("0");
            tUser.setCloudPoints(tUser.getCloudPoints().subtract(BDamount));

            CloudPointsAccountJournal cloudAcctJour = new CloudPointsAccountJournal();
            cloudAcctJour.setUserId(tUser.getId());
            cloudAcctJour.setDescription(tUser.getAccount()+"提现");
            cloudAcctJour.setPoints(Zero.subtract(BDamount));
            cloudAcctJour.setType(7);

            WithdrawLog withdrawLog = new WithdrawLog();
            withdrawLog.setOperatorId(ShiroKit.getUser().getId());
            withdrawLog.setUserId(tUser.getId());
            withdrawLog.setPoints(BDamount);

            withdrawLogService.insert(withdrawLog);
            cloudAcctJourService.insert(cloudAcctJour);
            tUserService.updateById(tUser);
            return "提现成功";
        }
        return "当前云积分不足";
    }
    /**
     * 获取zyAdminUsers列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        List<Map<String, Object>> tUsers = tUserService.selectMaps(null);
        for (Map tUser:tUsers) {
                Map<String, TUser> superiors = tUserServiceImpl.getSuperiors(tUser.get("superior").toString());
                if (superiors == null) {
                    continue;
                }
                TUser first = superiors.get("first");
                TUser second = superiors.get("second");
                TUser third = superiors.get("third");
                String firstAccount = "";
                String secondAccount = "";
                String thirdAccount = "";
                if (first != null) {
                    firstAccount = first.getAccount();
                    tUser.put("superior", firstAccount);
                    tUser.put("superiors", firstAccount);
                }
                if (second != null) {
                    secondAccount = second.getAccount();
                    tUser.put("superiors", firstAccount + "," + secondAccount);
                }
                if (third != null) {
                    thirdAccount = third.getAccount();
                    tUser.put("superiors", firstAccount + "," + secondAccount + "," + thirdAccount);
                }
        }
        Object objects = new TUserWarpper(tUsers).warp();
        return objects;
    }

    /**
     * 新增zyAdminUsers
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(TUser tUser) {
        tUserService.insert(tUser);
        return super.SUCCESS_TIP;
    }

    /**
     * 删除zyAdminUsers
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer tUserId) {
        TUser tUser = tUserService.selectById(tUserId);
        tUser.setStatus(3);//逻辑删除
        tUserService.insertOrUpdate(tUser);
        return SUCCESS_TIP;
    }

    /**
     * 修改zyAdminUsers
     */
    @BussinessLog(value = "修改中盈用户信息", key = "account")
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(TUser tUser) {
        if (tUser.getLevel()<6){
            return "系统初始人员不可修改！";
        }
        if (tUser.getPassword() != null && !tUser.getPassword().equals("")) {
            tUser.setSalt(ShiroKit.getRandomSalt(5));
            tUser.setPassword(ShiroKit.md5(tUser.getPassword(), tUser.getSalt()));
        }
        else {
            TUser oldUser = (TUser) LogObjectHolder.me().get();
            tUser.setPassword(oldUser.getPassword());
            tUser.setSalt(oldUser.getSalt());
        }
        tUserService.updateById(tUser);
        return super.SUCCESS_TIP;
    }

    /**
     * 获取我的粉丝
     */
    @RequestMapping(value = "/supbordinates/{tUserId}")
    @ResponseBody
    public Object getSubordinate(@PathVariable("tUserId") String tUserId, Model model) {
        List<TUser> subordinates = tUserMapper.selectList(new EntityWrapper<TUser>().eq("superior", tUserId));

//        model.addAttribute("item",tUser);
//        LogObjectHolder.me().set(tUser);
//        return PREFIX + "tUser_deposit_points.html";
        //TODO 获取我的粉丝
        return super.returnStandardResult("data",subordinates);
    }

    /**
     * zyAdminUsers详情
     */
    @RequestMapping(value = "/detail/{tUserId}")
    @ResponseBody
    public Object detail(@PathVariable("tUserId") Integer tUserId) {
        return tUserService.selectById(tUserId);
    }

    /**
     * 网页版用户注册接口
     */
    @ApiOperation(value="网页版用户注册", notes="根据User对象创建用户")
    @RequestMapping(value = "/webregister", method= RequestMethod.POST)
    @ResponseBody
    public Object webRegister(@Valid TUser user) {
        if (user.getAccount() == null || user.getPassword() == null || user.getPhone() == null) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        TUser theUser = (TUser) Db.create(TUserMapper.class).selectOneByCon("account", user.getAccount());
        if (theUser != null) {
            throw new GunsException(BizExceptionEnum.USER_ALREADY_REG);
        }
        TUser superiorUser = (TUser) Db.create(TUserMapper.class).selectOneByCon("account", user.getSuperior());
        if (superiorUser == null) {
            throw new GunsException(BizExceptionEnum.SUPERIOR_NOT_EXISTED);
        }
        if (((TUser) Db.create(TUserMapper.class).selectOneByCon("phone", user.getPhone())) != null){
            throw new GunsException(BizExceptionEnum.USER_ALREADY_REG);
        }
        user.setSalt(ShiroKit.getRandomSalt(5));
        user.setPassword(ShiroKit.md5(user.getPassword(), user.getSalt()));
        user.setCreatetime(new Date());
        user.setSuperior(superiorUser.getId().toString());
        if (superiorUser.getSuperior() != null) {
            TUser secondUser = (TUser) Db.create(TUserMapper.class).selectOneByCon("id", superiorUser.getSuperior());
            TUser thirdUser = (TUser) Db.create(TUserMapper.class).selectOneByCon("id", secondUser.getSuperior());
            user.setSuperiors(superiorUser.getId().toString() + "," + secondUser.getId().toString() + "," + thirdUser.getId().toString());
        }
        tUserService.insert(user);
        return "注册成功！";
    }
}
