package kosmo80.mvc.sp4;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class EmpLogic {
	Logger logger = Logger.getLogger(EmpLogic.class);

	public List<Map<String, Object>> getEmpList(List<Map<String, Object>> pList) {
		logger.info("getEmpList() called successfully");

		Map<String, Object> rmap = new HashMap<>();
		rmap.put("mem_name", "이순신");
		pList.add(rmap);

		return pList;
	}
}
