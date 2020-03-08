package MyServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class UserProfile
 */
@WebServlet("/UserProfile")
public class UserProfile extends HttpServlet {
  private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfile() {
        super();
        // TODO Auto-generated constructor stub
    }
  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
   
  }
  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    doGet(request, response);
    PrintWriter out = response.getWriter();
    String uname = request.getParameter("email");
    String upass = request.getParameter("motpasse");
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/Store","root","root");
      Statement stmt = con.createStatement();
      ResultSet rs = stmt.executeQuery("select nom,prenom,email,motpasse from clients where email='"+uname+"' and motpasse='"+upass+"'");
      
      if(rs.next()) {
        response.sendRedirect("index.jsp?name="+rs.getString("nom"));
        HttpSession session = request.getSession(true);
        session.setAttribute("uname",rs.getString("nom") );
        session.setAttribute("prenom",rs.getString("prenom") );
        session.setAttribute("prenom",rs.getString("id") );
        
      }else {
    	out.println("<!DOCTYPE html><html><head><meta charset=\"UTF-8\"><title>Insert title here</title></head><body bgcolor=\"#cceeff\">");
        out.println("<h1><center><font color=\"red\">Wrong email and password</center><h1>");
        out.println("<center><button><a href=\"Inscrire.jsp\">Inscrivez-vous</a></button></center>");
        out.println("</body></html>");
      }
      
      
      
    } catch (ClassNotFoundException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    
    
    
  }
}