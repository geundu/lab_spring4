package local.di;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SonataApx {

	public static void main(String[] args) {
		Sonata				herCar	= new Sonata();

		ApplicationContext	context	= new ClassPathXmlApplicationContext("local/di/sonataBean.xml");

		Sonata				myCar	= null;
		myCar = (Sonata) context.getBean("myCar");
		System.out.println("\nmyCar의 " + myCar.toString());

		Sonata yourCar = null;
		yourCar = (Sonata) context.getBean("yourCar");
		System.out.println("yourCar의 " + yourCar.toString());

		Sonata himCar = null;
		himCar = (Sonata) context.getBean("himCar");
		System.out.println("himCar의 " + himCar.toString());

		Sonata thisCar = null;
		thisCar = (Sonata) context.getBean("thisCar");
		System.out.println("thisCar의 " + thisCar.toString());
	}
}
