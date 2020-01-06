// package quizer;

// import java.sql.*;
// import java.util.*;

// import javax.sql.DataSource;

// public class QuestionDBUtil {
// private DataSource dataSource;

// public QuestionDBUtil(DataSource theDataSource) {
// dataSource = theDataSource;
// }

// public List<Question> getQuestions() throws Exception {
// List<Question> questions = new ArrayList<>();

// try {
// Class.forName("com.mysql.jdbc.Driver");
// String url = "jdbc:mysql://127.0.0.1/quizer";

// Connection con = DriverManager.getConnection(url, "root", "root");

// Statement st = con.createStatement();

// String query, email, password, username;

// email = req.getParameter("email");
// password = req.getParameter("password");
// username = req.getParameter("username");

// query = "Insert into instructor (email, password, teacherName) values ('" +
// email + "', '" + password
// + "', '" + username + "')";

// int rs = st.executeUpdate(query);

// if (rs > 0) {

// session.setAttribute("isInstructor", true);
// session.setAttribute("user", username);
// res.sendRedirect("index.jsp");

// }

// } catch (Exception e) {
// out.println(e);

// }

// }
// }
