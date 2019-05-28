package com.kitiri.impl;

import java.util.List;

public interface DbDml<T> {
	public final String SUCCESS="1"; 
	public final String FAIL="0"; 
	public T getInstance();
	public List<T> selectAll();
	public T select(T id);
	public int insert();
	
	
}
