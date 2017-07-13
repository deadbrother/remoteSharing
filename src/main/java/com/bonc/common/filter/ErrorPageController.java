package com.bonc.common.filter;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ErrorAttributes;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.bonc.common.utils.PropertiesHelper;


@Controller
public class ErrorPageController implements ErrorController{


	private static ErrorPageController appErrorController;

	@Autowired
	private ErrorAttributes errorAttributes;

	private static    PropertiesHelper helper = new PropertiesHelper("/application.properties");
	private static  String DEFAULT_ERROR_VIEW = null;
	static {
		DEFAULT_ERROR_VIEW=helper.getValue("server.error.page");
	}

	private final static String ERROR_PATH = "/error";


	public ErrorPageController(ErrorAttributes errorAttributes) {
		this.errorAttributes = errorAttributes;
	}

	public ErrorPageController() {
		if(appErrorController == null){
			appErrorController = new ErrorPageController(errorAttributes);
		}
	}

	@RequestMapping(value = ERROR_PATH)
	public void errorHtml(HttpServletRequest request,HttpServletResponse res) throws IOException {
		Map<String,Object> errorMsgMap = getErrorAttributes(request, false);
		res.sendRedirect(DEFAULT_ERROR_VIEW.replace("${e.getClass}", errorMsgMap.get("status").toString()).replace("${e.getMessage}", errorMsgMap.get("status").toString()).replace("${e.StackTrace}",errorMsgMap.get("error").toString()));
	}

	@Override
	public String getErrorPath() {
		return ERROR_PATH;
	}


	private boolean getTraceParameter(HttpServletRequest request) {
		String parameter = request.getParameter("trace");
		if (parameter == null) {
			return false;
		}
		return !"false".equals(parameter.toLowerCase());
	}

	private Map<String, Object> getErrorAttributes(HttpServletRequest request,
			boolean includeStackTrace) {     
		RequestAttributes requestAttributes = new ServletRequestAttributes(request);       
		Map<String, Object> map = this.errorAttributes.getErrorAttributes(requestAttributes,includeStackTrace);  
		String URL = request.getRequestURL().toString();
		map.put("URL", URL);        
		System.out.println(map.get("status")+"----"+URL);
		return map;
	}

	private HttpStatus getStatus(HttpServletRequest request) {
		Integer statusCode = (Integer) request
				.getAttribute("javax.servlet.error.status_code");
		if (statusCode != null) {
			try {
				return HttpStatus.valueOf(statusCode);
			}
			catch (Exception ex) {
			}
		}
		return HttpStatus.INTERNAL_SERVER_ERROR;
	}   

}