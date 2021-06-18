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

	public List<Map<String, Object>> getBoardDetail(Map<String, Object> target) {
		logger.info("Board41Logic ===> getBoardDetail() 호출 성공");
		List<Map<String, Object>> boardDetail = null;
		boardDetail = boardMDao.getBoardList(target);
		int bm_hit = Integer.parseInt(String.valueOf(target.get("bm_no")));
		boardMDao.hitCount(bm_hit);

		return boardDetail;
	}

	public int boardInsert(Map<String, Object> target) {
		logger.info("Board41Logic ===> boardInsert() 호출 성공");
		int	boardMInsert	= 0;
		int	boardSInsert	= 0;
		int	result			= 0;
		int	bm_no			= 0;
		int	bm_group		= 0;
		int	bs_seq			= 0;

		// 새 글은 bm_no, bm_group이 없다.
		// read.jsp 상세보기는 bm_no, bm_group가 존재하고 0보다 크다.

		// read.jsp 즉, 게시글 상세보기 페이지에서 boardInsert()를 호출했다.
		if (target.get("bm_group") != null) {
			bm_group = Integer.parseInt(String.valueOf(target.get("bm_group")));
		}

		bm_no = boardMDao.getBmno();
		target.put("bm_no", bm_no);

		// 댓글일 경우
		if (bm_group > 0) {
			boardMDao.bmStepUpdate(target);
			target.put("bm_pos", Integer.parseInt(String.valueOf(target.get("bm_pos"))) + 1);
			target.put("bm_step", Integer.parseInt(String.valueOf(target.get("bm_step"))) + 1);
		}
		// 새 글일 경우
		else {
			bm_group = boardMDao.getBmGroup();
			target.put("bm_group", bm_group);
			target.put("bm_pos", 0);
			target.put("bm_step", 0);
		}
		boardMInsert = boardMDao.boardMInsert(target);

		// 첨부파일이 있는가?
		if (target.get("bs_file") != null && String.valueOf(target.get("bs_file")).length() > 0) {
//			target.put("bm_no", bm_no);
			bs_seq = boardSDao.getBsseq();
			target.put("bs_seq", bs_seq);
			boardSInsert = boardSDao.boardSInsert(target);
		}

		if (boardMInsert != -1 && boardSInsert != -1) {
			result = 1;
		}
		else {
			result = -1;
		}
		return result;
	}

	public int boardDelete(Map<String, Object> target) {
		int	boardMDelete	= 0;
		int	boardSDelete	= 0;
		int	result			= 0;

		boardSDelete = boardSDao.boardSDelete(target);
		boardMDelete = boardMDao.boardMDelete(target);

		if (boardMDelete != -1 && boardSDelete != -1) {
			result = 1;
		}
		else {
			result = -1;
		}
		return result;
	}

	public int boardUpdate(Map<String, Object> target) {
		int	boardMUpdate	= 0;
		int	boardSUpdate	= 0;
		int	result			= 0;

		boardMUpdate = boardMDao.boardMUpdate(target);
		boardSUpdate = boardSDao.boardSUpdate(target);

		if (boardMUpdate != -1 && boardSUpdate != -1) {
			result = 1;
		}
		else {
			result = -1;
		}
		return result;
	}
}
