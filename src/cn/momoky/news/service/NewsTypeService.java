package cn.momoky.news.service;

import cn.momoky.news.dao.NewsTypeDao;
import cn.momoky.news.domain.NewsType;
import cn.momoky.news.domain.PageBean;

import java.util.List;

/**
 * @ClassName NewTypeService
 * @Description TODO
 * @Author 钟智峰
 * @Date 2020/10/10 16:18
 * @Version 1.0
 */

public class NewsTypeService extends BaseService {
    private NewsTypeDao dao;

    public NewsTypeService() {
        dao = factory.getMapper(NewsTypeDao.class);
    }

    public List<NewsType> findAll() {
        return dao.findAll();
    }

    public boolean delByTypeId(Integer typeId) {
        return dao.delByTypeId(typeId) > 0;
    }

    public boolean update(NewsType newsType) {
        return dao.update(newsType) > 0;
    }

    public Long add(NewsType newsType) {
        return dao.add(newsType);
    }

    public List<NewsType> findPage(String typename, String remark, PageBean p) {
        return dao.findPage("%"+typename+"%", "%"+remark+"%", p.getStart(), p.getPageCount());
    }

    public Long count(String typename, String remark) {
        return dao.count("%"+typename+"%", "%"+remark+"%");
    }
}
