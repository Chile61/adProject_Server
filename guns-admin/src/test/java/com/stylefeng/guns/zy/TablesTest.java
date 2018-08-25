package com.stylefeng.guns.zy;

import com.stylefeng.guns.base.BaseJunit;
import com.stylefeng.guns.common.persistence.dao.ConversionLogMapper;
import com.stylefeng.guns.common.persistence.model.ConversionLog;
import com.stylefeng.guns.core.db.Db;

import org.springframework.http.MediaType;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import net.minidev.json.JSONObject;
import org.springframework.web.context.WebApplicationContext;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TablesTest extends BaseJunit {
    @Autowired
    private WebApplicationContext context;// 注入WebApplicationContext

    private MockMvc mockMvc;// 模拟MVC对象，通过MockMvcBuilders.webAppContextSetup(this.wac).build()初始化。

    @Before // 在测试开始前初始化工作
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(this.context).build();
    }
    @Test
    public void listCnvLog () {
        List<ConversionLog> cnvs = Db.create(ConversionLogMapper.class).selectOneByConList("userId", "1");
        for (int i = 0; i < cnvs.size(); i++) {
            System.out.println(cnvs.get(i));
        }
    }

    @Test
    public void getReuerst() throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("tUserId", "1");
        MvcResult result = mockMvc.perform(get("/tables/list?tUserId=1")
                .content(JSONObject.toJSONString(map)))
                .andExpect(status().isOk())// 模拟向testRest发送get请求
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8))// 预期返回值的媒体类型text/plain;charset=UTF-8
                .andReturn();// 返回执行请求的结果

        System.out.println(result.getResponse().getContentAsString());
    }
}
