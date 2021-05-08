import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet(name="displayOptions", value="/displayOptions")
public class displayOptions extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            final String DB_URL="jdbc:mysql://localhost:3306/lab12?";
            final String DB_USER="root";
            final String DB_PASSWORD="umair123";
            Connection conn= DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
            String query ="SELECT * from `class`";
            Statement stmt= conn.createStatement();
            stmt.executeQuery(query);
            ArrayList<DBClass> CL = new ArrayList<DBClass>();
            ResultSet rs=stmt.getResultSet();
            while (rs.next()){
                CL.add(new DBClass(rs.getString("c_id"),rs.getString("c_name")));
            }
            String JSON = new Gson().toJson(CL);
            response.setContentType("application/json");
            response.getWriter().write(JSON);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
