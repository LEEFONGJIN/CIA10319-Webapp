package com.used.model;

import java.util.*;

public interface UsedDAO_interface {
          public int insert(UsedVO UsedVO);// WITH USEDPIC
          public void update(UsedVO UsedVO);
          public void delete(Integer usedNo);//內層邏輯用UPDATE() 下架 2 移除狀態  set狀態
          public UsedVO findByPrimaryKey(Integer sellerNo,Integer usedNo);
          public List<UsedVO> getAll(Integer sellerNo);
          public List<UsedVO> getAll();
          //萬用複合查詢(傳入參數型態Map)(回傳 List)
//        public List<UsedVO> getAll(Map<String, String[]> map); 
}
