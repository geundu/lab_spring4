package local.di;

public class Sonata {

	private String	carColor	= null;
	private int		wheelNum	= 0;
	private int		speed		= 0;

	public Sonata() {

	}

	public Sonata(String carColor, int wheelNum) {
		this.carColor = carColor;
		this.wheelNum = wheelNum;

	}

	public Sonata(String carColor, int wheelNum, int speed) {
		this.carColor = carColor;
		this.wheelNum = wheelNum;
		this.speed = speed;
	}

	@Override
	public String toString() {
		return this.getClass().getName() + "의 자동차의 색은 " + carColor
									+ ", 바퀴 수는 " + wheelNum
									+ ", 속도는 " + speed + "입니다.";
	}
}
