package cs.jpp.dto.branch;
import java.util.Date;

public class Branch {
	private int branchId;
	private String name;
	private String location;
	private String address;
	private String licenseNo;
	private int managerId;
	private String phoneNo;
	private String emailId;
	private byte status;
	private byte approved;
	private int createdBy;
	private Date createdAt;
	private int updatedBy;
	private Date updatedAt;
	
	public int getBranchId() {
		return branchId;
	}
	public String getName() {
		return name;
	}
	public String getLocation() {
		return location;
	}
	public String getAddress() {
		return address;
	}
	public String getLicenseNo() {
		return licenseNo;
	}
	public int getManagerId() {
		return managerId;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public String getEmailId() {
		return emailId;
	}
	public byte getStatus() {
		return status;
	}
	public byte getApproved() {
		return approved;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public int getUpdatedBy() {
		return updatedBy;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setLicenseNo(String licenseNo) {
		this.licenseNo = licenseNo;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public void setStatus(byte status) {
		this.status = status;
	}
	public void setApproved(byte approved) {
		this.approved = approved;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
}
	
	