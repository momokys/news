package cn.momoky.news.servlet;

import cn.momoky.news.domain.NewsType;
import cn.momoky.news.domain.PageBean;
import cn.momoky.news.domain.RespBean;
import cn.momoky.news.service.NewsTypeService;
import cn.momoky.news.utils.BeanUtil;
import com.alibaba.fastjson.JSON;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "NewsTypeServlet", urlPatterns = "/news_type/*")
public class NewsTypeServlet extends BaseServlet {

    private final NewsTypeService service = new NewsTypeService();

    public void findAll(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<NewsType> all = service.findAll();
        RespBean<List<NewsType>> respBean = new RespBean<>();
        respBean.setData(all);

        resp.getWriter().write(JSON.toJSONString(respBean));
    }

    public void del(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String typeId = req.getParameter("typeid");
        System.out.println(Integer.parseInt(typeId));

        RespBean<Object> respBean = new RespBean<>();
        if (!service.delByTypeId(Integer.parseInt(typeId))) {
            respBean.setCode(-1);
            respBean.setMsg("删除失败!");
        }
        resp.getWriter().write(JSON.toJSONString(respBean));
    }

    public void update(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        NewsType newsType = BeanUtil.toObject(req.getParameterMap(), NewsType.class);
        System.out.println(newsType);

        RespBean<Object> respBean = new RespBean<>();

        if (service.update(newsType)) {
            respBean.setCode(0);
            respBean.setMsg("修改成功");
        } else {
            respBean.setCode(-1);
            respBean.setMsg("修改失败");
        }

        String json = JSON.toJSONString(respBean);

        resp.getWriter().write(json);
    }

    public void add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        NewsType newsType = BeanUtil.toObject(req.getParameterMap(), NewsType.class);

        RespBean<Object> respBean = new RespBean<>();

        if (service.add(newsType) != null) {
            respBean.setCode(0);
            respBean.setMsg("添加成功");
        } else {
            respBean.setCode(-1);
            respBean.setMsg("添加失败");
        }

        resp.getWriter().write(JSON.toJSONString(respBean));
    }

    public void findPage(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String typename = req.getParameter("typename");
        String remark = req.getParameter("remark");

        Integer totalCount = service.count(typename, remark).intValue();
        Integer currentPage = Integer.parseInt(req.getParameter("page"));
        Integer pageCount = Integer.parseInt(req.getParameter("limit"));


        PageBean p = new PageBean(totalCount, pageCount, currentPage);

        List<NewsType> page = service.findPage(typename, remark, p);

        RespBean<List<NewsType>> respBean = new RespBean<>();

        respBean.setData(page);
        respBean.setCount(p.getTotalCount());

        resp.getWriter().write(JSON.toJSONString(respBean));
    }
}
