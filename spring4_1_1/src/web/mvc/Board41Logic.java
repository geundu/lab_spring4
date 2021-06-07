package web.mvc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class Board41Logic {
	Logger				logger		= Logger.getLogger(Board41Logic.class);
	private Board41MDao	boardMDao	= null;
	private Board41SDao	boardSDao	= null;

	public void setBoardMDao(Board41MDao boardMDao) {
		this.boardMDao = boardMDao;
	}

	public void setBoardSDao(Board41SDao boardSDao) {
		this.boardSDao = boardSDao;
	}

	public List<Map<String, Object>> getBoardList(Map<String, Object> target) {
		logger.info("Board41Logic ===> getBoardList() 호출 성공");
		List<Map<String, Object>> boardList = null;
		boardList = boardMDao.getBoardList(target);
		return boardList;
	}

	public int boardInsert(Map<String, Object> target) {
		logger.info("Board41Logic ===> boardInsert() 호출 성공");
		int	insertResult	= -1;
		int	fileResult		= 0;
		int	resultNum		= -1;
		insertResult = boardMDao.boardInsert(target);

		if (target.containsKey("bs_file")) {
			fileResult = boardSDao.boardInsert(target);
		}

		if (insertResult != -1 && fileResult != -1) {
			resultNum = 1;
		}
		return resultNum;
	}
}
