package com.ore.cart.vo;

public class CartVO {
	private String userId;
	private String itemCode;
	private int itemQty;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public int getItemQty() {
		return itemQty;
	}

	public void setItemQty(int itemQty) {
		this.itemQty = itemQty;
	}

}
