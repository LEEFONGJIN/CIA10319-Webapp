package com.used.model;

import java.io.Serializable;

public class UsedPicNoVO implements Serializable{
	private static final long serialVersionUID = 1L;

	private Integer usedPicNo;//二手照片明細編號  AI PK not null
	
	private Integer usedNo; // 二手商品編號  FK NOT NULL

	private byte[] usedPics; //二手商品照片
	
	public UsedPicNoVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UsedPicNoVO(Integer usedPicNo, Integer usedNo, byte[] usedPics) {
		super();
		this.usedPicNo = usedPicNo;
		this.usedNo = usedNo;
		this.usedPics = usedPics;
	}

	public Integer getUsedPicNo() {
		return usedPicNo;
	}
	
	public void setUsedPicNo(Integer usedPicNo) {
		this.usedPicNo = usedPicNo;
	}
	
	public Integer getUsedNo() {
		return usedNo;
	}
	
	public void setUsedNo(Integer usedNo) {
		this.usedNo = usedNo;
	}
	
	public byte[] getUsedPics() {
		return usedPics;
	}
	
	public void setUsedPics(byte[] usedPics) {
		this.usedPics = usedPics;
	}
	
}
