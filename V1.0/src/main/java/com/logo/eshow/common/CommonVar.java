package com.logo.eshow.common;

public class CommonVar {
	/**
	 * 私有构造函数
	 */
	private CommonVar() {}
	
	/**
	 * 可用
	 */
	public final static Integer STATE_USE = Integer.valueOf(1);
	
	/**
	 * 不可用
	 */
	public final static Integer STATE_UNUSE = Integer.valueOf(0);

	/**
	 * 顶，收藏，访问的默认值
	 */
	public final static Integer DEFAULT = Integer.valueOf(0);
	
	/**
	 * 默认步长
	 */
	public final static Integer STEP = Integer.valueOf(1);


	/**
	 * Info表Type类型 “添加”
	 */
	public final static String INFO_ADD = "添加";
	
	/**
	 * Info表Type类型 “修改”
	 */
	public final static String INFO_UPDATE = "修改";

	/**
	 * 相册 所有人可见
	 */
	public final static Byte ALBUM_TYPE_P = Byte.valueOf("1");
	/**
	 * 相册 朋友可见
	 */
	public final static Byte ALBUM_TYPE_F = Byte.valueOf("2");
	/**
	 * 相册 仅自己可见
	 */
	public final static Byte ALBUM_TYPE_X = Byte.valueOf("3");
	
	/**
	 * 未审核
	 */
	public final static Integer TOPIC_STATE_UNAUDIT = Integer.valueOf(0);
	
	/**
	 * 已通过
	 */
	public final static Integer TOPIC_STATE_PASS = Integer.valueOf(1);
	
	/**
	 * 未通过
	 */
	public final static Integer TOPIC_STATE_UNPASS = Integer.valueOf(2);
}
