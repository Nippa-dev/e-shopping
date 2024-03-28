import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public register() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PreparedStatement st1 = null;
        Connection con;

        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/Green_Supermarket", "root", "cds#");

            String query = "INSERT INTO users(name, email, password) VALUES (?, ?, ?)";
            st1 = con.prepareStatement(query);

            st1.setString(1, name);
            st1.setString(2, email);
            st1.setString(3, password);

            int k = st1.executeUpdate();

            if (k == 1) {
                out.println("Thanks for registration ......");
                String query2 = "SELECT max(id) FROM users";
                Statement st2 = con.createStatement();
                ResultSet rs1 = st2.executeQuery(query2);
                rs1.next();
                String reg_No = rs1.getString(1);
                out.println("Your registration id is " + reg_No);

                // Set the email parameter in request attributes
                request.setAttribute("login-email", email);

                // Forward to mailMessage.jsp
                request.getRequestDispatcher("mailMessage.jsp").forward(request, response);
            } else {
                out.println("Can't update");
            }
        } catch (Exception ee) {
            System.out.println(ee.toString());
        }
    }
}
