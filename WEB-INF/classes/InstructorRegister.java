
import java.io.*;
import java.sql.*;

import javax.servlet.http.*;
import javax.servlet.*;

public class InstructorRegister extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        HttpSession session = req.getSession(false);

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

            query = "Insert into instructor (email, password, teacherName) values ('" + email + "', '" + password
                    + "', '" + username + "')";

            int rs = st.executeUpdate(query);

            query = "select instructorId from instructor where teacherName = '" + username + "'";
            Statement statement = con.createStatement();
            ResultSet resultSet;
            resultSet = statement.executeQuery(query);
            int insId = 0;
            if (resultSet.next()) {
                insId = resultSet.getInt("instructorId");
            }

            session.setAttribute("instructorId", insId);

            session.setAttribute("isInstructor", true);
            session.setAttribute("loggedIn", true);

            session.setAttribute("user", username);
            res.sendRedirect("index.jsp");

        } catch (Exception e) {
            out.println(e);

        }

    }
}