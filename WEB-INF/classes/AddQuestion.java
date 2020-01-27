
import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
import javax.servlet.*;

@SuppressWarnings("unchecked")
public class AddQuestion extends HttpServlet {

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
            // session.setAttribute("questionList", questions);
        }

        String quizName = req.getParameter("qName");

        String questionStatement = req.getParameter("qStatement");
        String option1 = req.getParameter("option1");
        String option2 = req.getParameter("option2");
        String option3 = req.getParameter("option3");
        String option4 = req.getParameter("option4");
        String correctOpt = req.getParameter("correctAnswer");

        Question newQ = new Question(questionStatement, option1, option2, option3, option4, correctOpt);
        // if (questionStatement != null && option2 != null && option3 != null &&
        // option4 != null) {
        questions.add(newQ);
        // }

        boolean flag;

        flag = (boolean) session.getAttribute("quizNameAdded");

        if (!flag) {
            session.setAttribute("quizName", quizName);
            session.setAttribute("quizNameAdded", true);
        }

        session.setAttribute("questionList", questions);

        res.sendRedirect("makeQuiz.jsp");

        out.close();
    }
}