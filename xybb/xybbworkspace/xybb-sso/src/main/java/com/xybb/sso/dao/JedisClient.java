package com.xybb.sso.dao;

public interface JedisClient {
    String get(String key);
    String set(String key, String value);
    String hget(String hkey, String key);
    Long hset(String hkey, String key, String value);
    Long incr(String key);
    Long expire(String key, int second);
    Long ttl(String key);
    Long del(String key);
    Long hdel(String hkey, String key);
}
