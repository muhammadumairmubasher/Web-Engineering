import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "singUp", value = "/signup")
public class singUp extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String username=request.getParameter("uname");
        String pwd=request.getParameter("newPwd");
        String confirmPwd=request.getParameter("confirmPwd");
        PrintWriter out= response.getWriter();
        request.getSession().setAttribute("pwdError","");
        request.getSession().setAttribute("message", "");
        if(!pwd.equals(confirmPwd)){
            request.getSession().setAttribute("pwdError","Password does not matches!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
        }
        else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                final String DB_URL = "jdbc:mysql://localhost:3306/diary_db";
                final String DB_USER = "root";
                final String DB_PASSWORD = "umair123";
                Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                String query1="SELECT MAX(userID)+1 FROM `users`";
                Statement stmt1 = conn.prepareStatement(query1);
                ResultSet rs=stmt1.executeQuery(query1);
                rs=stmt1.getResultSet();
                String userID="";
                if(rs.next()){
                    userID=rs.getString(1);
                }
                String query = "INSERT INTO `users` values(?,?,?)";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, userID);
                stmt.setString(2, username);
                stmt.setString(3, pwd);
                int result = stmt.executeUpdate();
                request.getSession().setAttribute("message", "New User Added!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
