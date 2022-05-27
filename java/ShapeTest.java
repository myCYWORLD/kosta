/**
 * 모양에 따른 가로길이와 세로길이를 출력하는 클래스입니다.
 * @author jasonmilian
 *
 */

/**
 * 사각형을 만드는 클래스입니다.
 *
 */
class Rectangle {
	/**
	 * 가로 길이와 세로길이와 면적(가로x세로)을 클래스변수로 선언
	 */
	int width;
	int height;
	int area;	
	
	/**
	 * 사각형의 가로 길이와 세로길이를 매개변수로 받습니다.
	 * @param width
	 * @param height
	 */
	Rectangle(int width, int height) {
		this.width = width;
		this.height = height;
	}
	
	/**
	 * 생성자 오버로딩 this()를 호출하여 위의 생성자를 호출 함.
	 * @param num
	 */
	Rectangle(int num) {
		this(num, num);
	}
	
	/**
	 * 사각형의 가로 길이와 세로길이를 출력해줍니다.
	 */
	public void print() {
		System.out.println("가로 길이는 " + this.width + " 세로 길이는 " + this.height + "인 사각형입니다.");
	}
	
	/**
	 * 가로와 높이를 곱하여 해당 객체의 면적(area)을 구하는 메소드입니다.
	 */
	public void calcArea() {
		this.area = this.width * this.height;
	}
	
	/**
	 * 객체의 면적을 반환하는 메소드입니다.
	 * @return
	 */
	public int getArea() {
		return this.area;
	}
}

/**
 * 모양객체를 생성하고 실행하는 테스트 클래스입니다.
 * @author jasonmilian
 *
 */
public class ShapeTest{
	/**
	 * 메인메소드 실행구간
	 * @param args
	 */
	public static void main(String[] args) {
		Rectangle r = new Rectangle(3,4); // r 객체 생성
		r.calcArea(); // 생성한 r객체에 접근. 하여 calcArea() 호출
		r.print(); // r객체의 print() 호출
		int area = r.getArea();
		System.out.println("면적은 " + area + "입니다.");
		
		Rectangle r1 = new Rectangle(5);
		r1.print();
		
		
	}

}
