package kz.project.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    protected Class<?>[] getRootConfigClasses(){
        return new Class[]{WebMVCConfig.class, HibernateConfig.class, BeansConfig.class};
    }
    protected Class<?>[] getServletConfigClasses() {
        return null;
    }
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }
}
