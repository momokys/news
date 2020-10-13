package cn.momoky.news.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @ClassName BeanUtil
 * @Description TODO
 * @Author 钟智峰
 * @Date 2020/10/11 17:52
 * @Version 1.0
 */
public class BeanUtil {

    public static <T> T toObject(Map<String, String[]> map, Class<T> clazz)  {

        T instance = null;
        try {
            instance = clazz.newInstance();
            for (String fieldName: map.keySet()) {
                Field field = clazz.getDeclaredField(fieldName);
                Class<?> type = field.getType();
                Method setter = clazz.getDeclaredMethod("set" + upperFirstLetter(fieldName), type);

                Object value = null;

                if (field.getType().isAssignableFrom(String.class)) {
                    value = map.get(fieldName)[0];
                } else if (field.getType().isAssignableFrom(Integer.class)) {
                    value = Integer.parseInt(map.get(fieldName)[0]);
                } else if (field.getType().isAssignableFrom(Short.class)) {
                    value = Short.parseShort(map.get(fieldName)[0]);
                } else if (field.getType().isAssignableFrom(Byte.class)) {
                    value = Byte.parseByte(map.get(fieldName)[0]);
                } else if (field.getType().isAssignableFrom(Long.class)) {
                    value = Long.parseLong(map.get(fieldName)[0]);
                } else if (field.getType().isAssignableFrom(Boolean.class)) {
                    value = Boolean.parseBoolean(map.get(fieldName)[0]);
                } else if (field.getType().isAssignableFrom(Timestamp.class)) {
                    value = Timestamp.valueOf(map.get(fieldName)[0]);
                } else if (field.getType().isAssignableFrom(Timestamp.class)) {
                    value = Timestamp.valueOf(map.get(fieldName)[0]);
                } else if (field.getType().isAssignableFrom(Date.class)) {
                    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    value = df.parse(map.get(fieldName)[0]);
                } else if (field.getType().isAssignableFrom(List.class)) {
                    List<Object> list = new ArrayList<>();
                }
                setter.invoke(instance, value);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return instance;
    }
    /**
     * @Description 将开头字母大写
     * @param str
     * @return
     */
    private static String upperFirstLetter(String str) {
        return str.substring(0, 1).toUpperCase()+str.substring(1);
    }
}
