import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class addtocart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String username;
        username = (String) session.getAttribute("username");

        String name = request.getParameter("name");

        String price = request.getParameter("price");

        String Quantity = request.getParameter("Quantity");



      out.println("  <div class=\"mypc1\">\n" + " <br><br><br><br><br><br><br><br>\n <label> name: ");
        out.println(name);
        out.println("</label>\n"+ "<label> price: ");
        out.println(price+"</label>\n" + "<label> Quantity:");
        out.println(Quantity+"</label>\n" +"<label> Select Quantity </label>"+ "<form name=\"myform\" method=\"GET\" action=\"product_action\">\n" +
                "<select name=\"qty\" id=\"idqty\">\n" +
                "<option value=\"1\">1</option>\n" +
                "<option value=\"2\">2</option>\n" +
                "<option value=\"3\">3</option>\n" +
                "<option value=\"4\">4</option>\n" +
                "</select>" + "<input name=\"name\" type=\"hidden\" value=");
        out.println(name);
        out.println(">\n" + "<input name=\"price\" type=\"hidden\" value=");
        out.println(price);
        out.println(">\n" +
                "<input name=\"Quantity\" type=\"hidden\" value=");
        out.println(Quantity);
        out.println(">\n" +
                "<input type=\"submit\" value=\"Add Cart\"></form>\n" +
                "</div>");

        out.println("</body>");
        out.println("</html>");
        RequestDispatcher rd1=request.getRequestDispatcher("footer.jsp");
        rd1.include(request,response);
    } /*finally {
        out.close();
    }
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    *//**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *//*
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd1=request.getRequestDispatcher("header.jsp");
        rd1.include(request,response);
        processRequest(request, response);
    }

    *//**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     *//*
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    *//**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     *//*
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
*/
}
