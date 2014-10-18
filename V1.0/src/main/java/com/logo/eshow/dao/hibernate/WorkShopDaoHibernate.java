package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.WorkShopQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.WorkShopDao;
import com.logo.eshow.model.WorkShop;

public class WorkShopDaoHibernate extends GenericDaoHibernate<WorkShop, Integer>
implements WorkShopDao{
	
	public WorkShopDaoHibernate() {
		super(WorkShop.class);
	}

	public List<WorkShop> list(WorkShopQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<WorkShop> search(WorkShopQueryBean queryBean, int offset,
			int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, WorkShopQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.name != null) {
				rule.add(Restrictions.eq("addTime", queryBean.name));
			}
			
			if (queryBean.tel != null) {
				rule.add(Restrictions.eq("sequence", queryBean.tel));
			}
			
			if (queryBean.qq != null) {
				rule.add(Restrictions.eq("user.id", queryBean.qq));
			}
			
		}
		return rule;
	}

}
