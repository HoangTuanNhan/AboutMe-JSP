package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class ControllerAdminThanhVienEdit
 */

public class ControllerAdminThanhVienEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminThanhVienEdit() {
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
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		ModelThanhVien mP= new ModelThanhVien();
		int idT = Integer.parseInt(request.getParameter("idT"));
		ThanhVien objthanhvien = mP.getItemById(idT);
		
		ThanhVien thanhvien;
		String nickname = "";
		String fullname="";
		String diachi="";
		String dienthoai="";
		String congviec="";
		String email="";
		String link = "";
		String picture = "";
		
		if (request.getParameter("delImage") != null) {
			if (!objthanhvien.getHinhanh().equals("noImage.jpg")) {
				Path path = Paths.get(request.getServletContext().getRealPath("") + File.separator + "files"
						+ File.separator + objthanhvien.getHinhanh());
				Files.delete(path);
				objthanhvien.setHinhanh(picture);
				mP.editItem(objthanhvien);
				
			}
		}
		if ("submit".equals(request.getParameter("type"))) {
			
			if (ServletFileUpload.isMultipartContent(request)) {
				try {
					DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
					ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
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
							if (!fileItem.getName().equals("")) {
								picture = fileItem.getName();
								picture = FilenameUtils.getBaseName(picture) + "-" + System.nanoTime() + "."
										+ FilenameUtils.getExtension(picture);
								String pathname = request.getServletContext().getRealPath("") + File.separator + "files"
										+ File.separator + picture;
								File file = new File(pathname);
								
								fileItem.write(file);
							}
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (!"noImage.jpg".equals(picture)) {
					thanhvien = new ThanhVien(idT, nickname, fullname, diachi, dienthoai, congviec, picture, email, link);
					if (!"noImage.jpg".equals(objthanhvien.getHinhanh())) {
						Path path = Paths.get(request.getServletContext().getRealPath("") + File.separator + "files"
								+ File.separator + objthanhvien.getHinhanh());
						Files.delete(path);
					}
				} else {
					thanhvien = new ThanhVien(idT, nickname, fullname, diachi, dienthoai, congviec, objthanhvien.getHinhanh(), email, link);
				}
				if (mP.editItem(thanhvien)) {
					response.sendRedirect(request.getContextPath() + "/admin/thanhvien?emsg=1");
				} else {
					response.sendRedirect(request.getContextPath() + "/admin/editThanhVien?msg=0");
				}
			} else {
				System.err.println("Form không thỏa mãn");
			}
		} else {
			request.setAttribute("thanhvien", objthanhvien);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/editThanhVien.jsp");
			rd.forward(request, response);
		}
	}
	}



