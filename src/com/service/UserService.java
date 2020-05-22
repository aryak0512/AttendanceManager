package com.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.beans.Subject;
import com.beans.User;
import com.model.DBConfig;

public class UserService {
	DBConfig db=new DBConfig();

	public void appendRegistration(String username, String password) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		db.appendRegistration(username,password);
		
	}

	public int validateUser(User user) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
	
		return db.validateUser(user);
	}

	public List<Subject> fetchSubjects(String table_name) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return db.fetchSubjects(table_name);
	}

	public void addSubject(Subject s, String table_name) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		db.addSubject(s,table_name);
		
	}

	public void deleteSubject(String sname, String table_name) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		db.deleteSubject(sname,table_name);
		
	}

	public int[] getSubjectData(String name, String table_name) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return db.getSubjectData(name,table_name);
	}

	public void updateSubject(String subject_name, String attended, String total, String table_name) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		db.updateSubject(subject_name,attended,total,table_name);
	}

	public double calculatePercentage(String table_name) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		return db.calculatePercentage(table_name);
	}

	public void appendRequest(String name, String uname, String email) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		db.appendRequest(name,uname,email);
	}
	
	



	


}
