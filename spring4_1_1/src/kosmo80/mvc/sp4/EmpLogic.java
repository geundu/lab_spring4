package kosmo80.mvc.sp4;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class EmpLogic {
	Logger logger = Logger.getLogger(EmpLogic.class);

	public List<Map<String, Object>> getEmpList() {
		logger.info("getEmpList() called successfully");

		List<Map<String, Object>>	tempList	= new ArrayList<Map<String, Object>>();
		Map<String, Object>			rmap		= new HashMap<>();
		rmap.put("mem_name", "이순신");
		tempList.add(rmap);

		return tempList;
	}
}
