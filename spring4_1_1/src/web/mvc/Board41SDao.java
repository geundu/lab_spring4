package web.mvc;

import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class Board41SDao {
	SqlSessionTemplate	sqlSessionTemplate	= null;
	Logger				logger				= Logger.getLogger(Board41Logic.class);

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public int getBsseq() {
		logger.info("Board41SDao ===> getBsseq() 호출 성공");
		int bs_seq = sqlSessionTemplate.selectOne("getBsseq");

		return bs_seq;
	}

	public int boardSInsert(Map<String, Object> target) {
		logger.info("Board41SDao ===> boardSInsert() 호출 성공");
		int result = 0;

		try {
			result = sqlSessionTemplate.insert("boardSInsert", target);
		}
		catch (Exception e) {
			logger.info(e.getMessage() + " : 파일첨부 실패 return -1");
			result = -1;
		}

		return result;
	}

	public int boardSDelete(Map<String, Object> target) {
		logger.info("Board41SDao ===> boardSDelete() 호출 성공");
		int result = 0;

		try {
			result = sqlSessionTemplate.insert("boardSDelete", target);
		}
		catch (Exception e) {
			logger.info(e.getMessage() + " : 첨부파일 삭제 실패 return -1");
			result = -1;
		}

		return result;
	}

	public int boardSUpdate(Map<String, Object> target) {

		logger.info("Board41SDao ===> boardSUpdate() 호출 성공");
		int result = 0;

		try {
			result = sqlSessionTemplate.update("boardSUpdate", target);
		}
		catch (Exception e) {
			logger.info(e.getMessage() + " : 첨부파일 변경 실패 return -1");
			result = -1;
		}
		return result;
	}
}
