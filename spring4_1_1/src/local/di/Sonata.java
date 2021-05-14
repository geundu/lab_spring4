package local.di;

public class Sonata {

	private String	carColor	= null;
	private int		wheelNum	= -1;
	private int		speed		= -1;

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
		return "자동차의 색은 " + carColor + ", 바퀴 수는 " + wheelNum + ", 속도는 " + speed + "입니다.";
	}

	public String getCarColor() {
		return carColor;
	}

	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}

	public int getWheelNum() {
		return wheelNum;
	}

	public void setWheelNum(int wheelNum) {
		this.wheelNum = wheelNum;
	}

	public int getSpeed() {
		return speed;
	}

	public void setSpeed(int speed) {
		this.speed = speed;
	}
}
