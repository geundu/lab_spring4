package web.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.Gson;
import com.util.HashMapBinder;

public class Board41Controller extends MultiActionController {
	Logger					logger		= Logger.getLogger(Board41Controller.class);
	private Board41Logic	boardLogic	= null;

	// setter method를 통한 lazy DI
	public void setBoardLogic(Board41Logic boardLogic) {
		this.boardLogic = boardLogic;
	}

	// request로 유지하는 방법
	// 메서드를 정의하는 것은 가능하다.
	// 파라미터 req, res가 없으면 아무리 xml에 url 매핑을 했다 하더라도 찾지 못한다.
	// 이것만 하더라도 의존적이다.
	// ModelAndView를 사용하였는데, MultiActionController를 상속받았을 때
	// 우리가 doGet에서는 누릴 수 없었던 반환타입을 바꾸어 쓸 수 있는 혜택을 누릴 수 있게 된 것
	// ㅇㅈ?
	public ModelAndView getBoardList(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("Board41Controller ===> getBoardList() 호출 성공");
		req.setCharacterEncoding("UTF-8");
		ModelAndView		mav		= new ModelAndView();
		HashMapBinder		hmb		= new HashMapBinder(req);
		Map<String, Object>	target	= new HashMap<String, Object>();
		hmb.bind(target);
		List<Map<String, Object>> boardList = null;
		boardList = boardLogic.getBoardList(target);

//		HttpSession session = req.getSession();
//		session.setAttribute("boardList", boardList);

		/* setViewName 안 해줘도 WEB-INF/views 밑의 url이 같은 jsp로 알아서 찾아감 */
		mav.setViewName("board/getBoardList");
		mav.addObject("boardList", boardList);

		/* dispatcher로 보내면 WebContent 밑으로 감 */
//		req.setAttribute("boardList", boardList);
//		RequestDispatcher dispatcher = req.getRequestDispatcher("getBoardList.jsp");
//		dispatcher.forward(req, res);
		return mav;
	}

	public ModelAndView getBoardDetail(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("Board41Controller ===> getBoardDetail() 호출 성공");
		req.setCharacterEncoding("UTF-8");
		ModelAndView		mav		= new ModelAndView();
		HashMapBinder		hmb		= new HashMapBinder(req);
		Map<String, Object>	target	= new HashMap<String, Object>();
		hmb.bind(target);
		logger.info(target);
		List<Map<String, Object>> boardDetail = boardLogic.getBoardDetail(target);

		mav.setViewName("board/read");
		mav.addObject("boardDetail", boardDetail);

		return mav;
	}

	// json으로 내보내주는 방법(이 방법은 @RestController:String가 생겼을만큼.. 쓸만하다는건가?
	// @Controller:void, ModelAndView, String)
	public void jsonGetBoardList(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		logger.info("Board41Controller ===> jsonGetBoardList() 호출 성공");
		HashMapBinder		hmb		= new HashMapBinder(req);
		Map<String, Object>	target	= new HashMap<String, Object>();
		hmb.bind(target);
		List<Map<String, Object>> boardList = null;
		boardList = boardLogic.getBoardList(target);
		Gson	g		= new Gson();
		String	temp	= g.toJson(boardList);
		res.setContentType("application/json; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.print(temp);
	}

	// http://localhost:9000/board/boardInsert.sp4?bm_title=연습&bm_writer=유성열&bm_email=test@gmail.com&bm_content=내용&bm_pw=abcd1234&bs_file=a.txt
	public void boardInsert(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HashMapBinder		hmb		= new HashMapBinder(req);
		Map<String, Object>	target	= new HashMap<String, Object>();
		hmb.bind(target);
		int result = boardLogic.boardInsert(target);

		if (result == -1) {
			res.sendRedirect("index.jsp");
		}
		else {
			res.sendRedirect("./getBoardList.jsp");
		}
	}

	public void boardDelete(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HashMapBinder		hmb		= new HashMapBinder(req);
		Map<String, Object>	target	= new HashMap<String, Object>();
		hmb.bind(target);

		int result = boardLogic.boardDelete(target);

		if (result == -1) {
			res.sendRedirect("index.jsp");
		}
		else {
			res.sendRedirect("./getBoardList.jsp");
		}
	}

	public void boardUpdate(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HashMapBinder		hmb		= new HashMapBinder(req);
		Map<String, Object>	target	= new HashMap<String, Object>();
		hmb.bind(target);

		int result = boardLogic.boardUpdate(target);

		if (result == -1) {
			res.sendRedirect("index.jsp");
		}
		else {
			res.sendRedirect("./getBoardList.jsp");
		}
	}
}
