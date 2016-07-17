package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Users;
import model.ModelThanhVien;

/**
 * Servlet implementation class ControllerAdminThanhVienDel
 */

public class ControllerAdminThanhVienDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerAdminThanhVienDel() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Đã vào");
		HttpSession session = request.getSession();
		Users objSUser = (Users) session.getAttribute("objSUser");
		if (session.getAttribute("objSUser") != null) {
			if (objSUser.getUsername().equals("admin")) {
				int idT = Integer.parseInt(request.getParameter("idT"));
				System.out.println("id:" + idT);
				ModelThanhVien modelThanhVien = new ModelThanhVien();
				int result = modelThanhVien.delThanhVien(idT);
				if (result > 0) {
					response.sendRedirect(request.getContextPath()
							+ "/admin/thanhvien?del=1");
				} else {
					response.sendRedirect(request.getContextPath()
							+ "/admin/thanhvien?del=0");
				}
			} else {
				response.sendRedirect(request.getContextPath()
						+ ("/admin/thanhvien?e=1"));
			}
		} else {
			response.sendRedirect(request.getContextPath()
					+ ("/admin/login?e=1"));
		}

	}

}
