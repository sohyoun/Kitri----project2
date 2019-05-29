package com.kitri.db.impl;

import java.util.List;

public interface BasicDao <T> {

	int insert(T obj);

	String select(T id);

	List<Object> selectAll();

}
