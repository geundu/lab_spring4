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

	public int boardFileInsert(Map<String, Object> target) {
		logger.info("Board41SDao ===> boardFileInsert() 호출 성공");
		int result = 0;

		try {
			result = sqlSessionTemplate.insert("boardFileInsert", target);
		}
		catch (Exception e) {
			logger.info(e.getMessage() + " : 파일첨부 실패 return -1");
			result = -1;
		}

		return result;
	}
}
