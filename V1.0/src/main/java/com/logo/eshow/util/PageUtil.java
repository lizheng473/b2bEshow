package com.logo.eshow.util;

import com.logo.eshow.common.page.Page;
import com.logo.eshow.common.page.PageTool;

/**
 * @author zhanglei
 */
public class PageUtil {
	/**
	 * @param page
	 * @return PageTool
	 */
	public static PageTool conversion(Page page) {
		PageTool pageTool = new PageTool(page.getCurrentPage(), page.getPageSize(), page.getTotal());
		return pageTool;
	}
}
