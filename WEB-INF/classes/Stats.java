
import java.io.*;
import java.sql.*;
import java.util.*;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.*;

// import quizer.StudentsAttemptedQuiz;

import javax.servlet.*;

@SuppressWarnings("unchecked")
public class Stats extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        PrintWriter out = res.getWriter();

        HttpSession session = req.getSession();

        boolean isLoggedIn = (boolean) session.getAttribute("loggedIn");

        if (!isLoggedIn) {
            String redirectURL = "invalidUser.jsp";
            res.sendRedirect(redirectURL);
        }

        List<QuizNInstructorName> quizes = null;
        List<StudentsAttemptedQuiz> studentData = new ArrayList<StudentsAttemptedQuiz>();

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

            int insId = (int) session.getAttribute("instructorId");

            query = "select * from quizes where insId = " + insId + "";

            ResultSet rs = st.executeQuery(query);

            String quizName;
            String attempted;
            int quizId, instructorId;

            while (rs.next()) {
                quizName = rs.getString(2);
                quizId = rs.getInt(1);
                instructorId = rs.getInt(3);
                attempted = rs.getString(4);

                query = "select marks, studentId from attemptedquiz where quizId = " + quizId + " AND attempted='true'";
                Statement temp = con.createStatement();
                ResultSet tempSet = temp.executeQuery(query);

                while (tempSet.next()) {
                    int stuId = tempSet.getInt("studentId");
                    int marks = tempSet.getInt("marks");

                    query = "select username from student where studentId = " + stuId + "";

                    Statement sta = con.createStatement();
                    ResultSet set = sta.executeQuery(query);
                    String stuName = "";
                    if (set.next()) {

                        stuName = set.getString("username");
                    }

                    studentData.add(new StudentsAttemptedQuiz(stuName, quizName, marks));

                }

                // st.close();

                // Statement tempSt = con.createStatement();

                // query = "select teacherName from instructor where instructorId = " +
                // instructorId + "";
                // ResultSet tempRs = tempSt.executeQuery(query);

                // if (tempRs.next()) {
                // instructorName = tempRs.getString(1);
                // }

                // Statement statement = con.createStatement();
                // ResultSet tempResult;
                // int sId = (int) session.getAttribute("studentId");
                // String tempQuery = "select marks from attemptedQuiz where quizId = " + quizId
                // + " AND studentId = "
                // + sId + "";
                // tempResult = statement.executeQuery(tempQuery);
                // int marks = 0;
                // if (tempResult.next()) {
                // marks = tempResult.getInt(1);
                // }

                quizes.add(new QuizNInstructorName(quizName, "instructorName", quizId, instructorId, attempted, 0));
                // String temppSt = quizName + " uploaded by " + instructorName;

                // quizesSt.add(temppSt);

                // tempSt.close();

            }
            // String[] temp = new String[quizesSt.size()];
            // for (int i = 0; i < quizesSt.size(); i++) {
            // temp[i] = quizesSt.get(i);
            // }
            req.setAttribute("quizes_List", quizes);
            req.setAttribute("attemptedQuizes_List", studentData);

            // session.setAttribute("quizesListSt", temp);

            // session.setAttribute("quizesListSess", quizes);

            // res.sendRedirect("quizList.jsp");

            RequestDispatcher dispatch = req.getRequestDispatcher("/instructorStats.jsp");
            dispatch.forward(req, res);

        } catch (Exception e) {
            out.println(e);
        }
        out.close();
    }
}