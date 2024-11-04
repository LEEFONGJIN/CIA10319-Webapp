package com.used.model;

import java.sql.Date;
import java.sql.Timestamp;

public class UsedVO implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private Integer    			usedNo; //二手商品編號 AI PK NOT NULL
	
	private Integer 		   classNo; //商品類別編號 FK NOT NULL
	
	private Integer 		  sellerNo; //會員編號(賣家) FK NOT NULL
	
	private String 			  usedName; //二手商品名稱 NOT NULL
	
	private String 		   usedProDesc; //二手商品描述 NOT NULL
	
	private Integer 	   usedNewness; //商品新舊程度 NOT NULL (0: 近全新, 1: 7成新, 2: 5成新, 3: 3成新)
	
	private Integer 		 usedPrice; //二手商品單價 NOT NULL >0
	
	private Integer 		usedStocks; //商品庫存數量 NOT NULL >0
	
	private Timestamp usedLaunchedTime; //二手商品上架時間 
	
	private Timestamp 		  soldTime; //二手商品下架時間
	
	private Integer 		 usedState; //二手商品狀態 NOT NULL (0: 未上架, 1: 已上架)
	
	public UsedVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Integer getUsedNo() {
		return usedNo;
	}
	
	public void setUsedNo(Integer usedNo) {
		this.usedNo = usedNo;
	}
	
	public Integer getClassNo() {
		return classNo;
	}
	
	public void setClassNo(Integer classNo) {
		this.classNo = classNo;
	}
	
	public Integer getSellerNo() {
		return sellerNo;
	}
	
	public void setSellerNo(Integer sellerNo) {
		this.sellerNo = sellerNo;
	}
	
	public String getUsedName() {
		return usedName;
	}
	
	public void setUsedName(String usedName) {
		this.usedName = usedName;
	}
	
	public String getUsedProDesc() {
		return usedProDesc;
	}
	
	public void setUsedProDesc(String usedProDesc) {
		this.usedProDesc = usedProDesc;
	}
	
	public Integer getUsedNewness() {
		return usedNewness;
	}
	
	public void setUsedNewness(Integer usedNewness) {
		this.usedNewness = usedNewness;
	}
	
	public Integer getUsedPrice() {
		return usedPrice;
	}
	
	public void setUsedPrice(Integer usedPrice) {
		this.usedPrice = usedPrice;
	}
	
	public Integer getUsedStocks() {
		return usedStocks;
	}
	
	public void setUsedStocks(Integer usedStocks) {
		this.usedStocks = usedStocks;
	}
	
	public Timestamp getUsedLaunchedTime() {
		return usedLaunchedTime;
	}
	
	public void setUsedLaunchedTime(Timestamp usedLaunchedTime) {
		this.usedLaunchedTime = usedLaunchedTime;
	}
	
	public Timestamp getSoldTime() {
		return soldTime;
	}
	
	public void setSoldTime(Timestamp soldTime) {
		this.soldTime = soldTime;
	}
	
	public Integer getUsedState() {
		return usedState;
	}
	
	public void setUsedState(Integer usedState) {
		this.usedState = usedState;
	}
	

}
