package com.hxy.core.userinfo.entity;

import java.util.Date;

public class UserInfo implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String userId;
	private String userName;
	private String aliasname;
	private String sex;
	private String nation;
	private String political;
	private String nationality;
	private Date birthday;
	private String card;
	private Date entranceTime;
	private Date graduationTime;
	private String studentnumber;
	private String telId;
	private String email;
	private String qq;
	private String weibo;
	private String personalWebsite;
	private String mailingAddress;
	private String residentialArea;
	private String picUrl;
	private String workUnit;
	private String namePinyin;
	private String position;
	private String industryType;
	private String enterprise;
	private String workTel;
	private String workAddress;
	private String resume;
	private String remarks;
	private Date createTime;
	private String accountNum;
	private String cardType;
	private String status;
	private String resourceArea;
	private String studentType;
	private Date useTime;
	private String programLength;
	private long majorId;
	private String residentialTel;
	private String mobileLocal;
	private String hobbies;

	private String schoolName;
	private String departName;
	private String gradeName;
	private String className;
	private String departAliasName;

	private String majorName;

	private String schoolId;
	private String departId;
	private String gradeId;
	private String classId;

	private String newUserId;

	private String fullName;

	private Integer checkFlag;
	private String checkIdea;
	private String dept_id;
	private String dept_name;

	/** --地方校友会字段id-- **/
	private long alumniId;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAliasname() {
		return aliasname;
	}

	public void setAliasname(String aliasname) {
		this.aliasname = aliasname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getPolitical() {
		return political;
	}

	public void setPolitical(String political) {
		this.political = political;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public Date getEntranceTime() {
		return entranceTime;
	}

	public void setEntranceTime(Date entranceTime) {
		this.entranceTime = entranceTime;
	}

	public Date getGraduationTime() {
		return graduationTime;
	}

	public void setGraduationTime(Date graduationTime) {
		this.graduationTime = graduationTime;
	}

	public String getStudentnumber() {
		return studentnumber;
	}

	public void setStudentnumber(String studentnumber) {
		this.studentnumber = studentnumber;
	}

	public String getTelId() {
		return telId;
	}

	public void setTelId(String telId) {
		this.telId = telId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getWeibo() {
		return weibo;
	}

	public void setWeibo(String weibo) {
		this.weibo = weibo;
	}

	public String getPersonalWebsite() {
		return personalWebsite;
	}

	public void setPersonalWebsite(String personalWebsite) {
		this.personalWebsite = personalWebsite;
	}

	public String getMailingAddress() {
		return mailingAddress;
	}

	public void setMailingAddress(String mailingAddress) {
		this.mailingAddress = mailingAddress;
	}

	public String getResidentialArea() {
		return residentialArea;
	}

	public void setResidentialArea(String residentialArea) {
		this.residentialArea = residentialArea;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getWorkUnit() {
		return workUnit;
	}

	public void setWorkUnit(String workUnit) {
		this.workUnit = workUnit;
	}

	public String getNamePinyin() {
		return namePinyin;
	}

	public void setNamePinyin(String namePinyin) {
		this.namePinyin = namePinyin;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getIndustryType() {
		return industryType;
	}

	public void setIndustryType(String industryType) {
		this.industryType = industryType;
	}

	public String getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(String enterprise) {
		this.enterprise = enterprise;
	}

	public String getWorkTel() {
		return workTel;
	}

	public void setWorkTel(String workTel) {
		this.workTel = workTel;
	}

	public String getWorkAddress() {
		return workAddress;
	}

	public void setWorkAddress(String workAddress) {
		this.workAddress = workAddress;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getResourceArea() {
		return resourceArea;
	}

	public void setResourceArea(String resourceArea) {
		this.resourceArea = resourceArea;
	}

	public String getStudentType() {
		return studentType;
	}

	public void setStudentType(String studentType) {
		this.studentType = studentType;
	}

	public Date getUseTime() {
		return useTime;
	}

	public void setUseTime(Date useTime) {
		this.useTime = useTime;
	}

	public String getDepartName() {
		return departName;
	}

	public void setDepartName(String departName) {
		this.departName = departName;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getDepartAliasName() {
		return departAliasName;
	}

	public void setDepartAliasName(String departAliasName) {
		this.departAliasName = departAliasName;
	}

	public String getProgramLength() {
		return programLength;
	}

	public void setProgramLength(String programLength) {
		this.programLength = programLength;
	}

	public String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	public long getMajorId() {
		return majorId;
	}

	public void setMajorId(long majorId) {
		this.majorId = majorId;
	}

	public Integer getCheckFlag() {
		return checkFlag;
	}

	public void setCheckFlag(Integer checkFlag) {
		this.checkFlag = checkFlag;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getCheckIdea() {
		return checkIdea;
	}

	public void setCheckIdea(String checkIdea) {
		this.checkIdea = checkIdea;
	}

	public String getResidentialTel() {
		return residentialTel;
	}

	public void setResidentialTel(String residentialTel) {
		this.residentialTel = residentialTel;
	}

	public String getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(String schoolId) {
		this.schoolId = schoolId;
	}

	public String getDepartId() {
		return departId;
	}

	public void setDepartId(String departId) {
		this.departId = departId;
	}

	public String getGradeId() {
		return gradeId;
	}

	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getNewUserId() {
		return newUserId;
	}

	public void setNewUserId(String newUserId) {
		this.newUserId = newUserId;
	}

	public String getMobileLocal() {
		return mobileLocal;
	}

	public void setMobileLocal(String mobileLocal) {
		this.mobileLocal = mobileLocal;
	}

	public long getAlumniId() {
		return alumniId;
	}

	public void setAlumniId(long alumniId) {
		this.alumniId = alumniId;
	}

	public String getHobbies() {
		return hobbies;
	}

	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}

	@Override
	public String toString() {
		return "UserInfo [userId=" + userId + ", userName=" + userName + ", aliasname=" + aliasname + ", sex=" + sex + ", nation=" + nation + ", political="
				+ political + ", nationality=" + nationality + ", birthday=" + birthday + ", card=" + card + ", entranceTime=" + entranceTime
				+ ", graduationTime=" + graduationTime + ", studentnumber=" + studentnumber + ", telId=" + telId + ", email=" + email + ", qq=" + qq
				+ ", weibo=" + weibo + ", personalWebsite=" + personalWebsite + ", mailingAddress=" + mailingAddress + ", residentialArea=" + residentialArea
				+ ", picUrl=" + picUrl + ", workUnit=" + workUnit + ", namePinyin=" + namePinyin + ", position=" + position + ", industryType=" + industryType
				+ ", enterprise=" + enterprise + ", workTel=" + workTel + ", workAddress=" + workAddress + ", resume=" + resume + ", remarks=" + remarks
				+ ", createTime=" + createTime + ", accountNum=" + accountNum + ", cardType=" + cardType + ", status=" + status + ", resourceArea="
				+ resourceArea + ", studentType=" + studentType + ", useTime=" + useTime + ", programLength=" + programLength + ", majorId=" + majorId
				+ ", residentialTel=" + residentialTel + ", mobileLocal=" + mobileLocal + ", hobbies=" + hobbies + ", schoolName=" + schoolName
				+ ", departName=" + departName + ", gradeName=" + gradeName + ", className=" + className + ", departAliasName=" + departAliasName
				+ ", majorName=" + majorName + ", schoolId=" + schoolId + ", departId=" + departId + ", gradeId=" + gradeId + ", classId=" + classId
				+ ", newUserId=" + newUserId + ", fullName=" + fullName + ", checkFlag=" + checkFlag + ", checkIdea=" + checkIdea + ", alumniId=" + alumniId
				+ "]";
	}

	public String getDept_id() {
		return dept_id;
	}

	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	
	

}