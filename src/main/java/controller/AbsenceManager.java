package controller;

import POJOs.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AbsenceManager {
    
    public AbsenceManager(){
        //It creates a new object java.sql.Connection from the class MyConnection
        //in order to have more control over it
        //con = ConnectionManager.getCon();
    }
    /*
    public boolean insert(User user){
        /*
        *   @param Object from the class 'Student'
        *
        *   @throws SQLException if the 'executeUpdate()' method returns 0
        *
        *   @return boolean depending if the action was succesful or not
        */
        
        /*PreparedStatement stmt;
        try{
            stmt = con.prepareStatement("INSERT into students "
                    + "(name, surnames, age, address, course, familyData) VALUES (?, ?, ?, ?, ?, ?)");
            stmt.setString(1, user.getName());
            //stmt.setString(2, user.getSurnames());
            //stmt.setInt(3, user.getAge());
            //stmt.setString(4, user.getAddress());
            //stmt.setInt(5, user.getCourse());
            //stmt.setString(6, user.getFamilyData());
            
            int count = stmt.executeUpdate();
            //It saves the int number the 'executeUpdate()' method returns. If 0, 
            //the action was not successful, therefore mannually activates the catch.
            
            if(count == 0) throw new SQLException();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al insertar un alumno: " + ex);
            return false;
        }
    }
    
    public boolean delete(int id){
        /*
        *   @param id from the record the user wants to delete from the database
        *
        *   @throws SQLException if the 'executeUpdate()' method returns 0
        *
        *   @return boolean depending if the action was succesful or not
        */
        
        /*PreparedStatement stmt;
        try{
            stmt = con.prepareStatement("DELETE FROM students WHERE id = ?");
            stmt.setInt(1, id);
            
            int count = stmt.executeUpdate();
            //It saves the int number the 'executeUpdate()' method returns. If 0, 
            //the action was not successful, therefore mannually activates the catch.
            
            if(count == 0) throw new SQLException();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al borrar un alumno: " + ex);
            return false;
        }
    }
    
    public boolean update(int id, Student student) {
        /*
        *   @param id from the record the user wants to modify, object from the 
        *   class 'Student'
        *
        *   @throws SQLException if the 'executeUpdate()' method returns 0
        *
        *   @return boolean depending if the action was succesful or not
        */
        
        /*PreparedStatement stmt;
        try{
            stmt = con.prepareStatement("UPDATE students SET name = ?, surnames = ?, age = ?, address = ?, course = ?, familyData = ? WHERE id = ?");
            stmt.setString(1, student.getName());
            stmt.setString(2, student.getSurnames());
            stmt.setInt(3, student.getAge());
            stmt.setString(4, student.getAddress());
            stmt.setInt(5, student.getCourse());
            stmt.setString(6, student.getFamilyData());
            stmt.setInt(7, id);
            
            int count = stmt.executeUpdate();
            //It saves the int number the 'executeUpdate()' method returns. If 0, 
            //the action was not successful, therefore mannually activates the catch.
            
            if(count == 0) throw new SQLException();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error al modificar el alumno: " + ex);
            return false;
        }
    }
    
    public Student getStudent(int id){
        /*
        *   @param id from the record the user wants to get from the database
        *
        *   @throws SQLException if the record does not exist
        *
        *   @return Object from the class 'Student' or 'null' if there was an error.
        *   Example: the id given does not exist in the database.
        */
        
        /*PreparedStatement stmt;
        try{
            stmt = con.prepareStatement("SELECT * FROM students WHERE id = ?");
            stmt.setInt(1, 1);
            ResultSet rs = stmt.executeQuery();
            
            if(!rs.next()) throw new SQLException();
            //If the id does not exist, throws an exception in order to go to the catch.
            
            return new Student(id, rs.getString("name"), rs.getString("surnames"), 
              rs.getInt("age"), rs.getString("address"), rs.getInt("course"), rs.getString("familyData"));
        } catch (SQLException ex) {
            System.out.println("Error al obtener el alumno: " + id + ". Error: " + ex);
        }finally{
            return null;
        }
    }
    
    public ArrayList<Student> getStudents(){
        /*
        *   @return ArrayList of objects from the Student class or null if
        *   there is an error.
        */
        
        /*PreparedStatement stmt;
        ArrayList<Student> list = new ArrayList();
        try{ 
            stmt = con.prepareStatement("SELECT * FROM students");
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()){
                Student student = new Student(rs.getInt("id"), rs.getString("name"), 
                        rs.getString("surnames"), rs.getInt("age"), rs.getString("address"), 
                        rs.getInt("course"), rs.getString("familyData"));
                list.add(student);
                //The list is being filled
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar los alumnos: " + ex);
        }finally{
            return list;
        }
    }*/
}
