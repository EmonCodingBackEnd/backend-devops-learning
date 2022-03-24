package com.coidng.devops.user.controller;

import com.coding.devops.thrift.user.UserInfo;
import com.coidng.devops.user.dto.UserDTO;
import com.coidng.devops.user.redis.RedisClient;
import com.coidng.devops.user.response.LoginResponse;
import com.coidng.devops.user.response.Response;
import com.coidng.devops.user.thrift.ServiceProvider;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.thrift.TException;
import org.apache.tomcat.util.buf.HexUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Controller
public class UserController {

    @Autowired private ServiceProvider serviceProvider;
    @Autowired private RedisClient redisClient;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Response login(
            @RequestParam("username") String username, @RequestParam("password") String password) {
        // 1.验证用户名密码
        UserInfo userInfo = null;
        try {
            userInfo = serviceProvider.getUserService().getUserByName(username);
        } catch (TException e) {
            e.printStackTrace();
            return Response.USERNAME_PASSWORD;
        }

        if (userInfo == null) {
            return Response.USERNAME_PASSWORD;
        }

        if (!userInfo.getPassword().equalsIgnoreCase(md5(password))) {
            return Response.USERNAME_PASSWORD;
        }

        // 2.生成token
        String token = getToken();

        // 3.缓存用户
        redisClient.set(token, toDTO(userInfo), 3600);

        return new LoginResponse(token);
    }

    private UserDTO toDTO(UserInfo userInfo) {
        UserDTO userDTO = new UserDTO();
        BeanUtils.copyProperties(userInfo, userDTO);
        return userDTO;
    }

    private String getToken() {
        return RandomStringUtils.random(32, "0123456789abcdefghijklmnopqrstuvwxyz");
    }

    private String md5(String password) {
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte[] md5Bytes = md5.digest(password.getBytes(StandardCharsets.UTF_8));
            return HexUtils.toHexString(md5Bytes);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }
}
