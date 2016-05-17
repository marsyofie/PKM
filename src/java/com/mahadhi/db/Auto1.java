package com.mahadhi.db;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.Gson;
import com.mahadhi.db.Country;
import com.mahadhi.db.CountryDao;



/**
 * Servlet implementation class Auto
 */
@WebServlet("/Auto1")
public class Auto1 extends HttpServlet {
	//private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Auto1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("called");
		//System.out.println(request.getParameter("query"));
				String q=request.getParameter("query");
			ArrayList<Country> o=CountryDao.getpekerjaan(q);
			Gson gson = new Gson();
			 
			// convert java object to JSON format,
			// and returned as JSON formatted string
			String json = gson.toJson(o);
			//System.out.println(json);
		 response.getWriter().write("{\"suggestions\":"+json+"}");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
}
