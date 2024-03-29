package org.kh.dto;

public class Controlfile {
	private String name;
	private String is_recovery_dest_file;
	private int block_size;
	private int file_size_blks;
	private int con_id;
	
	public Controlfile() {}
	public Controlfile(String name, String is_recovery_dest_file, int block_size, int file_size_blks, int con_id) {
		super();
		this.name = name;
		this.is_recovery_dest_file = is_recovery_dest_file;
		this.block_size = block_size;
		this.file_size_blks = file_size_blks;
		this.con_id = con_id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIs_recovery_dest_file() {
		return is_recovery_dest_file;
	}
	public void setIs_recovery_dest_file(String is_recovery_dest_file) {
		this.is_recovery_dest_file = is_recovery_dest_file;
	}
	public int getBlock_size() {
		return block_size;
	}
	public void setBlock_size(int block_size) {
		this.block_size = block_size;
	}
	public int getFile_size_blks() {
		return file_size_blks;
	}
	public void setFile_size_blks(int file_size_blks) {
		this.file_size_blks = file_size_blks;
	}
	public int getCon_id() {
		return con_id;
	}
	public void setCon_id(int con_id) {
		this.con_id = con_id;
	}
	
	@Override
	public String toString() {
		return "Controlfile [name=" + name + ", is_recovery_dest_file=" + is_recovery_dest_file + ", block_size="
				+ block_size + ", file_size_blks=" + file_size_blks + ", con_id=" + con_id + "]";
	}
}
