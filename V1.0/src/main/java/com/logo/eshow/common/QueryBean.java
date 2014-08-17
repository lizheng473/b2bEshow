package com.logo.eshow.common;

import com.logo.eshow.bean.query.AlbumQueryBean;
import com.logo.eshow.bean.query.BlogCommentQueryBean;
import com.logo.eshow.bean.query.BlogQueryBean;
import com.logo.eshow.bean.query.BoardQueryBean;
import com.logo.eshow.bean.query.CategoryQueryBean;
import com.logo.eshow.bean.query.InfoQueryBean;
import com.logo.eshow.bean.query.PhotoCommentQueryBean;
import com.logo.eshow.bean.query.PhotoQueryBean;
import com.logo.eshow.bean.query.ServiceQueryBean;
import com.logo.eshow.bean.query.ServiceTypeQueryBean;
import com.logo.eshow.bean.query.TopicCommentQueryBean;
import com.logo.eshow.bean.query.TopicQueryBean;
import com.logo.eshow.bean.query.UserQueryBean;

/**
 * 查询Bean的变量定义
 * 
 * @author leida
 * 
 */
public final class QueryBean {

	/**
	 * 事务查询字段的关键字对象，使用在request或session或appliction中。
	 */
	public static AlbumQueryBean ALBUM_QUERY_BEAN = new AlbumQueryBean();

	/**
	 * 日志查询字段的关键字对象，使用在request或session或appliction中。
	 */
	public static BlogQueryBean BLOG_QUERY_BEAN = new BlogQueryBean();

	/**
	 * 日志评论查询字段的关键字对象，使用在request或session或appliction中。
	 */
	public static BlogCommentQueryBean BLOGCOMMENT_QUERY_BEAN = new BlogCommentQueryBean();

	/**
	 * 版块查询字段的关键字对象，使用在request或session或appliction中。
	 */
	public static BoardQueryBean BOARD_QUERY_BEAN = new BoardQueryBean();

	/**
	 * 分类查询字段的关键字对象，使用在request或session或appliction中。
	 */
	public static CategoryQueryBean CATEGORY_QUERY_BEAN = new CategoryQueryBean();

	/**
	 * 信息查询字段的关键字对象，使用在request或session或appliction中。
	 */
	public static InfoQueryBean INFO_QUERY_BEAN = new InfoQueryBean();

	/**
	 * 图片查询字段的关键字对象，使用在request或session或appliction中。
	 */
	public static PhotoQueryBean PHOTO_QUERY_BEAN = new PhotoQueryBean();

	/**
	 * 图片评论查询字段的关键字对象，使用在request或session或appliction中。
	 */
	public static PhotoCommentQueryBean PHOTOCOMMENT_QUERY_BEAN = new PhotoCommentQueryBean();

	/**
	 * 服务查询字段的关键字对象，使用在request或session或appliction中。
	 */
	public static ServiceQueryBean SERVICE_QUERY_BEAN = new ServiceQueryBean();

	/**
	 * 服务类型查询字段的关键字对象，使用在request或session或appliction中。
	 */
	public static ServiceTypeQueryBean SERVICETYPE_QUERY_BEAN = new ServiceTypeQueryBean();

	/**
	 * 帖子查询字段的关键字对象，使用在request或session或appliction中。
	 */
	public static TopicQueryBean TOPIC_QUERY_BEAN = new TopicQueryBean();

	/**
	 * 帖子评论查询字段的关键字对象，使用在request或session或appliction中。
	 */
	public static TopicCommentQueryBean TOPICCOMMENT_QUERY_BEAN = new TopicCommentQueryBean();

	/**
	 * 用户查询字段的关键字对象，使用在request或session或appliction中。
	 */
	public static UserQueryBean User_QUERY_BEAN = new UserQueryBean();
}
