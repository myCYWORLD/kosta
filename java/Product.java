package com.my.dto; //DataTransferObject의 약자 - 자료 전달용 객체

import java.util.Date;
import java.util.Objects;

public class Product{ 
	private String prodNo;
	private String prodName;
	private int prodPrice;
	private String prodInfo;
	private Date prodMfd; //java.util package에 존재 
	
	public Product(String prodNo,String prodName,int prodPrice){
		this(prodNo, prodName, prodPrice, null,null); //맨 밑의 product에서 
//		this.prodNo=prodNo;
//		this.prodName=prodName;
//		this.prodPrice=prodPrice;
	}
	public Product(String prodNo,String prodName,int prodPrice,Date prodMfd){
		this(prodNo, prodName, prodPrice, null, prodMfd);
//		this.prodNo=prodNo;
//		this.prodName=prodName;
//		this.prodPrice=prodPrice;
//		this.prodMfd=prodMfd;
	}
	public Product(String prodNo,String prodName,int prodPrice,String prodInfo,Date prodMfd){
		this.prodNo=prodNo;
		this.prodName=prodName;
		this.prodPrice=prodPrice;
		this.prodInfo = prodInfo;
		this.prodMfd=prodMfd;
	}
	public void print() {
		System.out.println("상품번호:"+prodNo+"상품명:"+prodName+ "가격:"+ prodPrice+"상세정보:"+prodInfo+"제조일자:"+prodMfd);
	}
	@Override
	public String toString() {
		return ("상품번호는 " + prodNo + ", 상품명은 " + prodName + ", 가격은 " + prodPrice );
	}
	public String getProdNo() {
		return prodNo;
	}
	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}
	

}
