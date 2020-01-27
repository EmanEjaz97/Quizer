
import java.io.*;
import java.sql.*;

import javax.servlet.http.*;
import javax.servlet.*;

public class Login extends HttpServlet {

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

        HttpSession session = req.getSession(false);
        PrintWriter out = res.getWriter();

        String username;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/quizer";

            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();

            String query, Username, password;

            Username = req.getParameter("username");
            password = req.getParameter("password");

            query = "SELECT * FROM student";

            ResultSet rs = st.executeQuery(query);

            while (rs.next()) {
                String username2 = rs.getString("username");
                String pass = rs.getString(3);
                int studentId = rs.getInt(4);
                username = rs.getString(1);

                if (username2.equals(username) && pass.equals(password)) {
                    session.setAttribute("loggedIn", true);
                    session.setAttribute("isStudent", true);

                    session.setAttribute("user", username);
                    session.setAttribute("studentId", studentId);

                    res.sendRedirect("index.jsp");
                }
            }

            query = "SELECT * FROM instructor";

            rs = st.executeQuery(query);

            while (rs.next()) {
                String instName = rs.getString("teacherName");
                String pass = rs.getString(4);
                int instructorId = rs.getInt(1);

                username = rs.getString(2);

                if (instName.equals(Username) && pass.equals(password)) {
                    session.setAttribute("loggedIn", true);
                    session.setAttribute("isInstructor", true);

                    session.setAttribute("instructorId", instructorId);

                    session.setAttribute("user", username);
                    res.sendRedirect("index.jsp");

                }
            }

            out.println("Invalid Credentials");

        } catch (Exception e) {
            out.println(e);

        }

    }
}