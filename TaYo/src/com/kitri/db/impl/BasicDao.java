package com.kitri.db.impl;

import java.util.List;

public interface BasicDao <T> {
	List<T> selectAll();
	String select(T id);
	int insert(T obj);





}
