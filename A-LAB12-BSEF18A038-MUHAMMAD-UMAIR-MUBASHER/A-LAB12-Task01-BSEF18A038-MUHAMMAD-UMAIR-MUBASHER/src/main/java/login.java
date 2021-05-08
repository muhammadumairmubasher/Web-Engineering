import javax.servlet.RequestDispatcher;
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

@WebServlet(name="login", value="/login")
public class login  extends HttpServlet {
    public void doPost (HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String user=request.getParameter("username");
        String pwd=request.getParameter("pwd");
        if(validatePassword(user,pwd)){
            RequestDispatcher dispatcher = request.getRequestDispatcher("diary.jsp");
            dispatcher.forward(request, response);
        }
        else{
            request.getSession().setAttribute("error","Invalid Username or Password!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
    }
    protected boolean validatePassword(String user, String pwd){
        String correctPassword=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            final String DB_URL="jdbc:mysql://localhost:3306/diary_db";
            final String DB_USER="root";
            final String DB_PASSWORD="umair123";
            Connection conn= DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
            String query="SELECT password FROM `users` WHERE username='"+user+"'";
            Statement stmt=conn.createStatement();
            stmt.executeQuery(query);
            ResultSet rs=stmt.getResultSet();
            if(rs.next()){
                correctPassword=rs.getString(1);
            }
            stmt.close();
            if(correctPassword.equals(pwd)){
                return true;
            }
            else {
                return false;
            }
        }
        catch (Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
