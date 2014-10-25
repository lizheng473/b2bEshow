package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.ProductionTaskQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.ProductionTaskDao;
import com.logo.eshow.model.ProductionTask;

public class ProductionTaskDaoHibernate extends GenericDaoHibernate<ProductionTask, Integer>
implements ProductionTaskDao{

	public ProductionTaskDaoHibernate() {
		super(ProductionTask.class);
	}

	@Override
	public List<ProductionTask> list(ProductionTaskQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	@Override
	public Page<ProductionTask> search(ProductionTaskQueryBean queryBean,
			int offset, int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}
	
	public EnhancedRule setRule(EnhancedRule rule, ProductionTaskQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.orderfromid != null) {
				rule.add(Restrictions.eq("orderfromid", queryBean.orderfromid));
			}
			if (queryBean.workshopid != null) {
				rule.add(Restrictions.eq("workshopid", queryBean.workshopid));
			}
			if (queryBean.status != null) {
				rule.add(Restrictions.eq("status", queryBean.status));
			}
			if (queryBean.getOrder() != null) {
				rule.addOrder(queryBean.getDesc() ? Order.desc(queryBean
						.getOrder()) : Order.asc(queryBean.getOrder()));
			}
		}
		return rule;

	}
}
