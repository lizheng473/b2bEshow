package com.logo.eshow.dao.hibernate;

import java.util.List;

import org.hibernate.criterion.Restrictions;

import com.logo.eshow.bean.query.BoardQueryBean;
import com.logo.eshow.common.dao.EnhancedRule;
import com.logo.eshow.common.page.Page;
import com.logo.eshow.dao.BoardDao;
import com.logo.eshow.dao.hibernate.GenericDaoHibernate;
import com.logo.eshow.model.Board;

public class BoardDaoHibernate extends GenericDaoHibernate<Board, Integer>
		implements BoardDao {

	public BoardDaoHibernate() {
		super(Board.class);
	}

	public List<Board> list(BoardQueryBean queryBean) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		return list(rule);
	}

	public Page<Board> search(BoardQueryBean queryBean, int offset, int pagesize) {
		EnhancedRule rule = new EnhancedRule();
		setRule(rule, queryBean);
		rule.setOffset(offset);
		rule.setPageSize(pagesize);
		return page(rule);
	}

	public EnhancedRule setRule(EnhancedRule rule, BoardQueryBean queryBean) {
		if (queryBean != null) {
			if (queryBean.addTime != null) {
				rule.add(Restrictions.eq("addTime", queryBean.addTime));
			}
			if (queryBean.name != null) {
				rule.add(Restrictions.eq("name", queryBean.name));
			}
			if (queryBean.description != null) {
				rule.add(Restrictions.eq("description", queryBean.description));
			}
			if (queryBean.sequence != null) {
				rule.add(Restrictions.eq("sequence", queryBean.sequence));
			}
		}
		return rule;
	}
}
