import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "display", value = "/display")
public class display extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String titleName=request.getParameter("titleName");
        request.getSession().setAttribute("inputTitle","");
        request.getSession().setAttribute("notesAgainstTitle","");
        //Maintain Other classes session
        request.getSession().setAttribute("entryError",null);
        request.getSession().setAttribute("entryMessage",null);
        request.getSession().setAttribute("deleteMessage", null);
        request.getSession().setAttribute("notesAgainstDeleteInputTitle",null);
        request.getSession().setAttribute("deleteInputTitle",null);
        request.getSession().setAttribute("updateError",null);
        request.getSession().setAttribute("updateMessage",null);
        request.getSession().setAttribute("searchError",null);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            final String DB_URL = "jdbc:mysql://localhost:3306/diary_db";
            final String DB_USER = "root";
            final String DB_PASSWORD = "umair123";
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String query = "SELECT * from `diary` WHERE titleName='"+titleName+"'";
            Statement stmt=conn.createStatement();
            stmt.executeQuery(query);
            ResultSet rs=stmt.getResultSet();
            if(rs.next()){
                request.getSession().setAttribute("inputTitle",rs.getString("titleName"));
                request.getSession().setAttribute("notesAgainstTitle",rs.getString("notes"));
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("diary.jsp");
            dispatcher.forward(request, response);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
