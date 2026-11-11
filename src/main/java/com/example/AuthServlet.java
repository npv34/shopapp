package com.example;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet xử lý các URL bắt đầu bằng /auth/*
 * Ví dụ: /auth/login, /auth/register, /auth/logout
 */
@WebServlet("/auth/*")
public class AuthServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        // Lấy phần đường dẫn sau /auth
        // Ví dụ: req.getPathInfo() sẽ trả về "/login" hoặc "/register"
        String pathInfo = req.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            // Mặc định chuyển hướng về /auth/login
            resp.sendRedirect(req.getContextPath() + "/auth/login");
            return;
        }

        switch (pathInfo) {
            case "/login":
                req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
                break;

            case "/register":
                req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
                break;

            case "/logout":
                // Xử lý đăng xuất (hủy session)
                if (req.getSession(false) != null) {
                    req.getSession().invalidate();
                }
                resp.sendRedirect(req.getContextPath() + "/auth/login");
                break;

            default:
                // Nếu đường dẫn không tồn tại -> trả về lỗi 404
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Trang không tồn tại");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        req.setCharacterEncoding("UTF-8");
        String pathInfo = req.getPathInfo();

        if (pathInfo == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        switch (pathInfo) {
            case "/login":
                handleLogin(req, resp);
                break;

            case "/register":
                handleRegister(req, resp);
                break;

            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }

    /**
     * Xử lý đăng nhập POST /auth/login
     */
    private void handleLogin(HttpServletRequest req, HttpServletResponse resp) 
            throws IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if ("admin".equals(username) && "admin".equals(password)) {
            // Lưu trạng thái đăng nhập vào session nếu cần
            req.getSession().setAttribute("user", username);
            resp.sendRedirect(req.getContextPath() + "/hello?name=" + username);
        } else {
            // Đăng nhập thất bại -> quay lại trang login kèm thông báo lỗi
            resp.sendRedirect(req.getContextPath() + "/auth/login?error=true");
        }
    }

    /**
     * Xử lý đăng ký POST /auth/register
     */
    private void handleRegister(HttpServletRequest req, HttpServletResponse resp) 
            throws IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        // Giả lập logic đăng ký thành công (thực tế sẽ lưu vào Database)
        System.out.println("Đăng ký thành công: " + username + " - " + email);

        // Chuyển hướng sang trang đăng nhập
        resp.sendRedirect(req.getContextPath() + "/auth/login?registered=true");
    }
}
