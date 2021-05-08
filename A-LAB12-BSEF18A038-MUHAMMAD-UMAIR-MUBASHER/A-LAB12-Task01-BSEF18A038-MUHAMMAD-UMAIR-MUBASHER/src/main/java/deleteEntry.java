import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "deleteEntry", value = "/deleteEntry")
public class deleteEntry extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String titleName=(String)request.getSession().getAttribute("inputTitleName");
        PrintWriter out=response.getWriter();
        request.getSession().setAttribute("deleteMessage","");
        //Maintain Other classes session
        request.getSession().setAttribute("inputTitle",null);
        request.getSession().setAttribute("notesAgainstTitle",null);
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
            String query = "DELETE fROM `diary` WHERE titleName='"+titleName+"'";
            Statement stmt=conn.createStatement();
            stmt.executeUpdate(query);
            request.getSession().setAttribute("deleteMessage","Deletion Successful!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("diary.jsp");
            dispatcher.forward(request, response);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
