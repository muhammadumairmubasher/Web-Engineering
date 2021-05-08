import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="pizzaOrderServlet", value="/pizzaOrder")
public class pizzaOrderServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String size=request.getParameter("radio");
        request.getSession().setAttribute("size",size);
        response.setContentType("text/html");
        PrintWriter out= response.getWriter();

        out.println("<div style=\"font-family: 'Comic Sans MS',sans-serif\">");
        out.println("<h1 style=\"text-align: center\">Delivery Info</h1>");
        out.println("<form action=\"addressInfo\" method=\"post\" style=\"background: #fac866;padding: 50px;border-radius: 15px;margin-left: 300px;margin-right: 300px;>");
        out.println(
                        "<label  for=\"name\">Name: </label>\n" +
                        "<input  type=\"text\" name=\"name\" id=\"name\">\n<br/><br/>" +
                        "<label  for=\"address\">Address: </label>\n" +
                        "<input  type=\"text\" name=\"address\" id=\"address\">\n<br/><br/>" +
                        "<button type=\"submit\">Submit</button>"
        );
        out.println("</form>");
        out.println("</div>");
    }
}