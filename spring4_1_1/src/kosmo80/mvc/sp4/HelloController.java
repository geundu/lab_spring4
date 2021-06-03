package kosmo80.mvc.sp4;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class HelloController extends AbstractController {

	Logger logger = Logger.getLogger(HelloController.class);

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("handleRequestInternal() called successfully");

		res.sendRedirect("/index.jsp");

		return null;
	}
}
