package com.vrsailor.triatinit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class DBConnectionManager {
 
    private Connection connection;
     
    public DBConnectionManager(String driver, String dbURL, String user, String pwd) throws ClassNotFoundException, SQLException{
        Class.forName(driver);
        this.connection = DriverManager.getConnection(dbURL, user, pwd);
    }
     
    public Connection getConnection(){
        return this.connection;
    }
}