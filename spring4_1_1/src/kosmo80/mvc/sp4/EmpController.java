package kosmo80.mvc.sp4;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class EmpController extends MultiActionController {

	public ModelAndView getEmpList(HttpServletRequest req, HttpServletResponse res) {
		ModelAndView				mav		= new ModelAndView();
		List<Map<String, Object>>	empList	= new ArrayList<>();
		Map<String, Object>			rmap	= new HashMap<>();

		rmap.put("mem_name", "이순신");
		empList.add(rmap);
//		ModelAndView는 scope 속성이 request이다.
		mav.addObject("empList", empList);

//		<property name="prefix" value="/WEB-INF/views/" />
//		<property name="suffix" value=".jsp" />
//		/WEB-INF/views/getEmpList.jsp
		mav.setViewName("di/getEmpList");
		return mav;
	}

	public void empInsert(HttpServletRequest req, HttpServletResponse res) throws IOException {
		res.sendRedirect("di/empInsert");
	}

	public void empUpdate(HttpServletRequest req, HttpServletResponse res) throws IOException {
		res.sendRedirect("di/empUpdate");
	}

	public void empDelete(HttpServletRequest req, HttpServletResponse res) throws IOException {
		res.sendRedirect("di/empDelete");
	}
}
