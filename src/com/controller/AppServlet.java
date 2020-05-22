package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Subject;
import com.beans.User;
import com.service.UserService;

public class AppServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		if(id==null) {
			request.setAttribute("msg", "");
			request.setAttribute("username", "");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else {
			doPost(request,response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		UserService userservice=new UserService();
		if(id.equals("signup")) {
		     request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
		
		if(id.equals("contact")) {
			request.getRequestDispatcher("contact.jsp").forward(request, response);
		}
		if(id.equals("register")) {
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			boolean allow=username.matches("\\p{javaLowerCase}*");
			if(username.equals("")||password.equals("")||allow==false) {
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
			
			try {
				userservice.appendRegistration(username,password);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("msg", "");
			request.setAttribute("username", "");
            request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		
		
		if(id.equals("login")) {
			//read validate and then send to homepage.jsp
			String username= request.getParameter("username");
			String password= request.getParameter("password");
			if(username.equals("")||password.equals("")) {
				request.setAttribute("msg", "PLEASE ENTER CREDENTIALS!!!");
				request.setAttribute("username", username);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			//this is a class used to validate users/service class
			
			//encapsulating class
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			int user_id=0;
			try {
				user_id = userservice.validateUser(user);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				if(user_id!=0) {
					String table_name=username+user_id;
					List <Subject>list=new ArrayList();
					
					try {
						list=userservice.fetchSubjects(table_name);
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	
					request.setAttribute("table_name", table_name);
					request.setAttribute("msg", "");
					request.setAttribute("username", username);
					request.setAttribute("list", list);
					request.getRequestDispatcher("firstpage.jsp").forward(request, response);
				}
				else {
					
					request.setAttribute("msg", "INVALID CREDENTIALS!!!");
					request.setAttribute("username", "");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}

		}
		if(id.equals("add_subject")) {
			String table_name= request.getParameter("table_name");
			request.setAttribute("table_name", table_name);
			System.out.println("In add subject:" +table_name);
			request.setAttribute("subj","");
			request.setAttribute("msg", "");
			request.getRequestDispatcher("addsubject.jsp").forward(request, response);
		}
		
		if(id.equals("create_subject")) {
			String subject_name= request.getParameter("subject_name");
			String table_name= request.getParameter("table_name");
			String total=request.getParameter("total_lectures");
			int total_lectures= Integer.parseInt(request.getParameter("total_lectures"));
			String attended=request.getParameter("attended_lectures");
			int attended_lectures= Integer.parseInt(request.getParameter("attended_lectures"));
			

			System.out.println("In create subject:");
			System.out.println(table_name);
			System.out.println(subject_name);
			System.out.println(total);
			System.out.println(attended);
			
			if(attended_lectures>total_lectures) {
				request.setAttribute("table_name", table_name);
				request.setAttribute("subj",subject_name );
				request.setAttribute("msg", "Enter valid number of lectures.");
				request.getRequestDispatcher("addsubject.jsp").forward(request, response);
			}
			else {
			    List <Subject>list=new ArrayList();
				
				Subject s = new Subject();
				s.setName(subject_name);
				s.setAttended(attended);
				s.setTotal(total);
				list.add(s);
		
				try {
					userservice.addSubject(s,table_name);
				} catch (ClassNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
				try {
					list =userservice.fetchSubjects(table_name);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("table_name", table_name);
				request.setAttribute("list", list);
				request.setAttribute("msg", "New subjects are added in list.");
				request.getRequestDispatcher("firstpage.jsp").forward(request, response);
				
			}
		}
		
		if(id.equals("delete")) {
			String sname = request.getParameter("sname");
			String table_name= request.getParameter("table_name");
			System.out.println("In delete :"+sname);
			System.out.println("In delete: "+table_name);
			try {
				userservice.deleteSubject(sname,table_name);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			List <Subject >list =new ArrayList();
			try {
				list = userservice.fetchSubjects(table_name);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			request.setAttribute("table_name", table_name);
			request.setAttribute("msg", "The Subject:" + sname + " is deleted. ");
			request.getRequestDispatcher("firstpage.jsp").forward(request, response);
		}
		
		if(id.equals("update")) {
			String name = request.getParameter("sname");
			String table_name= request.getParameter("table_name");
			//System.out.println(name);
			int a[]=new int[2];
			
			try {
				a=userservice.getSubjectData(name,table_name);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//System.out.println("In servlet:"+a[0]);
			//System.out.println("In servlet:"+a[1]);
			request.setAttribute("subjectname", name);
			request.setAttribute("table_name", table_name);
			request.setAttribute("attended", a[0]);
			request.setAttribute("total", a[1]);
			request.setAttribute("msg", "");
			request.getRequestDispatcher("updatepage.jsp").forward(request, response);

		}
		
		
		
		if(id.equals("update_subject")) {
			String table_name= request.getParameter("table_name");
			List<Subject> list=new ArrayList();
			String subject_name=request.getParameter("subject_name");
			String attended = request.getParameter("attended_lectures");
			String total = request.getParameter("total_lectures");
			//System.out.println("New a:"+attended);
			//System.out.println("New t:"+total);
			int At =Integer.parseInt(attended);
			int To =Integer.parseInt(total);
			System.out.println(At);//9
			System.out.println(To);//6
			if(At>To) {
				System.out.println("I canme inside if statement");
				request.setAttribute("subjectname",subject_name);
				request.setAttribute("attended",At);
				request.setAttribute("total",To);
				request.setAttribute("table_name", table_name);
				request.setAttribute("msg", "Enter valid number of lectures.");
				request.getRequestDispatcher("updatepage.jsp").forward(request, response);
			}
			else {
				
				try {
					userservice.updateSubject(subject_name,attended,total,table_name);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                try {
					list=userservice.fetchSubjects(table_name);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                request.setAttribute("list", list);
                request.setAttribute("table_name", table_name);
                request.setAttribute("msg", "Attendance has been updated.");
    			request.getRequestDispatcher("firstpage.jsp").forward(request, response);
			}
			
		}
		
		if(id.equals("calculate")) {
			String table_name= request.getParameter("table_name");
			double percent=0.0;
			
			try {
				percent=userservice.calculatePercentage(table_name);
				System.out.println("servlet:"+percent);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			List<Subject> records = new ArrayList();
			
				try {
					records=userservice.fetchSubjects(table_name);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(percent>=75) {
				String Percent=Double.toString(percent);
				request.setAttribute("table_name", table_name);
				request.setAttribute("percent", Percent);
				request.setAttribute("records", records);
				request.setAttribute("msg2", "YOU ARE A NOT DEFAULTER.");
				request.getRequestDispatcher("resultpage.jsp").forward(request, response);		
			}
			else {
				String Percent=Double.toString(percent);
				request.setAttribute("table_name", table_name);
				request.setAttribute("percent", Percent);
				request.setAttribute("records1", records);
				request.setAttribute("msg1", "YOU ARE A DEFAULTER!!!");
				request.getRequestDispatcher("resultpage1.jsp").forward(request, response);

			}
		
		}
		if(id.equals("back")) {
			String table_name =request.getParameter("table_name");
			List<Subject> list=new ArrayList();
			try {
				list=userservice.fetchSubjects(table_name);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("table_name", table_name);
			request.setAttribute("list", list);
			request.setAttribute("msg", "");
			request.getRequestDispatcher("firstpage.jsp").forward(request, response);
			
		}
		
		
		if(id.equals("recover_password")) {
			String name =request.getParameter("name");
			String uname =request.getParameter("uname");
			String email =request.getParameter("email");
			
			try {
				userservice.appendRequest(name,uname,email);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("msg", "");
			request.setAttribute("username", "");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
