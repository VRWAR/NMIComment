package com.vrsailor.triatinit;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * Servlet implementation class SaveCommentServlet
 */
@WebServlet("/SaveCommentServlet")
public class SaveCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static Logger logger = Logger.getLogger(SaveCommentServlet.class);
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().write("Access denied.");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String NMINumber = request.getParameter("NMINumber");
        String comment = request.getParameter("comment");
        String errorMsg = null;
        String commentID = null;
        Timestamp timestamp = null;
        
        if(NMINumber == null || NMINumber.equals("")){
            errorMsg = "NMI number can't be null or empty.";
        }
        if(comment == null || comment.equals("")){
            errorMsg = "Comment can't be null or empty.";
        }
         
        if(errorMsg != null){
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
            PrintWriter out= response.getWriter();
            out.println("<font color=red>"+errorMsg+"</font>");
            rd.include(request, response);
        }else{
	        Connection con = (Connection) getServletContext().getAttribute("DBConnection");
	        PreparedStatement ps = null;
	        try {
	            ps = con.prepareStatement("insert into NMIComment(id,NMI_number,comment,comment_time) values (?,?,?,?)");
	            
	            commentID = UUID.randomUUID().toString();
	            Calendar cal = Calendar.getInstance(); 
	            timestamp = new Timestamp(cal.getTimeInMillis());
	            
	            ps.setString(1, commentID);
	            ps.setString(2, NMINumber);
	            ps.setString(3, comment);
	            ps.setTimestamp(4, timestamp);
	            ps.execute();
	             
	            logger.info("Add comment for " + NMINumber);
	             
	            //forward to login page to login
	            RequestDispatcher rd = getServletContext().getRequestDispatcher("/successful.html");
	            rd.include(request, response);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            logger.error("Database connection problem" + e.getStackTrace());
	            RequestDispatcher rd = getServletContext().getRequestDispatcher("/error.html");
	            rd.include(request, response);
	        }finally{
	            try {
	                ps.close();
	            } catch (SQLException e) {
	                logger.error("SQLException in closing PreparedStatement");
	            }
	        }
        }
	}
}
