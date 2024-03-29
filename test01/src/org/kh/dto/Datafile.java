package org.kh.dto;

public class Datafile {
	private String creation_time;
	private String status;
	private String enabled;
	private int bytes;
	private int blocks;
	private int create_bytes;
	private int block_size;
	private String name;
	private int con_id;
	
	public Datafile() {}
	public Datafile(String creation_time, String status, String enabled, int bytes, int blocks, int create_bytes,
			int block_size, String name, int con_id) {
		super();
		this.creation_time = creation_time;
		this.status = status;
		this.enabled = enabled;
		this.bytes = bytes;
		this.blocks = blocks;
		this.create_bytes = create_bytes;
		this.block_size = block_size;
		this.name = name;
		this.con_id = con_id;
	}
	
	public String getCreation_time() {
		return creation_time;
	}
	public void setCreation_time(String creation_time) {
		this.creation_time = creation_time;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public int getBytes() {
		return bytes;
	}
	public void setBytes(int bytes) {
		this.bytes = bytes;
	}
	public int getBlocks() {
		return blocks;
	}
	public void setBlocks(int blocks) {
		this.blocks = blocks;
	}
	public int getCreate_bytes() {
		return create_bytes;
	}
	public void setCreate_bytes(int create_bytes) {
		this.create_bytes = create_bytes;
	}
	public int getBlock_size() {
		return block_size;
	}
	public void setBlock_size(int block_size) {
		this.block_size = block_size;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCon_id() {
		return con_id;
	}
	public void setCon_id(int con_id) {
		this.con_id = con_id;
	}
	
	@Override
	public String toString() {
		return "Datafile [creation_time=" + creation_time + ", status=" + status + ", enabled=" + enabled + ", bytes="
				+ bytes + ", blocks=" + blocks + ", create_bytes=" + create_bytes + ", block_size=" + block_size
				+ ", name=" + name + ", con_id=" + con_id + "]";
	}
}
