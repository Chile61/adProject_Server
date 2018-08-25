package com.stylefeng.guns.zy.modular.user.controller;

import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.db.Db;
import com.stylefeng.guns.core.exception.GunsException;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.rest.common.exception.BizExceptionEnum;
import com.stylefeng.guns.core.util.FileUtil;
import com.stylefeng.guns.rest.common.persistence.dao.RechargeApplyCashMapper;
import com.stylefeng.guns.rest.common.persistence.dao.UserMapper;
import com.stylefeng.guns.rest.common.persistence.dao.UserMgrDao;
import com.stylefeng.guns.rest.common.persistence.dao.WithdrawApplyCloudMapper;
import com.stylefeng.guns.rest.common.persistence.model.RechargeApplyCash;
import com.stylefeng.guns.rest.common.persistence.model.User;
import com.stylefeng.guns.rest.common.persistence.model.WithdrawApplyCloud;
import com.stylefeng.guns.zy.modular.points.service.impl.RechargeApplyCashServiceImpl;
import com.stylefeng.guns.zy.modular.user.service.impl.UserServiceImpl;
import com.stylefeng.guns.zy.modular.util.ZyUtil;
import com.stylefeng.guns.zy.modular.util.securityKit;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.ResourceLoader;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * user控制器
 *
 * @author fengshuonan
 * @Date 2018-01-01 14:37:46
 */
@RestController
@RequestMapping("/user")
public class UserController extends BaseController {

    private final ResourceLoader resourceLoader;

    @Autowired
    public UserController(ResourceLoader resourceLoader) {
        this.resourceLoader = resourceLoader;
    }

    public static final String ROOT = "";

    @Autowired
    ZyUtil zyUtil;

    @Qualifier("userServiceImpl")
    @Autowired
    private UserServiceImpl userService;

    @Resource
    private UserMapper userMapper;

    @Resource
    private RechargeApplyCashMapper rechargeApplyCashMapper;

    @Resource
    private WithdrawApplyCloudMapper withdrawApplyCloudMapper;
    @Autowired
    UserMgrDao userMgrDao;

