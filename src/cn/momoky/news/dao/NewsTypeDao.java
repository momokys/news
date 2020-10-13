package cn.momoky.news.dao;

import cn.momoky.annotation.*;
import cn.momoky.news.domain.NewsType;

import java.util.List;

@Mapper
public interface NewsTypeDao {

    @Query(sql = "select * from newstype")
    List<NewsType> findAll();

    @Delete(sql = "delete from newstype where typeid = #{typeId}")
    Integer delByTypeId(@Param(name = "typeId") Integer typeId);

    @Update(sql = "update newstype set typename = #{n.typename}, remark = #{n.remark} where typeid = #{n.typeid}")
    Integer update(@Param(name = "n") NewsType newsType);

    @Insert(sql = "insert into newstype(typename, remark) values(#{n.typename}, #{n.remark})", generatedKey = true)
    Long add(@Param(name = "n") NewsType newsType);

    @Query(sql = "select * from newstype where typename like #{typename} and remark like #{remark} limit #{start}, #{pageCount}")
    List<NewsType> findPage(@Param(name = "typename") String typename,
                            @Param(name = "remark") String remark,
                            @Param(name = "start") Integer start,
                            @Param(name = "pageCount") Integer pageCount);

    @Query(sql = "select count(typeid) from newstype where typename like #{typename} and remark like #{remark}")
    Long count(@Param(name = "typename") String typename,
               @Param(name = "remark") String remark);
}
