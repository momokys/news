package cn.momoky.news.filter;

import cn.momoky.news.domain.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "LoginFilter", urlPatterns = "*.jsp")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        /*HttpServletRequest request = (HttpServletRequest) req;
        System.out.println("uri: "+request.getRequestURI());
        chain.doFilter(req, resp);*/

        HttpServletRequest request = (HttpServletRequest) req;
        System.out.println("uri: "+request.getRequestURI());
        if (request.getRequestURI().endsWith("login.jsp")) {
            chain.doFilter(req, resp);
        } else {
            HttpSession session = request.getSession();
            HttpServletResponse response = (HttpServletResponse) resp;
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect(request.getContextPath()+"/login.jsp");
            } else {
                chain.doFilter(req, resp);
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
