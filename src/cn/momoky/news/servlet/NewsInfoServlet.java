package cn.momoky.news.servlet;

import cn.momoky.news.domain.PageBean;
import cn.momoky.news.domain.RespBean;
import cn.momoky.news.domain.VNewInfo;
import cn.momoky.news.service.VNewsInfoService;
import com.alibaba.fastjson.JSON;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @ClassName NewsInfoServlet
 * @Description TODO
 * @Author 钟智峰
 * @Date 2020/10/11 14:09
 * @Version 1.0
 */
@WebServlet("/news_info/*")
public class NewsInfoServlet extends BaseServlet {

    private VNewsInfoService vservice = new VNewsInfoService();

    public void find(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer currentPage = Integer.parseInt(req.getParameter("page"));
        Integer pageCount = Integer.parseInt(req.getParameter("limit"));

        Integer totalCount = vservice.count().intValue();

        PageBean p = new PageBean(totalCount, pageCount, currentPage);

        List<VNewInfo> page = vservice.findPage(p);

        RespBean<List<VNewInfo>> respBean = new RespBean<>();

        respBean.setData(page);
        respBean.setCount(p.getTotalCount());

        resp.getWriter().write(JSON.toJSONString(respBean));
    }

}
