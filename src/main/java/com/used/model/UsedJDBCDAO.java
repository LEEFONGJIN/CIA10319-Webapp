package com.used.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UsedJDBCDAO implements UsedDAO_interface {
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/projectsample?serverTimezone=Asia/Taipei";
	String userid = "root";
	String passwd = "Xcds36970*";

	private static final String INSERT_STMT = 
		"INSERT INTO Used (classNo, sellerNo, usedName, usedProDesc, usedNewness, usedPrice, usedStocks, usedState) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_SELLERNO_ALL_STMT = 
			"SELECT * FROM Used   WHERE sellerNo = ? ORDER BY usedNo ASC ";
	private static final String GET_ALL_STMT = 
			"SELECT * FROM Used   ORDER BY usedNo ASC ";
	private static final String GET_ONE_STMT = 
		"SELECT * FROM Used   WHERE sellerNo = ? AND usedNo = ?";
	private static final String DELETE = 
		"UPDATE used set usedState =2 where usedNo = ?";
	private static final String UPDATE = 
		"UPDATE Used SET classNo = ?, sellerNo = ?, usedName = ?, usedProDesc = ?, usedNewness = ?, usedPrice = ?, usedStocks = ?, usedState = ?  WHERE usedNo = ?";
	//新增一筆商品
	@Override
	public int insert(UsedVO UsedVO) {

		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT,  Statement.RETURN_GENERATED_KEYS);
			//輸入二手商品資料
			pstmt.setInt(1, UsedVO.getClassNo());
			pstmt.setInt(2, UsedVO.getSellerNo());
			pstmt.setString(3, UsedVO.getUsedName());
			pstmt.setString(4, UsedVO.getUsedProDesc());
			pstmt.setInt(5, UsedVO.getUsedNewness());
			pstmt.setInt(6, UsedVO.getUsedPrice());
			pstmt.setInt(7, UsedVO.getUsedStocks());
			pstmt.setInt(8, UsedVO.getUsedState());

			pstmt.executeUpdate();
			//二手商品資料輸入完畢

			//取得輸入後回傳之流水號
			ResultSet rs =pstmt.getGeneratedKeys();
			int usedNo =  0;
			if (rs.next()){
				usedNo = rs.getInt(1);
			}
//			//取得流水號後 UsedPicDAO向二手照片表格輸入圖片
//			picpstmt = con.prepareStatement(INSERT_PIC_STMT);
//			picpstmt.setInt(1,usedNo);
//			picpstmt.setBytes(2, UsedPicNoVO.getUsedPics());
			
			return usedNo;
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}
	//修改商品資料
	@Override
	public void update(UsedVO UsedVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setInt(1, UsedVO.getClassNo());
			pstmt.setInt(2, UsedVO.getSellerNo());
			pstmt.setString(3, UsedVO.getUsedName());
			pstmt.setString(4, UsedVO.getUsedProDesc());
			pstmt.setInt(5, UsedVO.getUsedNewness());
			pstmt.setInt(6, UsedVO.getUsedPrice());
			pstmt.setInt(7, UsedVO.getUsedStocks());
			pstmt.setInt(8, UsedVO.getUsedState());
			pstmt.setInt(9, UsedVO.getUsedNo());
			

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}
	//刪除(改狀態為2)
	@Override
	public void delete(Integer usedNo) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setInt(1, usedNo);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}
	//找特定二手商品
	@Override
	public UsedVO findByPrimaryKey(Integer sellerNo,Integer usedNo) {

		UsedVO UsedVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setInt(1, sellerNo);
			pstmt.setInt(2, usedNo);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// empVo 也稱為 Domain objects
				UsedVO = new UsedVO();
				
				UsedVO.setUsedNo(rs.getInt("usedNo"));
				UsedVO.setClassNo(rs.getInt("classNo"));
				UsedVO.setSellerNo(rs.getInt("sellerNo"));
				UsedVO.setUsedName(rs.getString("usedName"));
				UsedVO.setUsedProDesc(rs.getString("usedProDesc"));
				UsedVO.setUsedNewness(rs.getInt("usedNewness"));
				UsedVO.setUsedPrice(rs.getInt("usedPrice"));
				UsedVO.setUsedStocks(rs.getInt("usedStocks"));
				UsedVO.setUsedLaunchedTime(rs.getTimestamp("usedLaunchedTime"));
				UsedVO.setSoldTime(rs.getTimestamp("soldTime"));
				UsedVO.setUsedState(rs.getInt("usedState"));
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return UsedVO;
	}
	//找二手賣家全部的販賣商品
	@Override
	public List<UsedVO> getAll(Integer sellerNo) {
		List<UsedVO> list = new ArrayList<UsedVO>();
		UsedVO UsedVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_SELLERNO_ALL_STMT);
			
			pstmt.setInt(1, sellerNo);
			
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
//				// UsedVO 也稱為 Domain objects
				UsedVO = new UsedVO();
				
				UsedVO.setUsedNo(rs.getInt("usedNo"));
				UsedVO.setClassNo(rs.getInt("classNo"));
				UsedVO.setSellerNo(rs.getInt("sellerNo"));
				UsedVO.setUsedName(rs.getString("usedName"));
				UsedVO.setUsedProDesc(rs.getString("usedProDesc"));
				UsedVO.setUsedNewness(rs.getInt("usedNewness"));
				UsedVO.setUsedPrice(rs.getInt("usedPrice"));
				UsedVO.setUsedStocks(rs.getInt("usedStocks"));
				UsedVO.setUsedLaunchedTime(rs.getTimestamp("usedLaunchedTime"));
				UsedVO.setSoldTime(rs.getTimestamp("soldTime"));
				UsedVO.setUsedState(rs.getInt("usedState"));
				list.add(UsedVO); // Store the row in the list
			}
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	//找所有二手商品
	@Override
	public List<UsedVO> getAll() {
		List<UsedVO> list = new ArrayList<UsedVO>();
		UsedVO UsedVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
//				// UsedVO 也稱為 Domain objects
				UsedVO = new UsedVO();
				
				UsedVO.setUsedNo(rs.getInt("usedNo"));
				UsedVO.setClassNo(rs.getInt("classNo"));
				UsedVO.setSellerNo(rs.getInt("sellerNo"));
				UsedVO.setUsedName(rs.getString("usedName"));
				UsedVO.setUsedProDesc(rs.getString("usedProDesc"));
				UsedVO.setUsedNewness(rs.getInt("usedNewness"));
				UsedVO.setUsedPrice(rs.getInt("usedPrice"));
				UsedVO.setUsedStocks(rs.getInt("usedStocks"));
				UsedVO.setUsedLaunchedTime(rs.getTimestamp("usedLaunchedTime"));
				UsedVO.setSoldTime(rs.getTimestamp("soldTime"));
				UsedVO.setUsedState(rs.getInt("usedState"));
				list.add(UsedVO); // Store the row in the list
			}
			
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}
	//MAIN方法測試
	public static void main(String[] args) {

		UsedJDBCDAO dao = new UsedJDBCDAO();
		UsedVO usedVO1 = new UsedVO();

		// 新增 v
		usedVO1.setClassNo(121);
		usedVO1.setSellerNo(211);
		usedVO1.setUsedName("111");
		usedVO1.setUsedProDesc("111");
		usedVO1.setUsedNewness(1);
		usedVO1.setUsedPrice(10);
		usedVO1.setUsedStocks(10);
		usedVO1.setUsedState(1);
		Integer newUsedNo=dao.insert(usedVO1);
		System.out.println(newUsedNo);
		
		

		// 修改 v
//		
//		usedVO1.setClassNo(121);
//		usedVO1.setSellerNo(211);
//		usedVO1.setUsedName("111");
//		usedVO1.setUsedProDesc("111");
//		usedVO1.setUsedNewness(1);
//		usedVO1.setUsedPrice(10);
//		usedVO1.setUsedStocks(10);
//		usedVO1.setUsedState(1);
//		usedVO1.setUsedNo(1);
//	
//		dao.update(usedVO1);
//
//		// 刪除 v
//		dao.delete(1);
//
		// 查詢 V
//		usedVO1 = dao.findByPrimaryKey(211,1);
//		System.out.print(usedVO1.getUsedNo() + ",");
//		System.out.print(usedVO1.getClassNo() + ",");
//		System.out.print(usedVO1.getSellerNo() + ",");
//		System.out.print(usedVO1.getUsedName() + ",");
//		System.out.print(usedVO1.getUsedProDesc() + ",");
//		System.out.print(usedVO1.getUsedNewness() + ",");
//		System.out.print(usedVO1.getUsedPrice() + ",");
//		System.out.print(usedVO1.getUsedStocks() + ",");
//		System.out.print(usedVO1.getUsedLaunchedTime() + ",");
//		System.out.print(usedVO1.getSoldTime() + ",");
//		System.out.print(usedVO1.getUsedState() + ",");
//		System.out.println("---------------------");

		// 查詢 v
//		List<UsedVO> list = dao.getAll(211);
//		for (UsedVO aUsed : list) {
//			System.out.print(aUsed.getUsedNo() + ",");
//			System.out.print(aUsed.getClassNo() + ",");
//			System.out.print(aUsed.getSellerNo() + ",");
//			System.out.print(aUsed.getUsedName() + ",");
//			System.out.print(aUsed.getUsedProDesc() + ",");
//			System.out.print(aUsed.getUsedNewness() + ",");
//			System.out.print(aUsed.getUsedPrice()+ ",");
//			System.out.print(aUsed.getUsedStocks()+ ",");
//			Date date = new Date(aUsed.getUsedLaunchedTime().getTime());
//			System.out.print(date+ ",");
//			System.out.print(aUsed.getSoldTime()+ ",");
//			System.out.print(aUsed.getUsedState()+ ",");
//			System.out.println();
//		}
		// 無參數全查詢 v
//		List<UsedVO> list = dao.getAll();
//		for (UsedVO aUsed : list) {
//			System.out.print(aUsed.getUsedNo() + ",");
//			System.out.print(aUsed.getClassNo() + ",");
//			System.out.print(aUsed.getSellerNo() + ",");
//			System.out.print(aUsed.getUsedName() + ",");
//			System.out.print(aUsed.getUsedProDesc() + ",");
//			System.out.print(aUsed.getUsedNewness() + ",");
//			System.out.print(aUsed.getUsedPrice()+ ",");
//			System.out.print(aUsed.getUsedStocks()+ ",");
//			Date date = new Date(aUsed.getUsedLaunchedTime().getTime());
//			System.out.print(date+ ",");
//			System.out.print(aUsed.getSoldTime()+ ",");
//			System.out.print(aUsed.getUsedState()+ ",");
//			System.out.println();
//		}
	}

}