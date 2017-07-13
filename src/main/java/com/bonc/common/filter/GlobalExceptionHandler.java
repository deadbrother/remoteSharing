package com.bonc.common.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.bonc.common.utils.PropertiesHelper;

@ControllerAdvice
class GlobalExceptionHandler {
	private static    PropertiesHelper helper = new PropertiesHelper("/application.properties");
	private static  String defaultPage = null;
	static {
		defaultPage=helper.getValue("server.error.page");
	}
    @ExceptionHandler(value = Exception.class)
    public void defaultErrorHandler(HttpServletRequest req,HttpServletResponse rs, Exception e) throws Exception {
    	String sOut="";
    	StackTraceElement[] trace = e.getStackTrace();
        for (StackTraceElement s : trace) {
            sOut += "\tat " + s + "\r\n";
        }
    	String redirectUrl = defaultPage.replace("${exClass}",e.getClass().toString()).replace("${exMessage}", e.getMessage()==null?"":e.getMessage()).replace("${exStackTrace}", "null");
    	rs.sendRedirect(redirectUrl);
    }
}

/*class GlobalExceptionHandler extends  BasicErrorController{

	public GlobalExceptionHandler(ErrorAttributes errorAttributes) {
		super(errorAttributes);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	@RequestMapping(produces = "text/plain")
	public ModelAndView errorHtml(HttpServletRequest request,
			HttpServletResponse response) {
		response.setStatus(getStatus(request).value());
		Map<String, Object> model = getErrorAttributes(request,
				isIncludeStackTrace(request, MediaType.TEXT_HTML));
		return new ModelAndView("error", model);
	}

	
}*/