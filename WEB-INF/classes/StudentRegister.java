import java.io.*;
import java.sql.*;

import javax.servlet.http.*;
import javax.servlet.*;

public class StudentRegister extends HttpServlet {

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
        HttpSession session = req.getSession();
        PrintWriter out = res.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/quizer";

            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();

            String query, email, password, username;

            email = req.getParameter("email");
            password = req.getParameter("password");
            username = req.getParameter("username");

            query = "Insert into student (email, password, username) values ('" + email + "', '" + password + "', '"
                    + username + "')";

            int rs = st.executeUpdate(query);

            query = "select studentId from student where username = '" + username + "'";
            Statement statement = con.createStatement();
            ResultSet resultSet;
            resultSet = statement.executeQuery(query);

            int stuId = 0;
            if (resultSet.next()) {
                stuId = resultSet.getInt("studentId");
            }

            session.setAttribute("studentId", stuId);

            session.setAttribute("loggedIn", true);
            session.setAttribute("isStudent", true);

            session.setAttribute("user", username);

            res.sendRedirect("index.jsp");

        } catch (Exception e) {
            out.println(e);

        }

    }
}