package cn.momoky.news.dao;

import cn.momoky.annotation.Mapper;
import cn.momoky.annotation.Param;
import cn.momoky.annotation.Query;
import cn.momoky.news.domain.VNewInfo;

import java.util.List;

@Mapper
public interface VNewInfoDao {

    @Query(sql = "select * from v_newsinfo limit #{start}, #{pageCount}")
    List<VNewInfo> findPage(@Param(name = "start") Integer start,
                            @Param(name = "pageCount") Integer pageCount);

    @Query(sql = "select count(newsid) from v_newsinfo")
    Long count();
}
