package com.used.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.used.model.*;

public class UsedServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getSellerNo_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("sellerNo");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入賣家編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer sellerNo = null;
				try {
					sellerNo = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("賣家編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				UsedService usedSvc = new UsedService();
				List<UsedVO> list = usedSvc.getAll(sellerNo);
				if (list == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.getSession().setAttribute("sellerNo", sellerNo);
//				req.setAttribute("list", list); // 資料庫取出的empVO物件,存入req
				String url = "/back-end/emp/listSellerAllUsed.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
		}
//=================================================================================================		
		if ("getSellerNo_UsedNo_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("usedNo");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入二手商品編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer usedNo = null;
				try {
					usedNo = Integer.valueOf(str);
				} catch (Exception e) {
					errorMsgs.add("二手商品編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String strSellerNo = req.getParameter("sellerNo");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入賣家編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				Integer sellerNo = null;
				try {
					sellerNo = Integer.valueOf(strSellerNo);
				} catch (Exception e) {
					errorMsgs.add("賣家編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				UsedService usedSvc = new UsedService();
				UsedVO usedVO = usedSvc.getOneUsed(sellerNo,usedNo);
				if (usedVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.getSession().setAttribute("usedVO", usedVO);
				req.setAttribute("usedVO", usedVO);
//				req.setAttribute("list", list); // 資料庫取出的empVO物件,存入req
				String url = "/back-end/emp/listOneUsed.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
		}		
		
//=================================================================================================		
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
				/***************************1.接收請求參數****************************************/
				Integer sellerNo = Integer.valueOf(req.getParameter("sellerNo"));
				Integer usedNo = Integer.valueOf(req.getParameter("usedNo"));
				
				/***************************2.開始查詢資料****************************************/
				UsedService usedSvc = new UsedService();
				UsedVO usedVO = usedSvc.getOneUsed(sellerNo,usedNo);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.getSession().setAttribute("usedVO", usedVO);         // 資料庫取出的usedVO物件,存入session
				req.setAttribute("usedVO", usedVO);         // 資料庫取出的usedVO物件,存入req
				
				String url = "/back-end/emp/update_used_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);
		}
	
//	=================================================================================================	
		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
//				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer usedNo = Integer.valueOf(req.getParameter("usedNo").trim());
				Integer sellerNo = Integer.valueOf(req.getParameter("sellerNo").trim());
				
				
				String usedName = req.getParameter("usedName").trim();
				String usedNameReg = "^[\\u4e00-\\u9fa5a-zA-Z0-9_\\-!@#$%^&*()\\[\\]{};:'\",.<>/?|+=]{1,30}$";
				if (usedName == null || usedName.trim().length() == 0) {
					errorMsgs.add("商品名稱: 請勿空白");
				} else if(!usedName.matches(usedNameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在1到30之間");
	            }
				
				Integer classNo = Integer.valueOf(req.getParameter("classNo").trim());
				if (classNo == null ) {
					errorMsgs.add("商品類別請勿空白");
				}	
				//暫定  尚需加入驗證
				
				String usedProDesc = req.getParameter("usedProDesc");
				String proDescReg = "^[\\u4e00-\\u9fa5a-zA-Z0-9_\\-!@#$%^&*()\\[\\]{};:'\",.<>/?|+=\\s]{1,230}$";

				if (usedProDesc == null || usedProDesc.trim().length() == 0) {
					errorMsgs.add("商品描述: 請勿空白");
				} else if(!usedProDesc.trim().matches(proDescReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品描述: 只能是中、英文字母、數字和_ , 且長度必需在1到30之間");
	            }
				//=============
				Integer usedPrice = null;

				try {
				    String priceParam = req.getParameter("usedPrice").trim();

				    if (priceParam.isEmpty()) {
				        throw new NumberFormatException("Empty input");
				    }

				    usedPrice = Integer.valueOf(priceParam);

				    if (usedPrice <= 0) {
				        throw new IllegalArgumentException("Price cannot be zero or negative");
				    }
				} catch (NumberFormatException e) {
				    usedPrice = 1000; // 預設值
				    errorMsgs.add("商品價格:請填有效的數字.");
				} catch (IllegalArgumentException e) {
				    usedPrice = 1000; // 預設值
				    errorMsgs.add("商品價格:不得為零或負數.");
				}

				

				Integer usedNewness = null;
				usedNewness =Integer.valueOf(req.getParameter("usedNewness"));
				
				
				Integer usedStocks = null;
				String usedStocksReg = "^[0-9]{1,10}$";
				String usedStocksParam = req.getParameter("usedStocks").trim();
				if (usedStocksParam == null || req.getParameter("usedStocks").trim().length() == 0) {
					errorMsgs.add("商品庫存數量: 請勿空白");
				}else if(!usedStocksParam.matches(usedStocksReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品庫存數量: 只能是數字 ");
	            }else{
	            	usedStocks =Integer.valueOf(usedStocksParam);
	            }
				
				
				Integer usedState = null;		  
				usedState = Integer.valueOf(req.getParameter("usedState"));
				 

				
				


				UsedVO usedVO = new UsedVO();
				usedVO.setUsedNo(usedNo);
				usedVO.setClassNo(classNo);
				usedVO.setSellerNo(sellerNo);
				usedVO.setUsedName(usedName);
				usedVO.setUsedProDesc(usedProDesc);
				usedVO.setUsedNewness(usedNewness);
				usedVO.setUsedPrice(usedPrice);
				usedVO.setUsedStocks(usedStocks);
				usedVO.setUsedState(usedState);
				
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
req.setAttribute("usedVO", usedVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/emp/update_used_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				UsedService usedSvc = new UsedService();
				usedSvc.updateUsed(usedNo,classNo,sellerNo,usedName,usedProDesc,usedNewness,usedPrice,	usedStocks, usedState);
				usedVO=usedSvc.getOneUsed(sellerNo,usedNo);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("usedVO", usedVO); // 資料庫update成功後重新搜尋,正確的的empVO物件,存入req
				String url = "/back-end/emp/listOneUsed.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);
		}
//===========================================================================================
        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
			
			Integer sellerNo = Integer.valueOf(req.getParameter("sellerNo").trim());
			
			
			String usedName = req.getParameter("usedName").trim();
			String usedNameReg = "^[\\u4e00-\\u9fa5a-zA-Z0-9_\\-!@#$%^&*()\\[\\]{};:'\",.<>/?|+=]{1,30}$";
			if (usedName == null || usedName.trim().length() == 0) {
				errorMsgs.add("商品名稱: 請勿空白");
			} else if(!usedName.matches(usedNameReg)) { //以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在1到30之間");
            }
			
			Integer classNo = Integer.valueOf(req.getParameter("classNo").trim());
			if (classNo == null ) {
				errorMsgs.add("商品類別請勿空白");
			}	
			//暫定  尚需加入驗證
			
			String usedProDesc = req.getParameter("usedProDesc");
			String proDescReg = "^[\\u4e00-\\u9fa5a-zA-Z0-9_\\-!@#$%^&*()\\[\\]{};:'\",.<>/?|+=\\s]{1,230}$";

			if (usedProDesc == null || usedProDesc.trim().length() == 0) {
				errorMsgs.add("商品描述: 請勿空白");
			} else if(!usedProDesc.trim().matches(proDescReg)) { //以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("商品描述: 只能是中、英文字母、數字和_ , 且長度必需在1到30之間");
            }
			//=============
			Integer usedPrice = null;

			try {
			    String priceParam = req.getParameter("usedPrice").trim();

			    if (priceParam.isEmpty()) {
			        throw new NumberFormatException("Empty input");
			    }

			    usedPrice = Integer.valueOf(priceParam);

			    if (usedPrice <= 0) {
			        throw new IllegalArgumentException("Price cannot be zero or negative");
			    }
			} catch (NumberFormatException e) {
			    usedPrice = 1000; // 預設值
			    errorMsgs.add("商品價格:請填有效的數字.");
			} catch (IllegalArgumentException e) {
			    usedPrice = 1000; // 預設值
			    errorMsgs.add("商品價格:不得為零或負數.");
			}

			

			Integer usedNewness = null;
			usedNewness =Integer.valueOf(req.getParameter("usedNewness"));
			
			
			Integer usedStocks = null;
			String usedStocksReg = "^[0-9]{1,10}$";
			String usedStocksParam = req.getParameter("usedStocks").trim();
			if (usedStocksParam == null || req.getParameter("usedStocks").trim().length() == 0) {
				errorMsgs.add("商品庫存數量: 請勿空白");
			}else if(!usedStocksParam.matches(usedStocksReg)) { //以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("商品庫存數量: 只能是數字 ");
            }else{
            	usedStocks =Integer.valueOf(usedStocksParam);
            }
			
			
			Integer usedState = null;		  
			usedState = Integer.valueOf(req.getParameter("usedState"));
			 

			
			


			UsedVO usedVO = new UsedVO();
			usedVO.setClassNo(classNo);
			usedVO.setSellerNo(sellerNo);
			usedVO.setUsedName(usedName);
			usedVO.setUsedProDesc(usedProDesc);
			usedVO.setUsedNewness(usedNewness);
			usedVO.setUsedPrice(usedPrice);
			usedVO.setUsedStocks(usedStocks);
			usedVO.setUsedState(usedState);
			
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("usedVO", usedVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/emp/addUsed.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				UsedService usedSvc = new UsedService();
				usedVO = usedSvc.addUsed(classNo,sellerNo,usedName,usedProDesc,usedNewness,usedPrice,usedStocks, usedState);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back-end/emp/listOneUsed.jsp";
				req.setAttribute("usedVO", usedVO);
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
		}
		
//========================================================================================	
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
				/***************************1.接收請求參數***************************************/
				Integer usedNo = Integer.valueOf(req.getParameter("usedNo"));
				
				/***************************2.開始刪除資料***************************************/
				UsedService usedSvc = new UsedService();
				usedSvc.deleteUsed(usedNo);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/back-end/emp/select_page.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
		}
	}
}

