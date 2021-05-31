package com.ore.product.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ore.common.DbCommand;

public class LookBook implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
        return "product/lookbook.tiles";
	}
}
