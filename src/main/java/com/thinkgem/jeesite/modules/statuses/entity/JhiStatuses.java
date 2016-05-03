/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.statuses.entity;

import org.hibernate.validator.constraints.Length;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 行业资讯Entity
 * @author bread
 * @version 2016-04-29
 */
public class JhiStatuses extends DataEntity<JhiStatuses> {
	
	private static final long serialVersionUID = 1L;
	private String annotations;		// annotations
	private String attacment;		// attacment
	private String attitudesCount;		// attitudes_count
	private String commentsCount;		// comments_count
	private Date createdDate;		// created_date
	private String middlePic;		// middle_pic
	private String originalPic;		// original_pic
	private String repostsCount;		// reposts_count
	private String source;		// source
	private String content;		// text
	private String thumbnailPic;		// thumbnail_pic
	private String type;		// type
	private JhiStatusCategory category;		// category_id
	private Long profileId;		// profile_id
	private Boolean isHead;		// is_head
	private String summary;		// summary
	private String tags;		// tags
	private String top;		// top
	private String title;		// top
	
	public JhiStatuses() {
		super();
	}

	public JhiStatuses(String id){
		super(id);
	}

	@Length(min=0, max=255, message="annotations长度必须介于 0 和 255 之间")
	public String getAnnotations() {
		return annotations;
	}

	public void setAnnotations(String annotations) {
		this.annotations = annotations;
	}
	
	@Length(min=0, max=255, message="attacment长度必须介于 0 和 255 之间")
	public String getAttacment() {
		return attacment;
	}

	public void setAttacment(String attacment) {
		this.attacment = attacment;
	}
	
	@Length(min=1, max=11, message="attitudes_count长度必须介于 1 和 11 之间")
	public String getAttitudesCount() {
		return attitudesCount;
	}

	public void setAttitudesCount(String attitudesCount) {
		this.attitudesCount = attitudesCount;
	}
	
	@Length(min=1, max=11, message="comments_count长度必须介于 1 和 11 之间")
	public String getCommentsCount() {
		return commentsCount;
	}

	public void setCommentsCount(String commentsCount) {
		this.commentsCount = commentsCount;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	@Length(min=0, max=255, message="middle_pic长度必须介于 0 和 255 之间")
	public String getMiddlePic() {
		return middlePic;
	}

	public void setMiddlePic(String middlePic) {
		this.middlePic = middlePic;
	}
	
	@Length(min=0, max=255, message="original_pic长度必须介于 0 和 255 之间")
	public String getOriginalPic() {
		return originalPic;
	}

	public void setOriginalPic(String originalPic) {
		this.originalPic = originalPic;
	}
	
	@Length(min=1, max=11, message="reposts_count长度必须介于 1 和 11 之间")
	public String getRepostsCount() {
		return repostsCount;
	}

	public void setRepostsCount(String repostsCount) {
		this.repostsCount = repostsCount;
	}
	
	@Length(min=0, max=255, message="source长度必须介于 0 和 255 之间")
	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Length(min=1, max=255, message="thumbnail_pic长度必须介于 1 和 255 之间")
	public String getThumbnailPic() {
		return thumbnailPic;
	}

	public void setThumbnailPic(String thumbnailPic) {
		this.thumbnailPic = thumbnailPic;
	}
	
	@Length(min=1, max=255, message="type长度必须介于 1 和 255 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public JhiStatusCategory getCategory() {
		return category;
	}

	public void setCategory(JhiStatusCategory category) {
		this.category = category;
	}

	public Long getProfileId() {
		return profileId;
	}

	public void setProfileId(Long profileId) {
		this.profileId = profileId;
	}
	
	public Boolean getIsHead() {
		return isHead;
	}

	public void setIsHead(Boolean isHead) {
		this.isHead = isHead;
	}
	
	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}
	
	@Length(min=0, max=11, message="top长度必须介于 0 和 11 之间")
	public String getTop() {
		return top;
	}

	public void setTop(String top) {
		this.top = top;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
	public void preInsert() {
		// TODO Auto-generated method stub
		this.setIsNewRecord(true);
		this.setProfileId(3L);
		this.setType("0"); //默认为新闻
		super.preInsert();
	}

	@Override
	public void preUpdate() {
		// TODO Auto-generated method stub
		super.preUpdate();
	}
}