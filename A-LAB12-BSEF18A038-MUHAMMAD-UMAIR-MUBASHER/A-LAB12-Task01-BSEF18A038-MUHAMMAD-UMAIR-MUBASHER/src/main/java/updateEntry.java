import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.concurrent.atomic.AtomicInteger;

@WebServlet(name = "updateEntry", value = "/updateEntry")
public class updateEntry extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String ID=request.getParameter("ID");
        String titleName=request.getParameter("titleValue");
        String titleDate=request.getParameter("date");
        String titleNotes=request.getParameter("notes");

        PrintWriter out=response.getWriter();
        request.getSession().setAttribute("updateMessage","");
        request.getSession().setAttribute("updateError","");
        //Maintain Other classes session
        request.getSession().setAttribute("inputTitle",null);
        request.getSession().setAttribute("notesAgainstTitle",null);
        request.getSession().setAttribute("entryError",null);
        request.getSession().setAttribute("entryMessage",null);
        request.getSession().setAttribute("deleteMessage", null);
        request.getSession().setAttribute("notesAgainstDeleteInputTitle",null);
        request.getSession().setAttribute("deleteInputTitle",null);
        request.getSession().setAttribute("searchError",null);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            final String DB_URL = "jdbc:mysql://localhost:3306/diary_db";
            final String DB_USER = "root";
            final String DB_PASSWORD = "umair123";
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            Statement stmt=conn.createStatement();
            String query1 = "SELECT titleID FROM `diary` WHERE titleID='"+ID+"'";
            ResultSet rs=stmt.executeQuery(query1);
            boolean res=false;
            if(rs.next()){
                if(rs.getString("titleID").equals(ID)){
                   res=true;
                }
            }
            if(!res) {
                request.getSession().setAttribute("updateError","Error...! ID Not Exist!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("diary.jsp");
                dispatcher.forward(request, response);
            }
            if(!titleName.isEmpty() && !titleDate.isEmpty() && !titleNotes.isEmpty()){
                String query = "UPDATE `diary` SET titleName='"+titleName+"', notes='"+titleNotes+"', date='"+titleDate+"' WHERE titleID='"+ID+"'";
                stmt.executeUpdate(query);
            }
            else if(!titleName.isEmpty() && !titleDate.isEmpty()) {
                String query = "UPDATE `diary` SET titleName='"+titleName+"', date='"+titleDate+"' WHERE titleID='"+ID+"'";
                stmt.executeUpdate(query);
            }
            else if(!titleName.isEmpty() && !titleNotes.isEmpty()){
                String query = "UPDATE `diary` SET titleName='"+titleName+"', notes='"+titleNotes+"' WHERE titleID='"+ID+"'";
                stmt.executeUpdate(query);
            }
            else if(!titleDate.isEmpty() && !titleNotes.isEmpty()){
                String query = "UPDATE `diary` SET date='"+titleDate+"', notes='"+titleNotes+"' WHERE titleID='"+ID+"'";
                stmt.executeUpdate(query);
            }
            else if(!titleName.isEmpty()){
                String query = "UPDATE `diary` SET titleName='"+titleName+"' WHERE titleID='"+ID+"'";
                stmt.executeUpdate(query);
            }
            else if(!titleDate.isEmpty()){
                String query = "UPDATE `diary` SET date='"+titleDate+"' WHERE titleID='"+ID+"'";
                stmt.executeUpdate(query);
            }
            else if(!titleNotes.isEmpty()){
                String query = "UPDATE `diary` SET notes='"+titleNotes+"' WHERE titleID='"+ID+"'";
                stmt.executeUpdate(query);
            }
            else{
                request.getSession().setAttribute("updateError","No Column Updated!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("diary.jsp");
                dispatcher.forward(request, response);
            }
            request.getSession().setAttribute("updateMessage","Updation Successful!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("diary.jsp");
            dispatcher.forward(request, response);
        }
        catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("updateError","Error...! Title Already Exist!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("diary.jsp");
            dispatcher.forward(request, response);
        }
    }
}
