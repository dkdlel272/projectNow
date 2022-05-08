package sitemesh;

import javax.servlet.annotation.WebFilter;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

@WebFilter("/*")
public class SiteMeshFilter extends ConfigurableSiteMeshFilter{

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		builder
			.addDecoratorPath("/*", "/layout/head.jsp")
			.addDecoratorPath("/camp/CampManager", "/WEB-INF/view/manager.jsp")
			.addDecoratorPath("/camp/reserveManager", "/WEB-INF/view/manager.jsp")
			.addDecoratorPath("/board/list_admin", "/WEB-INF/view/manager.jsp")
			.addDecoratorPath("/userdata/userdataList", "/WEB-INF/view/manager.jsp")
			.addDecoratorPath("/userdata/blackList", "/WEB-INF/view/manager.jsp")
			.addDecoratorPath("/userdata/leaveList", "/WEB-INF/view/manager.jsp")
			.addExcludedPath("/camp/campUpdate")
			.addExcludedPath("/camp/CampInsert")
			.addExcludedPath("/userdata/readId")
			.addExcludedPath("/userdata/manager");
		
		
	}
}
