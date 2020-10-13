package cn.momoky.news.service;

import cn.momoky.news.dao.VNewInfoDao;
import cn.momoky.news.domain.PageBean;
import cn.momoky.news.domain.VNewInfo;

import java.util.List;

/**
 * @ClassName VNewsInfoService
 * @Description TODO
 * @Author 钟智峰
 * @Date 2020/10/11 14:06
 * @Version 1.0
 */
public class VNewsInfoService extends BaseService {

    private VNewInfoDao dao;

    public VNewsInfoService() {
        dao = factory.getMapper(VNewInfoDao.class);
    }

    public Long count() {
        return dao.count();
    }

    public List<VNewInfo> findPage(PageBean p) {
        return dao.findPage(p.getStart(), p.getPageCount());
    }
}
