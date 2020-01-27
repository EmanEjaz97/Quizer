
import java.io.*;
import java.sql.*;
import java.util.*;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.*;
import javax.servlet.*;

@SuppressWarnings("unchecked")
public class SubmitQuiz extends HttpServlet {

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

        List<Question> questions = (List<Question>) session.getAttribute("questionList");

        if (questions == null) {
            questions = new ArrayList<Question>();
            session.setAttribute("questionList", questions);
        }

        String questionStatementt = req.getParameter("qStatement");
        String option1 = req.getParameter("option1");
        String option2 = req.getParameter("option2");
        String option3 = req.getParameter("option3");
        String option4 = req.getParameter("option4");
        String correctOptt = req.getParameter("correctAnswer");

        Question newQ = new Question(questionStatementt, option1, option2, option3, option4, correctOptt);
        questions.add(newQ);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/quizer";

            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();
            String query;

            boolean statementAdded = (boolean) session.getAttribute("quizNameAdded");
            String quizName;

            if (!statementAdded) {
                quizName = req.getParameter("qName");
            } else {
                quizName = (String) session.getAttribute("quizName");
            }
            int insId = (int) session.getAttribute("instructorId");

            query = "insert into quizes (quizName, insId) values ('" + quizName + "', " + insId + " )";
            int rs = st.executeUpdate(query);

            // st.close();

            Statement st4 = con.createStatement();
            query = "select quizId from quizes where insId = " + insId + " AND quizName = '" + quizName + "'";
            ResultSet rSet = st4.executeQuery(query);

            int quizId = 0;

            if (rSet.next()) {
                quizId = rSet.getInt(1);
            }

            Statement statement = con.createStatement();
            // ResultSet resultSet;

            String sql = "insert into attemptedquiz (quizId) values (" + quizId + ")";
            statement.executeUpdate(sql);
            // st4.close();

            out.println(questions.size());

            for (int i = 0; i < questions.size(); i++) {
                Question temp = questions.get(i);

                String questionStatement = temp.questionStatement;

                String[] options = new String[4];
                options[0] = temp.option1;
                options[1] = temp.option2;
                options[2] = temp.option3;
                options[3] = temp.option4;

                String correctOpt = temp.correctOpt;

                Statement st2 = con.createStatement();

                int questionId = 0;

                query = "insert into questions (questionName, quizId, correctAnswer) values('" + questionStatement
                        + "', " + quizId + ", '" + correctOpt + "')";
                rs = st2.executeUpdate(query);

                // st2.close();

                Statement st3 = con.createStatement();

                query = "select questionId from questions where quizId = " + quizId + " AND questionName = '"
                        + questionStatement + "'";
                rSet = st3.executeQuery(query);

                if (rSet.next()) {
                    questionId = rSet.getInt(1);
                }

                // st3.close();

                for (int j = 0; j < 4; j++) {
                    Statement newStat = con.createStatement();

                    query = "insert into options (opt, questionId) values ('" + options[j] + "'," + questionId + ")";
                    rs = newStat.executeUpdate(query);
                    // newStat.close();
                }

            }
            session.setAttribute("quizNameAdded", false);

            session.setAttribute("questionList", null);

            session.setAttribute("quizUploaded", true);
            res.sendRedirect("uploaded.jsp");

        } catch (Exception e) {
            out.println(e);
        }
        out.close();
    }
}