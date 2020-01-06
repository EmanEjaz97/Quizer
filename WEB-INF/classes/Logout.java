import java.io.*;
import java.sql.*;

import javax.servlet.http.*;
import javax.servlet.*;

public class Logout extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();

        HttpSession session = req.getSession();
        session.invalidate();

        res.sendRedirect("index.jsp");
        out.print("You are successfully logged out!");

        out.close();
    }
}