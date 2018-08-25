package com.stylefeng.guns.zy.modular.util;

import com.stylefeng.guns.rest.common.persistence.dao.UserMgrDao;
import com.stylefeng.guns.rest.common.persistence.model.User;
import com.stylefeng.guns.rest.modular.auth.util.JwtTokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ZyUtil {

    @Autowired
    UserMgrDao userMgrDao;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    /**
     * 根据token获取用户对象
     * @param authorization
     * @return User
     */
    public User getUserModel (String authorization) {
        String authToken = authorization.substring(7);
        String account = jwtTokenUtil.getUsernameFromToken(authToken);
        User user = userMgrDao.getUserModelByAccount(account);
        return user;
    }

    /**
     * 获取jar包所在目录
     * @return
     */
    public String getJarPath()
    {
        String path = this.getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
        if(path.toUpperCase().indexOf(".JAR") != -1)
        {
            try
            {
                //截取".JAR第一次出现前的字符串"
                String StrPath=path.substring(0, path.toUpperCase().indexOf(".jar".toUpperCase()));
                System.out.println(StrPath);
                //获取“.jar”包的上一层文件夹
                path=StrPath.substring(0,StrPath.lastIndexOf("/") + 1);
            }
            catch(Exception e)
            {
                return "出错了:"+e.toString();
            }
        }
        path = path.replace("file:/","");
        return path;
    }
}
