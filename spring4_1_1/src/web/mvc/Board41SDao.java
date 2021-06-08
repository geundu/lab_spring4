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

	public int boardInsert(Map<String, Object> target) {
		logger.info("Board41SDao ===> boardInsert() 호출 성공");
		int fileResult = -1;
		int bs_seq = 0;
		bs_seq = sqlSessionTemplate.selectOne("getBsseq");
		target.put("bs_seq", ++bs_seq);
		fileResult = sqlSessionTemplate.insert("boardFileInsert", target);

		return fileResult;
	}
}
