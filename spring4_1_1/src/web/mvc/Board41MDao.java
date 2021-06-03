package web.mvc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

import com.vo.BoardMap;

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
		boardMap = BoardMap.getInstance();
		boardList = sqlSessionTemplate.selectList("getBoardAllList", target);
		return boardList;
	}
}
