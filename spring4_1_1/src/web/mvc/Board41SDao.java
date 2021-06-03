package web.mvc;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class Board41SDao {
	SqlSessionTemplate	sqlSessionTemplate	= null;
	Logger				logger				= Logger.getLogger(Board41Logic.class);

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
}
