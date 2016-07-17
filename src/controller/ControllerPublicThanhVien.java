package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelAdvs;
import model.ModelSaying;
import model.ModelThanhVien;

/**
 * Servlet implementation class ControllerPublicThanhVien
 */

public class ControllerPublicThanhVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerPublicThanhVien() {
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
		request.setAttribute("setActiveThanhVien","true");
		ModelSaying modelSaying=new ModelSaying();
		request.setAttribute("alSaying",modelSaying.getListSaying());
		ModelAdvs modelAdvs=new ModelAdvs();
		
		request.setAttribute("alAdvs", modelAdvs.getListAdvs());
		ModelThanhVien modelThanhVien=new ModelThanhVien();
		int row_count=4;
		//Lấy tổng  số tin
		int total=modelThanhVien.getToTal();
		//chia số trang
		int numberOfPage=(int)Math.ceil((float)total/row_count);
		request.setAttribute("numberOfPage", numberOfPage);
		int currentPage=1;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int offset = (currentPage - 1) * row_count;
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("alThanhVien",modelThanhVien.getListForPaginator(offset, row_count));
	//	request.setAttribute("alProject",modelProject.getListProject());
		request.getRequestDispatcher("/thanhvien.jsp").forward(request, response);
	}

}
