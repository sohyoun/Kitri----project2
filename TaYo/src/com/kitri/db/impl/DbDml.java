package com.kitri.db.impl;

import java.util.List;

public interface DbDml <T> {

	int insert(T obj);

	String select(T id);

	T getInstance();

	List<Object> selectAll();

}
