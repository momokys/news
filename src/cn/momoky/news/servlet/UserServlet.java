package cn.momoky.news.servlet;

import cn.momoky.news.domain.RespBean;
import cn.momoky.news.domain.User;
import cn.momoky.news.service.UserService;
import cn.momoky.news.utils.BeanUtil;
import com.alibaba.fastjson.JSON;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @ClassName UserServlet
 * @Description TODO
 * @Author 钟智峰
 * @Date 2020/10/12 9:57
 * @Version 1.0
 */


@WebServlet("/user/*")
public class UserServlet extends BaseServlet {

    private final UserService service = new UserService();

    public void login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        User loginUser = BeanUtil.toObject(req.getParameterMap(), User.class);

        User user = service.findByUserName(loginUser.getUsername());

        RespBean<Object> respBean = new RespBean<>();
        if (user == null) {
            respBean.setCode(-1);
            respBean.setMsg("用户名不存在");
        } else if (!loginUser.getUserpwd().equals(user.getUserpwd())) {
            respBean.setCode(-1);
            respBean.setMsg("密码错误");
        } else {
            req.getSession().setAttribute("user", user);
            respBean.setCode(0);
        }

        resp.getWriter().write(JSON.toJSONString(respBean));
    }

}
