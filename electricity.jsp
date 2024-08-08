import java.io.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class servelt_for_bill
 */
@WebServlet("/servelt_for_bill")
public class servelt_for_bill extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public servelt_for_bill() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String billno=request.getParameter("bill");
		String unitno=request.getParameter("units");
		int billnumber=Integer.parseInt(billno);
		int unitnumber=Integer.parseInt(unitno);
		PrintWriter pw=response.getWriter();
		int result=1;
       if(unitnumber>0 && unitnumber<100){
            result=unitnumber*10;
           
        }
        else if(unitnumber>=100 && unitnumber<=200){
          result=unitnumber * 15;
         
        }
         else if(unitnumber>=200 && unitnumber<=300){
            result=unitnumber * 20;
          
         }
          else if(unitnumber>=300){
           result=unitnumber*30;
          
          }
       pw.println("your bill number is"+billnumber);
       pw.println("your units are"+unitnumber);
       pw.println("total bill"+result);
       
     request.setAttribute("billnumber", billnumber);
     request.setAttribute("unitnumber", unitnumber);
     request.setAttribute("result", result);
     
     request.getRequestDispatcher("billoutput.jsp").forward(request, response);
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}