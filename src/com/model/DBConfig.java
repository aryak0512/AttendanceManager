package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.beans.Subject;
import com.beans.User;

public class DBConfig {
	//Step 1 : declare all variables 
			String url="jdbc:mysql://localhost:3306/attendance";
			String username="root";
			String password="";
			String driver="com.mysql.jdbc.Driver";
			Connection conn;

			//Step 2
			private void dbConnect() throws ClassNotFoundException, SQLException{
				//Load the driver
				Class.forName(driver);
				//establish the connection
				conn = DriverManager.getConnection(url, username, password);
			}

			public void appendRegistration(String username, String password) throws SQLException, ClassNotFoundException {
				// TODO Auto-generated method stub
				 int id=0;
				 dbConnect();
				 String sql="insert into registrations(username,password)values(?,?)";
				 //Step 3: creating the statement
				 PreparedStatement pstmt = conn.prepareStatement(sql);
				 pstmt.setString(1,username);
				 pstmt.setString(2,password);
				 pstmt.executeUpdate();	
				 
				 String sql1="select id from registrations where username=?";
				 //Step 3: creating the statement
				 PreparedStatement pstmt1 = conn.prepareStatement(sql1);
				 pstmt1.setString(1,username);
				 ResultSet rst1=pstmt1.executeQuery();
				 while(rst1.next()) {	
				 id=rst1.getInt("id");
				 }
				 String table_name=username+id;
				 System.out.println(table_name);
				 
				 String sql2="CREATE TABLE "+table_name+ "( `id` INT(11) NOT NULL AUTO_INCREMENT , `name` TEXT NOT NULL , `attended` INT NOT NULL , `total` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;";
				 //Step 3: creating the statement
				 PreparedStatement pstmt2 = conn.prepareStatement(sql2);
				 pstmt2.executeUpdate();	
				
			}

			public int validateUser(User user) throws ClassNotFoundException, SQLException {
				int id=0;
				dbConnect();
				String username=user.getUsername();
				String password=user.getPassword();
				String sql="select id from registrations where username=? and password=?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,username);
				pstmt.setString(2,password);
				ResultSet rst=pstmt.executeQuery();
				while(rst.next()) {	
					 id=rst.getInt("id");
			    } 
				return id;
			}


			public List<Subject> fetchSubjects(String table_name) throws ClassNotFoundException, SQLException {
				dbConnect();
				String sql="select * from "+table_name;
				 //Step 3: creating the statement
				 PreparedStatement pstmt = conn.prepareStatement(sql);
				 //step 4: executing the statement
				 ResultSet rst = pstmt.executeQuery();
				 List<Subject> list = new ArrayList<>();
				 while(rst.next()){
					 int id = rst.getInt("id");
					 String name = rst.getString("name");
					 String attended = rst.getString("attended");
					 String total = rst.getString("total");
					 Subject s = new Subject();
					 s.setId(id);
					 s.setName(name);
					 s.setTotal(total);
					 s.setAttended(attended);
					 list.add(s); 
				 }
				 rst.close();
				 pstmt.close();
				return list;

			}


			public void addSubject(Subject s, String table_name) throws ClassNotFoundException, SQLException {
				// TODO Auto-generated method stub
				 dbConnect();
				 String sql="insert into "+ table_name+"(name,attended,total)values(?,?,?)";
				 //Step 3: creating the statement
				 PreparedStatement pstmt = conn.prepareStatement(sql);
				 pstmt.setString(1, s.getName());
				 pstmt.setString(2, s.getAttended());
				 pstmt.setString(3, s.getTotal());
				 pstmt.executeUpdate();	
				
			}

			public void deleteSubject(String sname, String table_name) throws ClassNotFoundException, SQLException {
				// TODO Auto-generated method stub
				
				 dbConnect();
				 String sql="delete from "+ table_name+" where name=?";
				 //Step 3: creating the statement
				 PreparedStatement pstmt = conn.prepareStatement(sql);
				 pstmt.setString(1, sname);
				 pstmt.executeUpdate();
				
			}

			public int[] getSubjectData(String name, String table_name) throws ClassNotFoundException, SQLException {
				// TODO Auto-generated method stub
				 dbConnect();
				 int attended;
				 int total;
				 int a[]=new int[2];
				 String sql="select attended,total from "+table_name+" where name=?";
				 //Step 3: creating the statement
				 PreparedStatement pstmt = conn.prepareStatement(sql);
				 //step 4: executing the statement
				 pstmt.setString(1, name);
				 ResultSet rst = pstmt.executeQuery();
				 while(rst.next()) {
						attended=Integer.parseInt(rst.getString("attended"));
						System.out.println("attended:"+attended);
						total=Integer.parseInt(rst.getString("total"));
						System.out.println("total:"+total);
						a[0]=attended;
						a[1]=total;
					}
				 return a;
			}

			public void updateSubject(String subject_name, String attended, String total, String table_name) throws ClassNotFoundException, SQLException {
				// TODO Auto-generated method stub
				dbConnect();
				String sql="update "+table_name+" SET attended=?,total=? where name=?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, attended);
				pstmt.setString(2, total);
				pstmt.setString(3, subject_name);
				pstmt.executeUpdate();	
				
			}

			public double calculatePercentage(String table_name) throws ClassNotFoundException, SQLException {
				double percent=0.0;
				double percentRoundOff=0.0;
				int attended=0;
				int total=0;
				dbConnect();
				String sql="select SUM(attended),SUM(total) from "+table_name+";";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rst=pstmt.executeQuery();
				while(rst.next()) {
					attended=Integer.parseInt(rst.getString("SUM(attended)"));
					System.out.println("attended:"+attended);//12
					total=Integer.parseInt(rst.getString("SUM(total)"));
					System.out.println("total:"+total);
					
					
					float value=(float)attended/total; //value will be 0.(something)....
					System.out.println("Value:"+value*100);//this will give a lengthy decimal value
					percent = value*100;	
				    percentRoundOff = Math.round(percent * 100.0) / 100.0;//upto 2 decimal places
					System.out.println("Rounded off:"+percentRoundOff);
				}
				return percentRoundOff;
			}

			public void appendRequest(String name, String uname, String email) throws ClassNotFoundException, SQLException {
				// TODO Auto-generated method stub
				dbConnect();
				String sql="insert into requests (name,username,email)values(?,?,?)";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, uname);
				pstmt.setString(3, email);
				pstmt.executeUpdate();
				
			}

}
