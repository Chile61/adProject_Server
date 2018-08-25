package com.stylefeng.guns.rest.modular.auth.controller;

import com.stylefeng.guns.core.exception.GunsException;
import com.stylefeng.guns.rest.common.exception.BizExceptionEnum;
import com.stylefeng.guns.rest.common.persistence.dao.UserMapper;
import com.stylefeng.guns.rest.modular.auth.controller.dto.AuthRequest;
import com.stylefeng.guns.rest.modular.auth.controller.dto.AuthResponse;
import com.stylefeng.guns.rest.modular.auth.util.JwtTokenUtil;
import com.stylefeng.guns.rest.modular.auth.validator.IReqValidator;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * 请求验证的
 *
 * @author fengshuonan
 * @Date 2017/8/24 14:22
 */
@RestController
public class AuthController {

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private UserMapper userMapper;

    @Resource(name = "userAuthServiceImpl")
    private IReqValidator reqValidator;

    @ApiOperation(value="获取token和签名", notes="相当于登录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userName", value = "用户名称", required = true, dataType = "string", paramType = "query"),
            @ApiImplicitParam(name = "password", value = "用户密码", required = true, dataType = "string", paramType = "query")
    })
    @RequestMapping(value = "${jwt.auth-path}", method = RequestMethod.POST)
    public ResponseEntity<?> createAuthenticationToken(AuthRequest authRequest) {

        boolean validate = reqValidator.validate(authRequest);

        if (validate) {
            final String randomKey = jwtTokenUtil.getRandomKey();
            final String token = jwtTokenUtil.generateToken(authRequest.getUserName(), randomKey);
            return ResponseEntity.ok(new AuthResponse(token, randomKey));
        } else {
            String user_name = reqValidator.getPhoneUser(authRequest.getUserName());
            authRequest.setUserName(user_name);
            validate = reqValidator.validate(authRequest);
            if (validate){
                final String randomKey = jwtTokenUtil.getRandomKey();
                final String token = jwtTokenUtil.generateToken(authRequest.getUserName(), randomKey);
                return ResponseEntity.ok(new AuthResponse(token, randomKey));
            }else {
                throw new GunsException(BizExceptionEnum.AUTH_REQUEST_ERROR);
            }
        }
    }
}
