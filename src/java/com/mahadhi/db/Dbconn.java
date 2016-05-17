package com.mahadhi.db;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.jolbox.bonecp.BoneCP;
import com.jolbox.bonecp.BoneCPConfig;

public class Dbconn {

    private static Dbconn     datasource;
    private BoneCP connectionPool;

    private Dbconn() throws IOException, SQLException, PropertyVetoException {
        try {
            // load the database driver (make sure this is in your classpath!)
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }

        try {
        	System.out.println(" db initialized");
            // setup the connection pool using BoneCP Configuration
            BoneCPConfig config = new BoneCPConfig();
            // jdbc url specific to your database, eg jdbc:mysql://127.0.0.1/yourdb
            config.setJdbcUrl("jdbc:mysql://localhost:3306/db_rs");
            config.setUsername("root");
            config.setPassword("123456");
             
            /*
            config.setJdbcUrl("jdbc:mysql://localhost:3306/enquiris_ibis");
            config.setUsername("enquiris_ibis");
            config.setPassword("ibis123@IBIS123");
            */
            config.setMinConnectionsPerPartition(5);
            config.setMaxConnectionsPerPartition(80);
            config.setPartitionCount(1);
            // setup the connection pool
            connectionPool = new BoneCP(config);
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }

    }

    public static Dbconn getInstance() throws IOException, SQLException, PropertyVetoException {
        if (datasource == null) {
            datasource = new Dbconn();
            return datasource;
        } else {
            return datasource;
        }
    }

    public Connection getConnection() throws SQLException {
        return this.connectionPool.getConnection();
    }

}
