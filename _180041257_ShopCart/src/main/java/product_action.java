import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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

@WebServlet(urlPatterns = {"/product_action"})
public class product_action extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
            HttpSession session = request.getSession(true);


            String username;
            username = (String) session.getAttribute("username");
            String name;
            name = request.getParameter("Name");

            String price;
            //out.println(pname+"here");
            //int qty=Integer.parseInt(request.getParameter("qty"));
            String Quantity= request.getParameter("Quantity");

            // out.println(p_model);
            price = request.getParameter("Price");
            String id = request.getParameter("Id");
            //String image=request.getParameter("image");
            //out.println(username+name+price+Quantity+qty);

            int i;
            // out.println(i);



            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/onlineshop","root","");
            //out.println(i);
            Statement st= (Statement)con.createStatement();
            //out.println(i);
            String query="insert into cart (id,Quantity,name,price)  values ('"+id+"','"+Quantity+"','"+name+"','"+price+"')";
            //out.println(i);
            i=st.executeUpdate(query);
            //out.println(i);

            int carts;
            //out.println("1");
            carts = (Integer) session.  getAttribute("cart");
            carts=carts+1;
            //out.println("this value is :"+cards);

            //out.println("1");
            session.setAttribute("cart",carts);

            //out.println("1");
            RequestDispatcher rd1=request.getRequestDispatcher("home1.jsp");
            rd1.forward(request,response);

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


        try{
            /* TODO output your page here. You may use following sample code. */


            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshop?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root","");
            Statement st= con.createStatement();
            ResultSet rs=st.executeQuery("select * from cart");



            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("</head>");
            out.println("<body>"
                    +" "
                    +"  <table>  <tr> <td> hello </td </tr>   </table>   "
                    + ""
                    + " %>");
            out.println("</body>");
            out.println("</html>");


        } catch (ClassNotFoundException ex) {
            Logger.getLogger(product_action.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(product_action.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(product_action.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(product_action.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {


            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(product_action.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(product_action.class.getName()).log(Level.SEVERE, null, ex);
        }
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
