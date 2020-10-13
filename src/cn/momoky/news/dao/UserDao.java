package cn.momoky.news.dao;

import cn.momoky.annotation.Mapper;
import cn.momoky.annotation.Param;
import cn.momoky.annotation.Query;
import cn.momoky.news.domain.User;

@Mapper
public interface UserDao {

    @Query(sql = "select * from userinfo where username = #{username}")
    User findByUserName(@Param(name = "username") String userName);
}
