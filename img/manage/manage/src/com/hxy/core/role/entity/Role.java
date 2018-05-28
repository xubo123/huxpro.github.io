package com.hxy.core.role.entity;

import java.io.Serializable;
import java.util.List;

import com.hxy.core.resource.entity.Resource;

public class Role implements Serializable {
	private static final long serialVersionUID = 1L;
	private long roleId;
	private String roleName;
	private int systemAdmin;
	private int flag;

	private List<Resource> list;

	public long getRoleId() {
		return roleId;
	}

	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public List<Resource> getList() {
		return list;
	}

	public void setList(List<Resource> list) {
		this.list = list;
	}

	public int getSystemAdmin() {
		return systemAdmin;
	}

	public void setSystemAdmin(int systemAdmin) {
		this.systemAdmin = systemAdmin;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "Role [roleName=" + roleName + "]";
	}

}
