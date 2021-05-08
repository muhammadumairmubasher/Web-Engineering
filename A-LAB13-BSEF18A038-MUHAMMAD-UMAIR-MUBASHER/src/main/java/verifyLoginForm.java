import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
@WebServlet(name="verifyLoginForm", value="/verifyLoginForm")
public class verifyLoginForm extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String uname=request.getParameter("username");
        String pwd=request.getParameter("password");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            final String DB_URL="jdbc:mysql://localhost:3306/lab12?";
            final String DB_USER="root";
            final String DB_PASSWORD="umair123";
            Connection conn= DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
            String query ="SELECT * FROM `users` WHERE username='"+uname+"'AND password='"+pwd+"'";
            Statement stmt= conn.createStatement();
            stmt.executeQuery(query);
            ResultSet rs=stmt.getResultSet();
            if(rs.next()) {
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().write("successful");
            }
            else{
                response.setContentType("text/html;charset=UTF-8");
                response.getWriter().write("Error");
            }
        }
        catch (Exception e){
            PrintWriter out=response.getWriter();
            out.println(e.getMessage());
        }
    }
}
