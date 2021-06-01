package web.mvc;

import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class Board41Controller extends MultiActionController {
	private Board41Logic boardLogic = null;
	// setter method를 통한 lazy DI
	public void setBoardLogic(Board41Logic boardLogic) {
		this.boardLogic = boardLogic;
	}
}
