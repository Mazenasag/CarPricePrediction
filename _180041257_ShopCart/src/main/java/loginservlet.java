import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = {"/loginservlet"})
public class loginservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param withErrorMessage
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, boolean withErrorMessage)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            /* TODO output your page here. You may use following sample code. */

            if (withErrorMessage)
            out.println("Login failed. Please try again.<BR>");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet loginservlet</title>  <link rel=\"stylesheet\" href=\"asa.css\" type=\"text/css\" media=\"all\" />");
            out.println("</head>");
            out.println("<body>");
            out.println("");
            out.println("<form method='POST' action=\"loginaction.jsp\">");
            out.println("<div class=\"login\"><label><h1>Login" +"</h1><br></label><label>User Name:</label> <input type=\"text\" name=\"username\">");
            out.println("<label>Password:</label>  <input type=\"password\" name=\"password\">");
            out.println("<div class=\"button\"> <input type=\"submit\" value=\"Submit\"></div></div></form><br><br><br><br><br><br>");

            out.println("</body>");
            out.println("</html>");
            RequestDispatcher rd1=request.getRequestDispatcher("footer.jsp");
            rd1.include(request,response);
        } finally {
            out.close();
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher rd1=request.getRequestDispatcher("index1.jsp");
        rd1.include(request,response);




        String username = request.getParameter("username");
        String password = request.getParameter("password");


        HttpSession session = request.getSession(true);
        session.setAttribute("username", username);
        session.setAttribute("password", password);
        int card=0;
        session.setAttribute("cart",card);

    /*  RequestDispatcher rd=request.getRequestDispatcher("index2.jsp");
    rd.include(request,response);
    */
        processRequest(request,response,false);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        processRequest(request,response, true);


    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
