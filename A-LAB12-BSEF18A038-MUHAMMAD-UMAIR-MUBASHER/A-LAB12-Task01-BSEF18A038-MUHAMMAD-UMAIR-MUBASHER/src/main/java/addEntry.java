import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "add", value = "/addEntry")
public class addEntry extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String titleName=request.getParameter("tName");
        String description=request.getParameter("description");

        request.getSession().setAttribute("entryError","");
        request.getSession().setAttribute("entryMessage","");
        //Maintain Other classes session
        request.getSession().setAttribute("inputTitle",null);
        request.getSession().setAttribute("notesAgainstTitle",null);
        request.getSession().setAttribute("deleteMessage", null);
        request.getSession().setAttribute("entryMessage", null);
        request.getSession().setAttribute("notesAgainstDeleteInputTitle",null);
        request.getSession().setAttribute("deleteInputTitle",null);
        request.getSession().setAttribute("updateError",null);
        request.getSession().setAttribute("updateMessage",null);
        request.getSession().setAttribute("searchError",null);

        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            final String DB_URL = "jdbc:mysql://localhost:3306/diary_db";
            final String DB_USER = "root";
            final String DB_PASSWORD = "umair123";
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String query1="SELECT MAX(titleID)+1 FROM `diary`";
            Statement stmt1 = conn.prepareStatement(query1);
            ResultSet rs=stmt1.executeQuery(query1);
            rs=stmt1.getResultSet();
            String titleID="";
            if(rs.next()){
              titleID=rs.getString(1);
            }
            String query = "INSERT INTO `diary` (titleID, titleName, notes, date) values(?,?,?,CURRENT_DATE())";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1,titleID);
            stmt.setString(2, titleName);
            stmt.setString(3, description);
            int result = stmt.executeUpdate();
            request.getSession().setAttribute("entryMessage", "Successfully New Record Added!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("diary.jsp");
            dispatcher.forward(request, response);
        }
        catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("entryError", "Title Already Exist!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("diary.jsp");
            dispatcher.forward(request, response);
        }
    }
}
