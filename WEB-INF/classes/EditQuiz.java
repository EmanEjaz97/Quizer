
import java.io.*;
import java.sql.*;
import java.util.*;

import javax.servlet.http.*;
import javax.servlet.*;

public class EditQuiz extends HttpServlet {
    // public void doGet(HttpServletRequest req, HttpServletResponse res) throws
    // ServletException, IOException {

    // PrintWriter out = res.getWriter();
    // HttpSession session = req.getSession();

    // boolean isLoggedIn = (boolean) session.getAttribute("loggedIn");

    // // if (!isLoggedIn) {
    // // String redirectURL = "invalidUser.jsp";
    // // res.sendRedirect("invalidUser.jsp");
    // // } else {
    // // String redirectURL = "invalidUser.jsp";
    // // res.sendRedirect("attemptError.jsp");

    // // }

    // }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        PrintWriter out = res.getWriter();
        HttpSession session = req.getSession();

        boolean isLoggedIn = (boolean) session.getAttribute("loggedIn");

        if (!isLoggedIn) {
            String redirectURL = "invalidUser.jsp";
            res.sendRedirect("invalidUser.jsp");
        }

        String username;

        String id = req.getParameter("quizId");
        int quizId = Integer.parseInt(id);

        out.println(id);

        // String quizName = req.getParameter("qName");

        ArrayList<Question> questions = new ArrayList<Question>();

        try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/quizer";

        Connection con = DriverManager.getConnection(url, "root", "root");

        Statement st = con.createStatement();

        String query;

        query = "select * from questions where quizId = " + quizId + "";

        ResultSet rs = st.executeQuery(query);

        String questionStatement;
        String option1;
        String option2;
        String option3;
        String option4;
        String correctOpt;

        String[] options = new String[4];
        int count = 0;

        int qId;
        while (rs.next()) {
        count = 0;
        questionStatement = rs.getString(2);
        correctOpt = rs.getString(4);
        qId = rs.getInt(1);

        query = "select opt from options where questionId = " + qId + "";

        Statement tempSt = con.createStatement();
        ResultSet tempRs = tempSt.executeQuery(query);

        while (tempRs.next()) {
        options[count] = tempRs.getString(1);
        count++;
        }

        option1 = options[0];
        option2 = options[1];
        option3 = options[2];
        option4 = options[3];

        questions.add(new Question(questionStatement, option1, option2, option3,
        option4, correctOpt));

        }
        out.println(questions.size());
        req.setAttribute("questions_List", questions);
        session.setAttribute("questions_List_Session", questions);

        RequestDispatcher dispatch = req.getRequestDispatcher("/editQuiz.jsp");
        dispatch.forward(req, res);

        } catch (Exception e) {
        out.println(e);

        }

    }
}