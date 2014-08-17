<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="/WEB-INF/stringutil.tld" prefix="util"%>
<s:action name="category!view" id="categoryList" executeResult="false" />
<c:set var="myid">
	<authz:authentication operation='id' />
</c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>开发日志</title>
		<meta name="keywords" content="开发日志" />
		<meta name="description" content="开发日志" />
	</head>
	<body>
		<div id="content">

			<div id="products_banner">
			</div>
			<div id="postpath">
				<strong>当前页面：<a href="<c:url value='/'/>" title="首页">首页</a>
					&raquo; WES蠕虫预警系统</strong>
			</div>

			<div id="post-73" class="page">
				<div class="entry-content">
					<p>
						<span style="color: #ff0000;"><strong>蠕虫预警系统（WES）</strong>
						</span>
					</p>
					<p>
						蠕虫预警系统用来针对企业主动预警蠕虫攻击行为，不但能避免蠕虫的大规模爆发，而且能减少管理员关注防火墙和入侵检测系统日志告警的工作量，也使得蠕虫实际的感染攻击过程能够得到事后审计。
					</p>
					<p>
						<span style="color: #ff0000;"><strong>蠕虫预警系统的主要技术特点</strong>
						</span>
					</p>
					<p>
						＊基于操作系统底层的核心预警技术：WES蠕虫预警系统本身不采用任何规则库，而是在基于操作系统底层对新文件和新进程的创建和打开做监控，一旦有蠕虫感染进来，立即发现，实时报警。
					</p>
					<p>
						＊主动和被动报警方式兼备：WES蠕虫预警系统具备5种报警模式，其中2种是主动报警（短信和email）模式，2种是被动报警(http和ssh)模式，还有1种是调试模式报警。
					</p>
					<p>
						＊高强度的自身安全性：在提供给探测器无与伦比性能与稳定性的同时，WES自身具备了超强的安全性，WES蠕虫预警系统利用了host和guest模式，做到了host端只开可自定义的ssh端口和可信任的访问ip源地址，同时对guest的网络性能作了严格的限制，不至于guest端成为蠕虫的帮凶来占用网络的带宽。
					</p>
					<p>
						＊完备的取证审计日志：WES蠕虫预警系统具有强大的底层审计功能，做到了真正意义上的细粒度审计，能实时的记录蠕虫感染的源ip地址、溢出和扫描的感染过程，包括蠕虫对文件系统、进程系统、网络系统的所有逐步操作，同时还克隆了蠕虫源体，可作为提供给适合用户事后取证用的详细的蠕虫审计日志。
					</p>
					<p>
						＊多点备份：WES蠕虫预警系统以后可以考虑在有需要的地方分别部署WES的预警前端，日志记录可以通过网络汇聚到后端的syslogd数据库服务器做统一归类和分析整理，使网管中心的安全管理员能进行全网的蠕虫预警掌握。
					</p>
				</div>
			</div>
			<!-- .post -->

		</div>
		<!-- #content -->

		<div id="sidebar">

			<div class="sidebar_li">
				<ul>
					<li class="page_item page-item-78">
						<a href="sr-lane.html" title="SR-LANE">SR-LANE</a>
					</li>
					<li class="page_item page-item-96">
						<a href="smb-audit.html" title="文件共享协议审计系统">文件共享协议审计系统</a>
					</li>
					<li class="page_item page-item-94">
						<a href="greencrypt.html" title="Greencrypt">Greencrypt</a>
					</li>
					<li class="page_item page-item-93">
						<a href="eden.html" title="eden服务器安全监控平台">eden服务器安全监控平台</a>
					</li>
					<li class="page_item page-item-73 current_page_item">
						<a href="wes.html" title="WES蠕虫预警系统">WES蠕虫预警系统</a>
					</li>
					<li class="page_item page-item-74">
						<a href="dnss.html" title="目录网络封印系统">目录网络封印系统</a>
					</li>
					<li class="page_item page-item-97">
						<a href="odin.html" title="Odin">Odin</a>
					</li>
					<li class="page_item page-item-77">
						<a href="rdpmon" title="RDPMON">RDPMON</a>
					</li>
					<li class="page_item page-item-75">
						<a href="sjksj.html" title="图形操作审计系统">图形操作审计系统</a>
					</li>
					<li class="page_item page-item-76">
						<a href="sjksm.html" title="数据库扫描系统">数据库扫描系统</a>
					</li>
				</ul>
			</div>
		</div>
		<!-- #sidebar -->
	</body>
</html>