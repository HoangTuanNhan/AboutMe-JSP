package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import library.LibaryConnectDatabase;
import bean.ThanhVien;

public class ModelThanhVien {
	private PreparedStatement pst;
	private Statement st;
	LibaryConnectDatabase db=new LibaryConnectDatabase();
	private ResultSet rs;
	public int getToTal() {
		int total=0;
		String sql="Select count(id_group) as total from aboutgroup";
		try {
			pst=db.getConnectMySQL().prepareStatement(sql);
			rs=pst.executeQuery();
			if(rs.next()){
				total=rs.getInt("total");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return total;
	}
	public ArrayList<ThanhVien> getListForPaginator(int offset, int row_count) {
		ArrayList<ThanhVien> alThanhVien=new ArrayList<>();
		ThanhVien thanhvien;
		String sql="SELECT * FROM aboutgroup order by id_group desc LIMIT "+offset+","+row_count;
		try {
			pst=db.getConnectMySQL().prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				thanhvien=new ThanhVien(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6), rs.getString(7), rs.getString(8),rs.getString(9));
				alThanhVien.add(thanhvien);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		return alThanhVien;
	}
	public boolean checkName(String fullname) {
		boolean kq=false;
		String sql="SELECT * FROM aboutgroup WHERE fullname LIKE '"+fullname+"'";
		try {

			System.out.println(fullname);
			st = db.getConnectMySQL().createStatement();
			rs=st.executeQuery(sql);
			if(rs.next()){
				kq=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				st.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println(kq);
		return kq;

	}
	public boolean addItemThanhVien(ThanhVien thanhvien) {
		boolean result=false;
		String sql="INSERT INTO aboutgroup (nickname,fullname,diachi,dienthoai,congviec,hinhanh,email,link) values (?,?,?,?,?,?,?,?) ";
		try {
			pst=db.getConnectMySQL().prepareStatement(sql);
			pst.setString(1,thanhvien.getNickname());
			pst.setString(2,thanhvien.getFullname());
			pst.setString(3,thanhvien.getDiachi());
			pst.setString(4,thanhvien.getDienthoai());
			pst.setString(5,thanhvien.getCongviec());
			pst.setString(6,thanhvien.getHinhanh());
			pst.setString(7, thanhvien.getEmail());
			pst.setString(8,thanhvien.getLink());
			pst.executeUpdate();
			result=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				db.closeDB();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	public ThanhVien getItemById(int idT) {
		ThanhVien thanhvien=null;
		String sql="SELECT * FROM aboutgroup WHERE id_group="+idT;
		
		try {
			st=db.getConnectMySQL().createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()){
				thanhvien=new ThanhVien(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6), rs.getString(7), rs.getString(8),rs.getString(9));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				db.closeDB();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return thanhvien;
	}
	public boolean editItem(ThanhVien objthanhvien) {
		boolean result = false;
		
		String query = "UPDATE aboutgroup SET nickname =?,fullname=?, diachi=?,dienthoai=?,congviec=?,hinhanh=?,email=?,link=? WHERE id_group =? LIMIT 1";
		try {
			pst = db.getConnectMySQL().prepareStatement(query);
			pst.setString(1, objthanhvien.getNickname());
			pst.setString(2, objthanhvien.getFullname());
			pst.setString(3, objthanhvien.getDiachi());
			pst.setString(4, objthanhvien.getDienthoai());
			pst.setString(5, objthanhvien.getCongviec());
			pst.setString(6, objthanhvien.getHinhanh());
			pst.setString(7, objthanhvien.getEmail());
			pst.setString(8, objthanhvien.getLink() );
			pst.setInt(9, objthanhvien.getIdGroup());
			pst.executeUpdate();
			
			result =true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pst.close();
				db.closeDB();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
		
	}
	public int delThanhVien(int idT) {
		int result=0;
		String sql="DELETE FROM aboutgroup where id_group=? LIMIT 1";
		try {
			pst=db.getConnectMySQL().prepareStatement(sql);
			pst.setInt(1,idT);
			pst.executeUpdate();
			result=1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				pst.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return result;
	}

}
