package com.xybb.common.utils;

import java.util.UUID;

public class CoreUtils {

    public static String salt(){
        return UUID.randomUUID().toString().replace("-", "").toLowerCase();
    }
}
