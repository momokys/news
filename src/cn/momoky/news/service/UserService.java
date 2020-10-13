package cn.momoky.news.service;

import cn.momoky.news.dao.UserDao;
import cn.momoky.news.domain.User;

/**
 * @ClassName UserService
 * @Description TODO
 * @Author 钟智峰
 * @Date 2020/10/10 14:01
 * @Version 1.0
 */
public class UserService extends BaseService {
    private UserDao dao;

    public UserService() {
        dao = factory.getMapper(UserDao.class);
    }

    public User findByUserName(String userName) {
        return dao.findByUserName(userName);
    }
}
