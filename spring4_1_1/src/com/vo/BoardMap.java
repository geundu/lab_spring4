package com.vo;

import java.util.HashMap;
import java.util.Map;

public class BoardMap {

	private static BoardMap		boardMap	= null;
	private Map<String, Object>	map			= null;

	private BoardMap() {
		initMap();
	}

	public static BoardMap getInstance() {

		if (boardMap == null) {
			boardMap = new BoardMap();
		}
		return boardMap;
	}

	private void initMap() {
		map = new HashMap<String, Object>();

		map.put("bm_no", 0);
		map.put("bm_writer", "");
		map.put("bm_title", "");
		map.put("bm_content", "");
		map.put("bm_email", "");
		map.put("bm_hit", 0);
		map.put("bm_date", "");
		map.put("bm_group", 0);
		map.put("bm_pos", 0);
		map.put("bm_step", 0);
		map.put("bm_pw", "");
		map.put("bm_no", 0);
		map.put("bs_seq", 0);
		map.put("bs_file", "");
		map.put("bs_size", 0.0);
	}

	public Map<String, Object> getMap() {
		return map;
	}
}
