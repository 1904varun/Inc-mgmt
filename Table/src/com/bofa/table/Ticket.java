package com.bofa.table;

public class Ticket {
	
	private String inc;
	private String group;
	private String status;
	private String priority;
	private String asignee;
	private String sla;
	
	public Ticket(String status, String inc, String group, String sla, String priority, String asignee) {
		this.asignee = asignee;
		this.inc = inc;
		this.group = group;
		this.status = status;
		this.priority = priority;
		this.sla = sla;
		
	}
	
	public String getStatus() {
		return status;
	}
	
	public String getInc() {
		return inc;
	}
	
	public String getGroup() {
		return group;
	}
	
	public String getPriority() {
		return priority;
	}
	
	public String getAsignee() {
		return asignee;
	}
	
	public String getSla() {
		return sla;
	}

	
}
