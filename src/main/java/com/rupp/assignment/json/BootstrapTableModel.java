package com.rupp.assignment.json;

import java.util.Collection;

public class BootstrapTableModel<T> {
	
	private int total;
	private Collection<T> rows;
	
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Collection<T> getRows() {
		return rows;
	}

	public void setRows(Collection<T> rows) {
		this.rows = rows;
	}

	public BootstrapTableModel() {
		// TODO Auto-generated constructor stub
	}

}
