/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ngoc Do Minh
 */
public class LoginDataProcess {
    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=DemoGLogin";
            String user = "sa";
            String password = "anhsaoxa11";
            try {
                connection = DriverManager.getConnection(url, user, password);
            } catch (SQLException ex) {
                Logger.getLogger(LoginDataProcess.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginDataProcess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connection;
    }
    public static void main(String[] args) {
        LoginDataProcess l = new LoginDataProcess();
        System.out.println(l.getConnection());
    }
    public boolean addUser(String _email, String _username)
    {
        int check = 0;
        Connection connection = getConnection();
        String insertQuery = "INSERT INTO tblUser VALUES (?, ?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, _email);
            check = preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
        preparedStatement.setString(2, _username);
        } catch (SQLException ex) {
            Logger.getLogger(LoginDataProcess.class.getName()).log(Level.SEVERE, null, ex);
        }        
        return (check > 0);
    }
    public boolean checkUser(String _email)
    {
        boolean check = false;
        Connection connection = getConnection();
        String checkQuery = "SELECT * FROM tblUser WHERE _email = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(checkQuery);
            preparedStatement.setString(1, _email);
            ResultSet resultSet = preparedStatement.executeQuery();
            check = resultSet.next();
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(LoginDataProcess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return check;        
    }
}
