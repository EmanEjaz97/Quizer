
import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.http.*;
import javax.servlet.*;

public class DeleteQuiz extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession();

        boolean isLoggedIn = (boolean) session.getAttribute("loggedIn");

        if (!isLoggedIn) {
            String redirectURL = "invalidUser.jsp";
            res.sendRedirect("invalidUser.jsp");
        } else {
            String redirectURL = "invalidUser.jsp";
            res.sendRedirect("attemptError.jsp");

        }

    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession();

        boolean isLoggedIn = (boolean) session.getAttribute("loggedIn");

        if (!isLoggedIn) {
            String redirectURL = "invalidUser.jsp";
            res.sendRedirect("invalidUser.jsp");
        }

        String username;

        String id = req.getParameter("temp");
        int quizId = Integer.parseInt(id);

        String quizName = req.getParameter("qName");

        int insId = (int) session.getAttribute("instructorId");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/quizer";

            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();

            String query;

            query = "select questionId from  questions where quizId = " + quizId + "";

            ResultSet rs = st.executeQuery(query);

            int qId;
            while (rs.next()) {
                qId = rs.getInt(1);

                query = "delete from options where questionId = " + qId + "";

                Statement tempSt = con.createStatement();
                int tempVal = tempSt.executeUpdate(query);
            }

            query = "delete from questions where quizId = " + quizId + "";

            Statement tempSt = con.createStatement();
            int tempVal = tempSt.executeUpdate(query);

            query = "delete from quizes where insId = "+insId+" AND quizName = '"+quizName+"'";

            Statement vague = con.createStatement();
            vague.executeUpdate(query);

            res.sendRedirect("Stats");
        } catch (Exception e) {
            out.println(e);

        }

    }
}