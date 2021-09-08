package cs.jpp.dto.customer;
import java.util.Date;

public class Customer {
	private int customerId;
	private String name;
	private int branchId;
	private String address;
	private String mobileNo;
	private String emailId;
	private byte status;
	private byte approved;
	private int createdBy;
	private Date createdAt;
	private int updatedBy;
	private Date updatedAt;
	
	public int getCustomerId() {
		return customerId;
	}
	public String getName() {
		return name;
	}
	public int getBranchId() {
		return branchId;
	}
	public String getAddress() {
		return address;
	}
	public String getMobileNo() {
		return mobileNo;
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
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
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
