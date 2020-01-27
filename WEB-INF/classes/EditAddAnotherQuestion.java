
import java.io.*;
import java.sql.*;
import java.util.*;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.*;
import javax.servlet.*;

@SuppressWarnings("unchecked")
public class EditAddAnotherQuestion extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession();

        boolean isLoggedIn = (boolean) session.getAttribute("loggedIn");

        if (!isLoggedIn) {
            String redirectURL = "invalidUser.jsp";
            res.sendRedirect("invalidUser.jsp");
        }

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();

        HttpSession session = req.getSession();

        boolean isLoggedIn = (boolean) session.getAttribute("loggedIn");

        if (!isLoggedIn) {
            String redirectURL = "invalidUser.jsp";
            res.sendRedirect(redirectURL);
        }

        String questionStatement = req.getParameter("qStatement");
        String option1 = req.getParameter("option1");
        String option2 = req.getParameter("option2");
        String option3 = req.getParameter("option3");
        String option4 = req.getParameter("option4");
        String correctOpt = req.getParameter("correctAnswer");

        String q = req.getParameter("qId");
        int quizId = Integer.parseInt(q);

        out.println(quizId);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/quizer";

            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();
            int insId = (int) session.getAttribute("instructorId");

            Statement statement = con.createStatement();
            ResultSet resultSet;

            String query = "insert into questions (questionName, quizId, correctAnswer) values('" + questionStatement
                    + "', " + quizId + ", '" + correctOpt + "')";
            int rs = statement.executeUpdate(query);

            // st2.close();

            Statement st3 = con.createStatement();

            query = "select questionId from questions where quizId = " + quizId + " AND questionName = '"
                    + questionStatement + "'";
            resultSet = st3.executeQuery(query);
            int questionId = 0;
            if (resultSet.next()) {
                questionId = resultSet.getInt(1);
            }

            // st3.close();

            String[] options = new String[4];
            options[0] = option1;
            options[1] = option2;
            options[2] = option3;
            options[3] = option4;

            for (int j = 0; j < 4; j++) {
                Statement newStat = con.createStatement();

                query = "insert into options (opt, questionId) values ('" + options[j] + "'," + questionId + ")";
                rs = newStat.executeUpdate(query);
                // newStat.close();
            }

            res.sendRedirect("EditQuiz?quizId=" + quizId);

        } catch (Exception e) {
            out.println(e);
        }
        out.close();
    }
}