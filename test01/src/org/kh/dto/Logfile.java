package org.kh.dto;

public class Logfile {
	private String type;
	private String member;
	private String is_recovery_dest_file;
	private int con_id;
	
	public Logfile() {}
	public Logfile(String type, String member, String is_recovery_dest_file, int con_id) {
		super();
		this.type = type;
		this.member = member;
		this.is_recovery_dest_file = is_recovery_dest_file;
		this.con_id = con_id;
	}
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public String getIs_recovery_dest_file() {
		return is_recovery_dest_file;
	}
	public void setIs_recovery_dest_file(String is_recovery_dest_file) {
		this.is_recovery_dest_file = is_recovery_dest_file;
	}
	public int getCon_id() {
		return con_id;
	}
	public void setCon_id(int con_id) {
		this.con_id = con_id;
	}
	
	@Override
	public String toString() {
		return "Logfile [type=" + type + ", member=" + member + ", is_recovery_dest_file=" + is_recovery_dest_file
				+ ", con_id=" + con_id + "]";
	}
}
