
import java.io.*;
import java.sql.*;
import java.util.*;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.*;

// import quizer.StudentsAttemptedQuiz;

import javax.servlet.*;

@SuppressWarnings("unchecked")
public class Validate extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();

        HttpSession session = req.getSession();

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("name");
        String repswd = req.getParameter("repswd");

        out.println(name);

        // try {
        // Class.forName("com.mysql.jdbc.Driver");
        // String url = "jdbc:mysql://127.0.0.1/quizer";

        // Connection con = DriverManager.getConnection(url, "root", "root");

        // Statement st = con.createStatement();
        // String query;

        // } catch (Exception e) {
        // out.println(e);
        // }
        out.close();
    }
}