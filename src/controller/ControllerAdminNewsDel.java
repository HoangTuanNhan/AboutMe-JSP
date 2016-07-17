package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Category;
import model.ModelCategory;
import model.ModelNews;

/**
 * Servlet implementation class ControllerAdminNewsDel
 */

public class ControllerAdminNewsDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminNewsDel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ModelCategory mCat = new ModelCategory();
		ArrayList<Category> listCat = mCat.getListCat();
		request.setAttribute("listCat", listCat);
		ModelNews modelNews=new ModelNews();
		int nid=Integer.parseInt(request.getParameter("nid"));
		int result=modelNews.delNews(nid);
		if(result>0){
			
			response.sendRedirect(request.getContextPath()+"/admin/news?mseg=1");
		}else{
			
			response.sendRedirect(request.getContextPath()+"/admin/news?mseg=1");
		}
	}

}
