package kosmo80.mvc.sp4;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class EmpController extends MultiActionController {

	private EmpLogic empLogic = null;

	public ModelAndView getEmpList(HttpServletRequest req, HttpServletResponse res) {
		List<Map<String, Object>>	empList	= empLogic.getEmpList();
//		ModelAndView는 scope 속성이 request이다.
//		getEmpList.jsp에서 사용할 attributeName
//		mav.addObject("empList", empList);

//		<property name="prefix" value="/WEB-INF/views/" />
//		<property name="suffix" value=".jsp" />
//		/WEB-INF/views/di/getEmpList.jsp
//		mav.setViewName("di/getEmpList");
		ModelAndView				mav		= new ModelAndView("di/getEmpList", "empList", empList);
		return mav;
	}

	public void empInsert(HttpServletRequest req, HttpServletResponse res) throws IOException {
		logger.info("empInsert called successfully");
		/*
		 * sendRedirect()는 브라우저에서 요청하므로 WEB-INF 이하 경로에 접근할 수 없다
		 */
		res.sendRedirect("di/empInsert");
	}

	public void empUpdate(HttpServletRequest req, HttpServletResponse res) throws IOException {
		logger.info("empUpdate called successfully");
	}

	public void empDelete(HttpServletRequest req, HttpServletResponse res) throws IOException {
		logger.info("empDelete called successfully");
	}

	// setter 객체주입 코드
	public void setEmpLogic(EmpLogic empLogic) {
		this.empLogic = empLogic;
	}
}
