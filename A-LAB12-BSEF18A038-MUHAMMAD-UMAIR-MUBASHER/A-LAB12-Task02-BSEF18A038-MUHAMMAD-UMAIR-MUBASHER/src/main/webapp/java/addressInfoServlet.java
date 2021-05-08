import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "addressInfoServlet", value = "/addressInfo")
public class addressInfoServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String customerName=request.getParameter("name");
        String address=request.getParameter("address");
        String pizzaSize=(String)request.getSession().getAttribute("size");

        response.setContentType("text/html");
        PrintWriter out= response.getWriter();
        out.println("<div style=\"font-family: 'Comic Sans MS',sans-serif \">");
        out.println("<h1 style=\"text-align: center\">Confirmation</h1>");
        out.println("<div style=\"background: #fac866;padding: 50px;border-radius: 15px;margin-left: 300px;margin-right: 300px;\">");
        out.println("Customer Name: <b>"+customerName+"</b><br/>");
        out.println("Address: <b>"+address+"</b><br/>");
        out.println("Pizza Size: <b>"+pizzaSize+"</b><br/>");
        out.println("</div>");
        out.println("</div>");
    }
}
