package com.hxy.core.channel.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.hxy.base.action.AdminBaseAction;
import com.hxy.base.entity.Message;
import com.hxy.core.channel.entity.NewsTag;
import com.hxy.core.channel.service.NewsChannelService;

@Namespace("/newsChannel")
@Action(value = "newsChannelAction", results = {
		@Result(name = "initNewsChannelUpdate", location = "/page/admin/newsChannel/editNewsChannel.jsp"),
		@Result(name = "viewNewsChannel", location = "/page/admin/newsChannel/viewNewsChannel.jsp") })
public class NewsChannelAction extends AdminBaseAction {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger
			.getLogger(NewsChannelAction.class);

	private NewsTag newsTag;

	public NewsTag getNewsTag() {
		return newsTag;
	}

	public void setNewsTag(NewsTag newsTag) {
		this.newsTag = newsTag;
	}

	@Autowired
	private NewsChannelService newsChannelService;

	public void dataGrid() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("rows", rows);
		if (newsTag != null) {
			map.put("tagName", newsTag.getTagName());
		}
		super.writeJson(newsChannelService.dataGrid(map));
	}

	public void save() {
		Message message = new Message();
		try {
			String tagName = newsTag.getTagName();
			if (!tagName.equals("")) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("tagName", tagName);
				if (newsChannelService.countNewsTag(map) == 0) {
					newsChannelService.save(newsTag);
					message.setMsg("保存成功");
					message.setSuccess(true);
					super.writeJson(message);
					return;
				}
			}
			message.setMsg("频道名称重复，请重新输入!");
			message.setSuccess(false);
		} catch (Exception e) {
			logger.error(e, e);
			message.setMsg("保存失败");
			message.setSuccess(false);
		}
		super.writeJson(message);
	}

	public void delete() {
		Message message = new Message();
		try {
			newsChannelService.delete(ids);
			message.setMsg("删除成功");
			message.setSuccess(true);
		} catch (Exception e) {
			logger.error(e, e);
			message.setMsg("删除失败");
			message.setSuccess(false);
		}
		super.writeJson(message);
	}

	public void update() {
		Message message = new Message();
		try {
			newsChannelService.update(newsTag);
			message.setMsg("修改成功");
			message.setSuccess(true);

		} catch (Exception e) {
			logger.error(e, e);
			message.setMsg("修改失败");
			message.setSuccess(false);
		}
		super.writeJson(message);
	}

	public void doNotNeedSecurity_initType() {
		Map<String, Object> map = new HashMap<String, Object>();
		if (getUser().getRole().getSystemAdmin() != 1) {
			map.put("deptList", getUser().getDepts());
		}
		List<NewsTag> listNewsChannel = newsChannelService.selectAll2(map);
		super.writeJson(listNewsChannel);
	}

	public String doNotNeedSessionAndSecurity_initNewsChannelUpdate() {
		newsTag = newsChannelService.selectById2(id);
		return "initNewsChannelUpdate";
	}

	public String getById() {
		newsTag = newsChannelService.selectById2(id);
		return "viewNewsChannel";
	}

}
