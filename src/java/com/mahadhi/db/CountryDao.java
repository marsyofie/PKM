package com.mahadhi.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mahadhi.db.Dbconn;

public class CountryDao {
	
	
   public  static ArrayList<Country> getCountryName(String  id)  {
		 Connection connection = null;
   PreparedStatement ps = null;
   ResultSet resultSet = null;
   ArrayList<Country> data=new ArrayList<Country>();
   try {
       // fetch a connection
   	 connection = Dbconn.getInstance().getConnection();
       if (connection != null) {
           ps = connection.prepareStatement("select nama_pasien,id_mr  from  db_pasien where id_mr like ? ");
           ps.setString(1, "%"+id+"%");
           
           resultSet =ps.executeQuery();
           while(resultSet.next())
           {
         	  Country c=new Country();
         	  c.setData(resultSet.getString(1));
         	  c.setValue(resultSet.getString(2));
         	  data.add(c);
           }
           
       }

   } catch (Exception e) {
       e.printStackTrace();
   } finally {
       if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {e.printStackTrace();}
       if (ps != null) try { ps.close(); } catch (SQLException e) {e.printStackTrace();}
       if (connection != null) try { connection.close(); } catch (SQLException e) {e.printStackTrace();}
   }
   return data;
}
   public  static ArrayList<Country> getpekerjaan(String  id)  {
		 Connection connection = null;
   PreparedStatement ps = null;
   ResultSet resultSet = null;
   ArrayList<Country> data=new ArrayList<Country>();
   try {
       // fetch a connection
   	 connection = Dbconn.getInstance().getConnection();
       if (connection != null) {
           ps = connection.prepareStatement("select id,pekerjaan  from  db_pekerjaan where pekerjaan like ? ");
           ps.setString(1, "%"+id+"%");
           
           resultSet =ps.executeQuery();
           while(resultSet.next())
           {
         	  Country c=new Country();
         	  c.setData(resultSet.getString(1));
         	  c.setValue(resultSet.getString(2));
         	  data.add(c);
           }
           
       }

   } catch (Exception e) {
       e.printStackTrace();
   } finally {
       if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {e.printStackTrace();}
       if (ps != null) try { ps.close(); } catch (SQLException e) {e.printStackTrace();}
       if (connection != null) try { connection.close(); } catch (SQLException e) {e.printStackTrace();}
   }
   return data;
}

}
