package com.used.model;

import java.util.List;

public class UsedService {

	private UsedDAO_interface dao;

	public UsedService() {
		dao = new UsedJDBCDAO();
//		dao = new UsedDAO();
	}

	public UsedVO addUsed(Integer classNo,Integer sellerNo,String usedName,String usedProDesc, Integer  usedNewness,Integer	 usedPrice,Integer	usedStocks,Integer usedState) {

		UsedVO usedVO = new UsedVO();
		
		usedVO.setClassNo(classNo);
		usedVO.setSellerNo(sellerNo);
		usedVO.setUsedName(usedName);
		usedVO.setUsedProDesc(usedProDesc);
		usedVO.setUsedNewness(usedNewness);
		usedVO.setUsedPrice(usedPrice);
		usedVO.setUsedStocks(usedStocks);
		usedVO.setUsedState(usedState);

		Integer usedNo=dao.insert(usedVO);//回傳AI的商品編號以利之後使用
		
		usedVO.setUsedNo(usedNo);
		return usedVO;
	}

	public UsedVO updateUsed(Integer usedNo,Integer classNo,Integer sellerNo,String usedName,String usedProDesc, Integer  usedNewness,Integer usedPrice,Integer	usedStocks,Integer usedState) {

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
		
		dao.update(usedVO);

		return usedVO;
	}

	public void deleteUsed(Integer sellerNo) {
		dao.delete(sellerNo);//資料庫並沒有刪除  僅將狀態改為2 (從用戶頁面移除)
	}

	public UsedVO getOneUsed(Integer sellerNo,Integer usedNo) {
		return dao.findBySellerNoUsedNo(sellerNo, usedNo);
	}

	public List<UsedVO> getAll(Integer sellerNo) {
		return dao.getAll(sellerNo);
	}
	public List<UsedVO> getAll() { //管理員查找全部商品包含刪除或未上架
		return dao.getAll();
	}
	public List<UsedVO> getAll_Member(){
		return dao.getAll_Member();
	}
	
}
