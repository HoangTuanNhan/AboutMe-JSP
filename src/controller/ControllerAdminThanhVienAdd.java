package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelThanhVien;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import bean.ThanhVien;

/**
 * Servlet implementation class ControllerAdminThanhVienAdd
 */

public class ControllerAdminThanhVienAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminThanhVienAdd() {
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
		System.out.println("Đã vào1");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		String nickname = "";
		String fullname="";
		String diachi="";
		String dienthoai="";
		String congviec="";
		String email="";
		String link = "";
		String picture = "";
		System.out.println("Đã vào");
		
		if (!"load".equals(request.getParameter("type"))) {
		
			if (ServletFileUpload.isMultipartContent(request)) {
				
				DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
				try {
					List<FileItem> formItems = upload.parseRequest(request);
					for (FileItem fileItem : formItems) {
						if (fileItem.isFormField()) {
							String fieldname = fileItem.getFieldName();
							String fieldValue = new String(fileItem.getString().getBytes("ISO-8859-1"), "UTF-8");
							switch (fieldname) {
							case "nickname":
								nickname = fieldValue;
								break;
							case "fullname":
								fullname = fieldValue;
								break;
							case "diachi":
								diachi = fieldValue;
								break;
							case "dienthoai":
								dienthoai = fieldValue;
								break;
							case "congviec":
								congviec = fieldValue;
								break;
							case "email":
								email = fieldValue;
								break;
							case "link":
								link = fieldValue;
								break;
							
							default:
								break;
							}
						} else {
							picture = fileItem.getName();
							if (!picture.equals("")) {
								picture = FilenameUtils.getBaseName(picture) + "-" + System.nanoTime() + "."
										+ FilenameUtils.getExtension(picture);
								String pathname = request.getServletContext().getRealPath("") + File.separator + "files"
										+ File.separator + picture;
								File file = new File(pathname);
								fileItem.write(file);
							}
							else{
								picture = "noImage.jpg";
							}
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				System.out.println("FullName"+fullname);
				
				ModelThanhVien mn = new ModelThanhVien();
				if(mn.checkName(fullname)){
					//trung ten thi ko them
					response.sendRedirect(request.getContextPath() + "/admin/addThanhVien?type=load&msg=0");
				}else{
					//ko trung thi them
					ThanhVien thanhvien = new ThanhVien(0, nickname, fullname, diachi, dienthoai, congviec, picture, email, link);
					if(mn.addItemThanhVien(thanhvien)){
						response.sendRedirect(request.getContextPath() + "/admin/thanhvien?msg=1");
					}
					else{
						response.sendRedirect(request.getContextPath() + "/admin/addProject?msg=0");
					}
				}
			} else {
				System.out.println("Form không thỏa mãn upload");
			}

		} else {
			request.getRequestDispatcher("/admin/addThanhVien.jsp").forward(request, response);
			
		}
	}
	
	}


