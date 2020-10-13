package cn.momoky.news.service;

import cn.momoky.sql.SqlMapperFactory;
import cn.momoky.sql.SqlMapperFactoryBuilder;

/**
 * @ClassName BaseService
 * @Description TODO
 * @Author 钟智峰
 * @Date 2020/10/10 13:59
 * @Version 1.0
 */
public abstract class BaseService {

    protected static SqlMapperFactory factory = SqlMapperFactoryBuilder.build("../SqlMapperConfig.properties");

}
