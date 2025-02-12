package itview.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import itview.model.Student;

public class StudentDao 
{
	static Connection con=null;
	
	public static Connection getConnection()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cruddb","root","root");
			System.out.println(con);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
	
	
	public static int insertRecord(Student std)
	{
		int status=0;
		try
		{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("insert into student(student_name,Email,Gender,Country)values(?,?,?,?)");
			
			ps.setString(1, std.getName());
			ps.setString(2, std.getEmail());
			ps.setString(3, std.getGender());
			ps.setString(4, std.getCountry());
			
			status=ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	
	public static List<Student> getAllRecords()
	{
		List<Student> stdList=new ArrayList<Student>();
		try
		{
			Connection con=getConnection();
			
			PreparedStatement ps=con.prepareStatement("select * from student");
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				Student s=new Student();
				
				s.setId(rs.getInt("student_id"));
				s.setName(rs.getString("Student_name"));
				s.setEmail(rs.getString("Email"));
				s.setGender(rs.getString("Gender"));
				s.setCountry(rs.getString("Country"));
				
				stdList.add(s);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return stdList;
	}
	
	public static Student getRecordById(int id)
	{
		Student s=null;
		try
		{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from student where student_id=?");
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				s=new Student();
				
				s.setId(rs.getInt("student_id"));
				s.setName(rs.getString("Student_name"));
				s.setEmail(rs.getString("Email"));
				s.setGender(rs.getString("Gender"));
				s.setCountry(rs.getString("Country"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return s;
	}
	
	public static int update(Student s)
	{
		int status=0;
		
		try
		{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("Update student set Student_name=?,Email=?,Gender=?,Country=? where student_id=?");
			
			ps.setString(1,s.getName());
			ps.setString(2,s.getEmail());
			ps.setString(3,s.getGender());
			ps.setString(4,s.getCountry());
			ps.setInt(5,s.getId());
			
			status=ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	public static int delete(Student s)
	{
		int status=0;
		try
		{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("delete from student where student_id=?");
			
			ps.setInt(1,s.getId());
			
			status=ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
}
