package gui;

/*이벤트 프로그래밍 
//Listener 인터페이스는 감시자 
//ActionEvent : 클릭되었을때 발생되는 이벤트     --> actionPerformed 라는 메서드를 갖고 있음(추상메서드)
//ActionEvent(클릭)가 발생하면 actionPerformed가 자동 호출됨 
 상위 클래스를 interface 또는 abstract class로 만드는 것에 대한 차이 
  - 하위 클래스가 extends로 abstract class로부터 상속을 받으면 단일상속밖에 되지 않음.
  - 하위 클래스가 implements로 interface를 연결하면 ,를 통해 다른 interface를 구현할 수있음. 추가적으로 또다른 부모클래스1개로부터 상속받을 수도 있음.
  - 즉 interface가 구현할 수 있는 가지가 더 많기에 유연함. 
  - 요약하면 추상클래스 -> 단일 상속
             인터페이스 -> 여러인터페이스 + 단일상속 
  - 자식 입장에서 인터페이스를 통해 더 많이 받을 수 있음 따라서 인터페이스로 부모를 만드는 것을 권장함 
  
  - 상위 인터페이스가 다른 인터페이스로부터 상속관계에 있다면, 하위 클래스가 상위 인터페이스를 구현할때 상속된 인터페이스들도 구현해야함.
  - 상위 인터페이스의 매서드를 호출해도 하위 클래스에 오버라이딩된 매서도가 호출됨 
  
  --중첩 클래스
  - inner class : 마치 멤버변수 선언한것처럼 사용 가능 
    			  outer class의 멤버변수나 메서드를 자기것처럼 사용 가능
    			  
*/

import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;   //ctrl shift o
import javax.swing.JTextField;

/**
 * 이벤트 프로그램 절차
 * 1. EventSource(이벤트 발생될 곳)을 결정 				ex)btReady
 * 2. 이벤트 종류를 결정 				   				ex)ActionEvent
 * 3. EventHandler(이벤트가 발생했을때 할 일)을 작성 	ex)class MyHandler implements ActionListener{				인터페이스 호출하고 자동 생성된 메서드에 할일 작성
 * 	  감시자를 구현할 하위 클래스 생성							public void actionPerformed(ActionEvent e)  {			//public abstract가 생략된 것 --> 자식 범위가 작기 때문에 public 추가
 * 																sysout("준비되었습니다"); <~~~할일~~
 * 																}
 * 															}
 * 4.  EventSource와 EventHandler를 연결
 * 		ex)btReady.add~~~ (new MyHandler()); 
 * @author jokw9
 *
 */
//이름있는클래스타입의 객체 코드) 
//class MyHandler implements ActionListener{				//3. EventHandler 작성 
//		public void actionPerformed(ActionEvent e) {			//자동호출되어야 하는 actionPerformed를 재정의(추상클래스라 무조건 오버라이딩해야함)
//			System.out.println("준비되었습니다");
//		}
//}

//inner class 안쓸때 나쁜 예)
//class MyRunHandler implements ActionListener{
////	private JTextField jtf;								 이부분부터
////	public MyRunHandler(JTextField jtf) {
////		this.jtf = jtf;
////	}													 이부분까지는 inner class로 갈때 없어져도 됨 
//	public void actionPerformed(ActionEvent e) {
//		jtf.setText("달립니다");
//	}
//}

public class Race {
	private JFrame jf;
	private JButton btStart, btReady;	//버튼 2개 
	private JTextField jtf; 			//1줄입력란을 알리는 컨퍼런트 
	
	class MyRunHandler implements ActionListener{			//inner class ....
		public void actionPerformed(ActionEvent e) {
			jtf.setText("달립니다");
		}
	}
	public Race() {
		jf = new JFrame("달리기"); 		//창의 타이틀 
		btStart = new JButton("달려");
		btReady = new JButton("준비");	// 1.이벤트 소스 결정
		jtf = new JTextField(10);		//입력란의 가로 넓이
		
		Container c = jf.getContentPane(); //액자뒷판
		c.setLayout(new FlowLayout());
		c.add(btReady);
		c.add(btStart);
		c.add(jtf);
		
		
//이름있는클래스타입의 객체 실행부		
//		MyHandler myHandler = new MyHandler();			//연결하기위해 객체 생성 
//		btReady.addActionListener(myHandler); 			//addActionListener로 핸들러랑 연결
//이름없는클래스타입의 객체 생성)
		btReady.addActionListener(
					new ActionListener() {
						public void actionPerformed(ActionEvent e) {
							//System.out.println("준비되었습니다");
							jtf.setText("준비되었습니다");			//1줄 입력란에 해당 메시지 세팅
						}
					}	 			//addActionListener로 핸들러랑 연결
				);
		
//		btReady.addActionListener(new ActionListener()); //interface는 개별적으로 객체 생성 불가능함
		
//		innerclass 안쓸때 나쁜 예
//		btStart.addActionListener(
//					new MyRunHandler(jtf) 
//				);
		btStart.addActionListener(
				new MyRunHandler()
				);
		
		
		
		jf.setSize(500, 300);			//가로픽셀 500 세로픽셀 300
		jf.setVisible(true);			//나타내기 
		
	}
	
	public static void main(String[] args) {
		new Race();
	}

}
