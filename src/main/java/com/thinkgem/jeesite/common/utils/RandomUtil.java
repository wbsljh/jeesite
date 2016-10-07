package com.thinkgem.jeesite.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.RandomStringUtils;

/**
 * Utility class for generating random Strings.
 */
public final class RandomUtil {

    private static final int DEF_COUNT = 20;

    private RandomUtil() {
    }

    /**
     * Generates a password.
     *
     * @return the generated password
     */
    public static String generatePassword() {
        return RandomStringUtils.randomAlphanumeric(DEF_COUNT);
    }

    /**
     * Generates an activation key.
     *
     * @return the generated activation key
     */
    public static String generateActivationKey() {
        return RandomStringUtils.randomNumeric(DEF_COUNT);
    }

    /**
    * Generates a reset key.
    *
    * @return the generated reset key
    */
    public static String generateResetKey() {
        return RandomStringUtils.randomNumeric(DEF_COUNT);
    }
    
    /**
     * 生成产品订单号
     *
     * @return 
     */
     public static String generateOrderNo() {
    	 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
    	 String pre = sdf.format(new Date());
         return pre + RandomStringUtils.randomNumeric(6);
     }
}
