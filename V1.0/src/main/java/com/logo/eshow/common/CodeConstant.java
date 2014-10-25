package com.logo.eshow.common;

public class CodeConstant {
 /**
	<option value="0">未确认</option>
	<option value="1">已完成</option>
	<option value="2">已确认</option>
	<option value="3">派送生产车间</option>
	<option value="4">车间已接收</option>
	<option value="5">车间生产完毕</option>
	<option value="6">配送物流</option>
 * **
 * @author lizheng
 *
 */
	public static class OrderFormStatus{
		public final static String START="0";
		public final static String DONE="1";
		public final static String QUIRE="2";
		public final static String WORKSHOP="3";
		public final static String WORKSHOPREC="4";
		public final static String MAKEDONE="5";
		public final static String EXPRESS="6";
	}
	
	 /**
	 * **
	 * @author lizheng
	 *
	 */
	public static class ProductionTaskStatus{
		public final static String START="0"; //初始状态
		public final static String DONE="1";  //生产完毕
		public final static String QUIRE="2"; //已经确认
		//public final static String QUIRE="2";作废
	}
}
