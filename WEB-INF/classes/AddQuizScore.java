
import java.io.*;
import java.sql.*;

import javax.servlet.http.*;
import javax.servlet.*;

public class AddQuizScore extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        HttpSession session = req.getSession();
        PrintWriter out = res.getWriter();

        boolean isLoggedIn = (boolean) session.getAttribute("loggedIn");

        if (!isLoggedIn) {
            String redirectURL = "invalidUser.jsp";
            res.sendRedirect(redirectURL);
        }

        int studentId = (int) session.getAttribute("studentId");

        String temp = req.getParameter("q");
        int quizId = Integer.parseInt(temp);

        String s = req.getParameter("marks");
        int marks = Integer.parseInt(s);

        session.setAttribute("marks", marks);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/quizer";

            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();

            String query;

            query = "insert into attemptedquiz (quizId, studentId, marks) values (" + quizId + ", " + studentId + ", "
                    + marks + " )";

            int rs = st.executeUpdate(query);
            String tempString = "disabled";
            query = "UPDATE attemptedquiz SET attempted=('true') WHERE quizId=(" + quizId + ") AND studentId = "
                    + studentId + "";
            Statement st2 = con.createStatement();
            int rs2 = st2.executeUpdate(query);
            session.setAttribute("quizesList", null);

        } catch (Exception e) {
            out.println(e);

        }

    }
}