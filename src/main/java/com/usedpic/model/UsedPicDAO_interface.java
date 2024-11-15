package com.usedpic.model;

import java.util.List;


public interface UsedPicDAO_interface {
	public int insert(UsedPicNoVO UsedPicNoVO);// WITH USEDPIC
    public void update(UsedPicNoVO UsedPicNoVO);//內層邏輯用先delete然後insert
    public void delete(Integer usedNo);
    public List<UsedPicNoVO> findByUsedNo(Integer usedNo);
    public List<UsedPicNoVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<UsedVO> getAll(Map<String, String[]> map); 
}
