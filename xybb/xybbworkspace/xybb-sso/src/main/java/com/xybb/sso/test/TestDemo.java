package com.xybb.sso.test;

import com.xybb.sso.dao.impl.JedisClientSingle;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class TestDemo {

    private ApplicationContext applicationContext;

    @Before
    public void init() {
        applicationContext = new ClassPathXmlApplicationContext(
                "classpath:applicationContext.xml");
    }

    @Test
    public void testJedisPool() {
        JedisClientSingle jedis = (JedisClientSingle) applicationContext.getBean("jedisClientSingle");
        jedis.set("name", "lisi");
        String name = jedis.get("name");
        System.out.println(name);
        Long re = jedis.del("TOKENS");
        System.out.println(re);
    }

}
