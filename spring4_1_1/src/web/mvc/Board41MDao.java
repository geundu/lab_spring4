package web.mvc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

import com.vo.BoardMap;

/**
 * @author GEUNDU-HOME
 *
 */
public class Board41MDao {
	SqlSessionTemplate	sqlSessionTemplate	= null;
	BoardMap			boardMap			= null;
	Logger				logger				= Logger.getLogger(Board41Logic.class);

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List<Map<String, Object>> getBoardList(Map<String, Object> target) {
		logger.info("Board41MDao ===> getBoardList() 호출 성공");
		List<Map<String, Object>> boardList = null;
		boardList = sqlSessionTemplate.selectList("getBoardList", target);

		return boardList;
	}

	public void hitCount(int bm_hit) {
		sqlSessionTemplate.update("hitCount", bm_hit);
	}

	/**
	 * bm_no를 가져와 1을 더해주는 메서드
	 * 
	 * @return bm_no + 1을 리턴
	 */
	public int getBmno() {
		logger.info("Board41MDao ===> getBmno() 호출 성공");
		int bm_no = sqlSessionTemplate.selectOne("getBmno");

		return bm_no;
	}

	/**
	 * bm_group를 가져와 1을 더해주는 메서드
	 * 
	 * @return bm_group + 1을 리턴
	 */
	public int getBmGroup() {
		logger.info("Board41MDao ===> getBmGroup() 호출 성공");
		int bm_group = sqlSessionTemplate.selectOne("getGroup");

		return bm_group;
	}

	/**
	 * 게시글을 insert하는 메서드
	 * 
	 * @param target 쿼리스트링이 매핑된 맵을 파라미터로 전달 (#{bm_no}, #{bm_title}, #{bm_writer},
	 *               TO_CHAR (SYSDATE, 'YYYY-MM-DD HH24:MI:SS'), #{bm_email},
	 *               #{bm_content}, #{bm_group}, 0, 0, #{bm_pw}, 0)
	 * @return insert된 레코드의 개수를 리턴
	 */
	public int boardMInsert(Map<String, Object> target) {
		logger.info("Board41MDao ===> boardMInsert() 호출 성공");
		int result = 0;

		try {
			result = sqlSessionTemplate.insert("boardMInsert", target);
		}
		catch (Exception e) {
			logger.info(e.getMessage() + " : 게시글 작성 실패 return -1");
			result = -1;
		}
		return result;
	}

	public int boardMDelete(Map<String, Object> target) {
		logger.info("Board41MDao ===> boardMDelete() 호출 성공");
		int result = 0;

		try {
			result = sqlSessionTemplate.delete("boardMDelete", target);
		}
		catch (Exception e) {
			logger.info(e.getMessage() + " : 게시글 삭제 실패 return -1");
			result = -1;
		}
		return result;
	}

	/**
	 * bm_step을 1 더해주는 메서드
	 * 
	 * @param target
	 */
	public void bmStepUpdate(Map<String, Object> target) {
		logger.info("Board41MDao ===> bmStepUpdate() 호출 성공");
		sqlSessionTemplate.update("bmStepUpdate", target);
	}

	/**
	 * 게시글 수정 메서드 UPDATE BOARD_MASTER_T SET BM_TITLE = #{bm_title}, BM_CONTENT =
	 * #{bm_content} WHERE BM_NO = #{bm_no} AND BM_PW = #{bm_pw}
	 * 
	 * @param target - 글번호, 제목, 내용, 비밀번호가 매핑된 맵
	 * @return 업데이트된 레코드의 개수를 리턴
	 */
	public int boardMUpdate(Map<String, Object> target) {

		logger.info("Board41MDao ===> boardMUpdate() 호출 성공");
		int result = 0;

		try {
			result = sqlSessionTemplate.update("boardMUpdate", target);
		}
		catch (Exception e) {
			logger.info(e.getMessage() + " : 게시글 수정 실패 return -1");
			result = -1;
		}
		return result;
	}
}
