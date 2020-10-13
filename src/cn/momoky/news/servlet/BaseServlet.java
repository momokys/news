package cn.momoky.news.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * @ClassName BaseServlet
 * @Description TODO
 * @Author 钟智峰
 * @Date 2020/10/10 18:18
 * @Version 1.0
 */
public abstract class BaseServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String uri = req.getRequestURI();

        String methodName = uri.substring(uri.lastIndexOf('/') + 1);

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");

        System.out.println("api: "+this.getClass().getName()+"."+methodName);

        try {
            Method method = this.getClass().getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            method.invoke(this, req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
