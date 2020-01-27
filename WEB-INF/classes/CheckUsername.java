
import java.io.*;
import java.sql.*;

import javax.servlet.http.*;
import javax.servlet.*;

public class CheckUsername extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        PrintWriter out = res.getWriter();

        String username = req.getParameter("q");
        // out.println(email);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/quizer";

            Connection con = DriverManager.getConnection(url, "root", "root");

            Statement st = con.createStatement();

            String query;

            query = "SELECT * FROM instructor where teacherName = '" + username + "'";

            ResultSet rs = st.executeQuery(query);
            int count = 0;
            while (rs.next()) {
                count++;
            }
            if (count > 0) {
                out.println("Username already taken.");
            } else {

                Statement st2 = con.createStatement();

                query = "SELECT * FROM student where username = '" + username + "'";

                ResultSet rs2 = st.executeQuery(query);
                while (rs2.next()) {
                    count++;
                }
                if (count > 0) {
                    out.println("Username already taken.");
                } else {
                    out.println("Username available.");
                }
            }
        } catch (Exception e) {
            out.println(e);

        }

    }
}