    /**
     * 注册user
     */
    @ApiOperation(value="用户注册", notes="根据User对象创建用户")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "account", value = "账号", required = true, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "password", value = "密码", required = true, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "phone", value = "联系电话", required = true, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "superior", value = "上级", required = true, dataType = "string", paramType = "query")
    })
    @RequestMapping(value = "/register", method=RequestMethod.POST)
    @ResponseBody
    public Object register(User user,
                           @RequestParam String account,
                           @RequestParam String password,
                           @RequestParam String phone,
                           @RequestParam String superior
                           ) {
        if (superior.isEmpty()){
            Map<String, Object> standardMap = new HashMap<>();
            standardMap.put("status", 0);
            return standardMap;
        }

        user.setAccount(account);
        user.setLevel(9);
        user.setPassword(password);
        user.setPhone(phone);
        user.setRoleid("6");

        if (user.getAccount() == null || user.getPassword() == null || user.getPhone() == null || user.getSuperior() == null) {
            throw new GunsException(BizExceptionEnum.REQUEST_NULL);
        }
        User theUser = (User) Db.create(UserMapper.class).selectOneByCon("account", user.getAccount());
        if (theUser != null) {
            throw new GunsException(BizExceptionEnum.USER_ALREADY_REG);
        }
        User superiorUser;
        if (superior.equals("gsgzh")){
            superiorUser= (User) Db.create(UserMapper.class).selectOneByCon("account", "gsgzh");
            if (superiorUser == null) {
                throw new GunsException(BizExceptionEnum.SUPERIOR_NOT_EXISTED);
            }
            user.setSuperior(superiorUser.getId().toString());
        }else{
            superiorUser= (User) Db.create(UserMapper.class).selectOneByCon("account", superior);
            if (superiorUser == null) {
                superiorUser= (User) Db.create(UserMapper.class).selectOneByCon("phone", superior);
                if (superiorUser == null) {
                    throw new GunsException(BizExceptionEnum.SUPERIOR_NOT_EXISTED);
                }else{
                    user.setSuperior(superiorUser.getId().toString());
                }
            }else{
                user.setSuperior(superiorUser.getId().toString());
            }
        }

        if ((User) Db.create(UserMapper.class).selectOneByCon("phone", user.getPhone()) != null) {
            throw new GunsException(BizExceptionEnum.USER_ALREADY_REG);
        }
        if (user.getSuperior() != null) {
            user.setSalt(securityKit.getRandomSalt(5));
            user.setPassword(securityKit.md5(user.getPassword(), user.getSalt()));
            user.setCreatetime(new Date());
            user.setSuperior(superiorUser.getId().toString());

            if (superiorUser.getSuperior() != null) {
                User secondUser = (User) Db.create(UserMapper.class).selectOneByCon("id", superiorUser.getSuperior());
                User thirdUser;
                if (secondUser!=null){
                    user.setSuperiorSecond(secondUser.getId().toString());
                    thirdUser = (User) Db.create(UserMapper.class).selectOneByCon("id", secondUser.getSuperior());
                    if (thirdUser!=null) {
                        user.setSuperiorThird(thirdUser.getId().toString());
                    }
                }
            }

            if (superiorUser.getSuperiors() != null) {
                user.setSuperiors(superiorUser.getSuperiors()+ "," + superiorUser.getId().toString());
            }else{
                user.setSuperiors(superiorUser.getId().toString());
            }
            userService.insert(user);

            if (superiorUser.getLevel() == 5) {
                user.setSuperiorTop(user.getId().toString());
                userService.updateById(user);
            } else {
                if ((superiorUser.getLevel()==6) && (superiorUser.getRoleid().equals("1"))){
                    if (superiorUser.getSuperiorTop().equals(superiorUser.getId().toString())){
                        user.setSuperiorTop(superiorUser.getSuperiorTop());
                    }else{
                        user.setSuperiorTop(superiorUser.getSuperiorTop()+','+superiorUser.getId().toString());
                    }

                    userService.updateById(user);
                }else {
                    user.setSuperiorTop(superiorUser.getSuperiorTop());
                    userService.updateById(user);
                }
            }

            return super.SUCCESS_TIP;
        }
        return super.ERROR;
    }

    /**
     * 删除user
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer userId) {
        userService.deleteById(userId);
        return SUCCESS_TIP;
    }

    /**
     * 修改user
     */
    @ApiOperation(value="修改用户信息", notes="修改用户信息，提交的json对象及数据格式参考注册接口")
    @ApiImplicitParam(name = "user", value = "用户对象user", required = true, dataType = "User")
    @RequestMapping(value = "/update", method=RequestMethod.POST)
    @ResponseBody
    public Object update(@RequestHeader String Authorization, @RequestBody User user) {
        User currentUser = zyUtil.getUserModel(Authorization);
        if (user.getAvatar() != null)
            currentUser.setAvatar(user.getAvatar());
        if (user.getBirthday() != null)
            currentUser.setBirthday(user.getBirthday());
        if (user.getEmail() != null)
            currentUser.setEmail(user.getEmail());
        if (user.getName() != null)
            currentUser.setName(user.getName());
        if (user.getPassword() != null) {
            currentUser.setSalt(securityKit.getRandomSalt(5));
            currentUser.setPassword(securityKit.md5(user.getPassword(), currentUser.getSalt()));
        }
        if (user.getPhone() != null)
            currentUser.setPhone(user.getPhone());
        if (user.getSex() != null)
            currentUser.setSex(user.getSex());
        if (user.getWeiXin() != null)
            currentUser.setWeiXin(user.getWeiXin());
        userService.updateById(currentUser);
        return super.SUCCESS_TIP;
    }

    /**
     * 提交用户认证信息
     */
    @ApiOperation(value="提交用户认证信息", notes="提交用户认证信息，提交的json对象及数据格式参考注册接口")
    @RequestMapping(value = "/uploadCert", method=RequestMethod.POST)
    @ResponseBody
    public Object uploadCert(@RequestHeader String Authorization,@RequestParam String cardID,
                             @RequestParam String name,@RequestParam String birthday,@RequestParam Integer cardType,
                             @RequestParam("file") MultipartFile multiFile) {
        String pictureName = UUID.randomUUID().toString() + ".jpg";
        String fileSavePath = ToolUtil.getJarPath(this, "zyAssets/IDCard"+pictureName);
        User currentUser = zyUtil.getUserModel(Authorization);
        System.out.println("=======================");
        System.out.println(currentUser);
        System.out.println(multiFile);
        System.out.println("=======================");
        try {
            //文件读取并写入
            multiFile.transferTo(new File(fileSavePath));
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (!cardID.equals("")){
            currentUser.setCardID(cardID);
        }
        if (!name.equals("")){
            currentUser.setName(name);
        }
        if (!birthday.equals("")){
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date date=simpleDateFormat.parse(birthday);
                currentUser.setBirthday(date);
                System.out.println(date);
            } catch(ParseException px) {
                px.printStackTrace();
            }
        }
        if (cardType!=null){
            currentUser.setCardType(cardType);
        }
        currentUser.setCardPic(pictureName);
        currentUser.setVerification(1);
//        if (user.getAvatar() != null)
//            currentUser.setAvatar(user.getAvatar());
//        if (user.getBirthday() != null)
//            currentUser.setBirthday(user.getBirthday());
//        if (user.getEmail() != null)
//            currentUser.setEmail(user.getEmail());
//        if (user.getName() != null)
//            currentUser.setName(user.getName());
//        if (user.getPassword() != null) {
//            currentUser.setSalt(securityKit.getRandomSalt(5));
//            currentUser.setPassword(securityKit.md5(user.getPassword(), currentUser.getSalt()));
//        }
//        if (user.getPhone() != null)
//            currentUser.setPhone(user.getPhone());
//        if (user.getSex() != null)
//            currentUser.setSex(user.getSex());
//        if (user.getWeiXin() != null)
//            currentUser.setWeiXin(user.getWeiXin());
        userService.updateById(currentUser);
        return super.SUCCESS_TIP;
    }
    /**
     * user详情
     */
    @ApiOperation(value="获取用户详情", notes="记得在Header里面按协议的要求带上以'Bearer '开头的token")
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    @ResponseBody
    public Object detail(@RequestHeader String Authorization) {
        User user = zyUtil.getUserModel(Authorization);
        //TODO 结果应该用包装类包装直接显示某些字段的实际值。
        Map<String, Object> map = new HashMap<>();
        map.put("userInfo",user);
        return map;
    }

    /**
     * 获取我的粉丝
     */
    @ApiOperation(value="获取我的粉丝", notes="记得在Header里面按协议的要求带上以'Bearer '开头的token")
    @RequestMapping(value = "/supbordinates", method = RequestMethod.GET)
    @ResponseBody
    public Object getSubordinate(@RequestHeader String Authorization) {
        User user = zyUtil.getUserModel(Authorization);
        List<User> subordinates = userMapper.selectList(new EntityWrapper<User>().eq("superior", user.getId()));
        //TODO 加分页。
        return super.returnStandardResult("data",subordinates);
    }

    /**
     * 获取推荐二维码地址
     * @param Authorization
     * @return
     */
    @ApiOperation(value="获取二维码图片地址", notes="")
    @RequestMapping(value = "/getregisterqr", method = RequestMethod.GET)
    @ResponseBody
    public Object getRegisterQr(@RequestHeader String Authorization){
        User user = zyUtil.getUserModel(Authorization);
        //检查二维码是否已经存在
        String recomQRcode = ToolUtil.getJarPath(this, "zyAssets/" + user.getQRcode());
        File file = new File(recomQRcode);
        if (user.getQRcode() == null || !file.exists()) {
            Map<String, Object> recomUser = new HashMap<>();
            recomUser.put("name", user.getName());
            recomUser.put("id", user.getId());
            recomUser.put("account", user.getAccount());
            recomUser.put("qrtype", "register");
            Map userContent = super.returnStandardResult("data", recomUser);
            Object json = JSONArray.toJSON(userContent);
            String recomQRName = userService.genRegisterQr(json, UUID.randomUUID().toString());
            user.setQRcode(recomQRName);
            userService.updateById(user);
            return user.getQRcode();
        }
        return user.getQRcode();
    }

    /**
     * 返回图片
     *
     * @author stylefeng
     * @Date 2017/5/24 23:00
     */
    @RequestMapping("/{recomQRcode}")
    public void renderPicture(@PathVariable("recomQRcode") String recomQRcode, HttpServletResponse response) {
        String path = zyUtil.getJarPath() + "zyAssets/" + recomQRcode + ".jpg";
        System.out.println(path);
        try {
            byte[] bytes = FileUtil.toByteArray(path);
            response.getOutputStream().write(bytes);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 获取是否有用户充值或提现
     */
    @ApiOperation(value="获取是否有用户充值或提现", notes="获取是否有用户充值或提现")
    @RequestMapping(value = "/monitorApply", method=RequestMethod.POST)
    @ResponseBody
    public Object update(@RequestHeader String Authorization) {
        User currentUser = zyUtil.getUserModel(Authorization);
        Map<String, Object> map = new HashMap<>();
        if (currentUser.getManagerApply()){
            List<RechargeApplyCash> rechargeApplyCashCount = rechargeApplyCashMapper.selectList(new EntityWrapper<RechargeApplyCash>().eq("state", 0));
            map.put("applyCash",rechargeApplyCashCount.size());
        }else{
            map.put("applyCash",0);
        }
        if (currentUser.getManagerApply()){
            List<WithdrawApplyCloud> withdrawApplyCloudCount = withdrawApplyCloudMapper.selectList(new EntityWrapper<WithdrawApplyCloud>().eq("state", 0));
            map.put("applyCloud",withdrawApplyCloudCount.size());
        }else{
            map.put("applyCloud",0);
        }
        if (currentUser.getManagerApply()){
            List<WithdrawApplyCloud> withdrawApplyCloudCount = withdrawApplyCloudMapper.selectList(new EntityWrapper<WithdrawApplyCloud>().eq("state", 0));
            map.put("applyCloud",withdrawApplyCloudCount.size());
        }else{
            map.put("applyCloud",0);
        }
        return map;
    }
}
