
import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.http.*;
import javax.servlet.*;

public class DeleteQuestion extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession();

        boolean isLoggedIn = (boolean) session.getAttribute("loggedIn");

        if (!isLoggedIn) {
            String redirectURL = "invalidUser.jsp";
            res.sendRedirect("invalidUser.jsp");
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

        String id = req.getParameter("qId");
        int quizId = Integer.parseInt(id);

        String questionStatement = req.getParameter("q");

        out.println(quizId);
        out.println(questionStatement);
        int insId = (int) session.getAttribute("instructorId");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/quizer";

            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();

            String query;

            query = "select questionId from questions where quizId = " + quizId + " AND questionName = '"
                    + questionStatement + "'";

            ResultSet rs = st.executeQuery(query);

            int qId;
            while (rs.next()) {
                qId = rs.getInt("questionId");

                query = "delete from options where questionId = " + qId + "";

                Statement tempSt = con.createStatement();
                int tempVal = tempSt.executeUpdate(query);
            }

            query = "delete from questions where quizId = " + quizId + " AND questionName = '" + questionStatement
                    + "'";

            Statement tempSt = con.createStatement();
            int tempVal = tempSt.executeUpdate(query);

            // res.sendRedirect("EditQuiz?quizId=" + quizId);
        } catch (Exception e) {
            out.println(e);

        }

    }
}