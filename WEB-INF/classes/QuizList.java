
import java.io.*;
import java.sql.*;
import java.util.*;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.*;
import javax.servlet.*;

@SuppressWarnings("unchecked")
public class QuizList extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();

        HttpSession session = req.getSession();
        boolean loggedIn = (boolean) session.getAttribute("loggedIn");

        if (!loggedIn) {
            String redirectURL = "invalidUser.jsp";
            res.sendRedirect(redirectURL);
        }

        List<QuizNInstructorName> quizes = null;
        // List<String> quizesSt = (List<String>) session.getAttribute("quizesListSt");

        if (quizes == null) {
            quizes = new ArrayList<QuizNInstructorName>();
            // quizesSt = new ArrayList<String>();

            session.setAttribute("quizesList", quizes);
            // session.setAttribute("quizesListSt", quizesSt);

        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/quizer";

            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();
            String query;

            query = "select * from quizes";

            ResultSet rs = st.executeQuery(query);

            String quizName, instructorName = "x";
            String attempted = "";
            int quizId, instructorId;

            while (rs.next()) {
                quizName = rs.getString(2);
                quizId = rs.getInt(1);
                instructorId = rs.getInt(3);

                // st.close();

                Statement tempSt = con.createStatement();

                query = "select teacherName from instructor where instructorId = " + instructorId + "";
                ResultSet tempRs = tempSt.executeQuery(query);

                if (tempRs.next()) {
                    instructorName = tempRs.getString(1);
                }

                Statement statement = con.createStatement();
                ResultSet tempResult;
                int sId = (int) session.getAttribute("studentId");

                Statement statement2 = con.createStatement();
                // ResultSet tempResult2;
                int t = -1;
                String sql = "update attemptedquiz set studentId = " + sId + " where marks = " + t + "";
                statement2.executeUpdate(sql);

                String tempQuery = "select marks, attempted from attemptedQuiz where quizId = " + quizId
                        + " AND studentId = " + sId + "";
                tempResult = statement.executeQuery(tempQuery);
                int marks = 0;
                if (tempResult.next()) {
                    marks = tempResult.getInt(1);
                    attempted = tempResult.getString(2);
                }

                // out.println(attempted);

                quizes.add(new QuizNInstructorName(quizName, instructorName, quizId, instructorId, attempted, marks));
                // String temppSt = quizName + " uploaded by " + instructorName;

                // quizesSt.add(temppSt);

                // tempSt.close();

            }
            // String[] temp = new String[quizesSt.size()];
            // for (int i = 0; i < quizesSt.size(); i++) {
            // temp[i] = quizesSt.get(i);
            // }
            req.setAttribute("quizes_List", quizes);

            // session.setAttribute("quizesListSt", temp);

            session.setAttribute("quizesListSess", quizes);

            // res.sendRedirect("quizList.jsp");

            RequestDispatcher dispatch = req.getRequestDispatcher("/quizList.jsp");
            dispatch.forward(req, res);

        } catch (Exception e) {
            out.println(e);
        }
        out.close();
    }
}