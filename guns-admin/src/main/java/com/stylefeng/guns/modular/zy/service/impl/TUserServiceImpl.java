package com.stylefeng.guns.modular.zy.service.impl;

import com.stylefeng.guns.common.constant.Const;
import com.stylefeng.guns.common.persistence.model.CloudPointsAccountJournal;
import com.stylefeng.guns.common.persistence.model.PointsAccountJournal;
import com.stylefeng.guns.common.persistence.model.TUser;
import com.stylefeng.guns.common.persistence.dao.TUserMapper;
import com.stylefeng.guns.core.db.Db;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.core.util.zyBackgroundUtil;
import com.stylefeng.guns.modular.zy.service.ICloudPointsAccountJournalService;
import com.stylefeng.guns.modular.zy.service.IPointsAccountJournalService;
import com.stylefeng.guns.modular.zy.service.ITUserService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

/**
 * <p>
 * 管理员表 服务实现类
 * </p>
 *
 * @author jerry
 * @since 2018-01-06
 */
@Service
public class TUserServiceImpl extends ServiceImpl<TUserMapper, TUser> implements ITUserService {

    @Autowired
    private IPointsAccountJournalService ptAcctJourService;

    @Autowired
    private ICloudPointsAccountJournalService cloudPtAcctJourService;

    @Autowired
    private ITUserService tUserService;

	public Map<String, Object> getSuperiors (TUser user) {
        Map<String, Object> superiors = new HashMap<>();
        TUser first = null;
        TUser second = null;
        TUser third = null;
        TUser comp = null;
        TUser tech = null;
        TUser lega = null;

        first = (TUser) Db.create(TUserMapper.class).selectOneByCon("id", user.getSuperior());
        if (first == null ) {
            return superiors;
        }
        if (!first.getAccount().equals("hxjsb") && !first.getAccount().equals("gsgzh")){
            superiors.put("first", first);
        }
        second = (TUser) Db.create(TUserMapper.class).selectOneByCon("id", first.getSuperior());
        if (second != null) {
            if (!second.getAccount().equals("hxjsb") && !second.getAccount().equals("gsgzh")){
                superiors.put("second", second);
            }
            third = (TUser) Db.create(TUserMapper.class).selectOneByCon("id", second.getSuperior());
        }
        if (third != null) {
            if (!third.getAccount().equals("hxjsb") && !third.getAccount().equals("gsgzh")){
                superiors.put("third", third);
            }
        }
        comp = (TUser) Db.create(TUserMapper.class).selectOneByCon("account", "gsgzh");
        if (comp != null) {
            superiors.put("comp", comp);
        }

        tech = (TUser) Db.create(TUserMapper.class).selectOneByCon("account", "hxjsb");
        if (tech != null) {
            superiors.put("tech", tech);
        }

        lega = (TUser) Db.create(TUserMapper.class).selectOneByCon("account", "wxx");
        if (lega != null) {
            superiors.put("lega", lega);
        }

        String[] superiorTopIdList = null;
        if (user.getSuperiorTop()!=null){
            superiorTopIdList = user.getSuperiorTop().split(",");
        }
        //String[] superiorTopIdList = user.getSuperiorTop().split(",");

        Map<String, TUser> superiorTopList = new HashMap<>();
        if (superiorTopIdList!=null){
            for (String id : superiorTopIdList) {
                TUser mana = (TUser) Db.create(TUserMapper.class).selectOneByCon("id", id);
                if (mana.getLevel()==6 && mana.getRoleid().equals("1")){
                    superiorTopList.put(id,(TUser) Db.create(TUserMapper.class).selectOneByCon("id", id));
                }
            }
        }

        if (superiorTopList.size()!=0 ) {
            superiors.put("mana", superiorTopList);
        }
        return superiors;
    }

    public Map<String, TUser> getSuperiors (String superiorId) {
        Map<String, TUser> superiors = new HashMap<>();
        TUser first = null;
        TUser second = null;
        TUser third = null;
        first = (TUser) Db.create(TUserMapper.class).selectOneByCon("id", superiorId);
        if (first == null ) {
            return superiors;
        }
        superiors.put("first", first);
        second = (TUser) Db.create(TUserMapper.class).selectOneByCon("id", first.getSuperior());
        if (second != null) {
            superiors.put("second", second);
            third = (TUser) Db.create(TUserMapper.class).selectOneByCon("id", second.getSuperior());
        }
        if (third != null) {
            superiors.put("third", third);
        }
        return superiors;
    }

    public TUser depositCommission (TUser user,BigDecimal commissionLevel,BigDecimal amount,boolean isInternal,Integer formId,boolean isManage) {
//	    //获取提成规则
//        String jsonPath = ToolUtil.getJarPath(this, Const.JSONRELPATH);
//        Map<String, Object> jsonConfig = zyBackgroundUtil.getJsonConfig(jsonPath);
//        assert jsonConfig != null;
//        String str = jsonConfig.get(Const.PARTNER_USER_LEVEL).toString();
//        List<String> CloudCommissionLevel = Arrays.asList(str.split(","));
        TUser saveUser = tUserService.selectById(user.getId());
        //股东用户给予云积分提成
        if (isInternal) {
            BigDecimal commission = amount.multiply(commissionLevel);
            saveUser.setCloudPoints(saveUser.getCloudPoints().add(commission));

            CloudPointsAccountJournal cloudPtAcctJour = new CloudPointsAccountJournal();

            cloudPtAcctJour.setUserId(saveUser.getId());
            cloudPtAcctJour.setPoints(commission);
            if (isManage){
                cloudPtAcctJour.setType(6);
                cloudPtAcctJour.setDescription(saveUser.getAccount() + Const.DESC_SALES_MAMAGE);
            }else {
                cloudPtAcctJour.setType(2);
                cloudPtAcctJour.setDescription(saveUser.getAccount() + Const.DESC_SALES_COMMISON);
            }
            cloudPtAcctJour.setFromId(formId);
            tUserService.updateById(saveUser);
            cloudPtAcctJourService.insert(cloudPtAcctJour);
        } else { //消费用户给予积分提成
            BigDecimal commission = amount.multiply(commissionLevel);
            saveUser.setPoints(saveUser.getPoints().add(commission));

            PointsAccountJournal ptAcctJour = new PointsAccountJournal();
            ptAcctJour.setDescription(saveUser.getAccount() + Const.DESC_SALES_COMMISON);
            ptAcctJour.setUserId(saveUser.getId());
            ptAcctJour.setPoints(commission);
            ptAcctJour.setType(2);
            ptAcctJour.setFromId(formId);

            tUserService.updateById(saveUser);
            ptAcctJourService.insert(ptAcctJour);
        }
        return saveUser;
    }
}
