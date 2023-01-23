package ch07;


public class Ex7_3 {
	public static void main(String[] args) {
		Child2 c = new Child2();
		c.method() ; //여기서 불러와서 실행시켜줘야 아래쪽에 있는 syso이 콘솔창에 나오지!
		
	}
	
}
	class Parent2 { 
		int x = 10; 
		// super.x 
	}
	
	class Child2 extends Parent2 {
		void method() {
			System.out.println("x= "+ x); //10이 나온다!
			System.out.println("this.x = " +  this.x); //10
			System.out.println("super.x= " + super.x); //10
		}
		//모든 인스턴스 메소드에는 this와 super가 지역변수로 존재하는데, 이 들에는 자신이 속한
		// 인스턴스의 주소가 자동으로 저장된다. 조상의 멤버와 자신의 멤버를 구별하는데 사용된다는 점만 제외하면
	    // this와 super는 근본적으로 같다.
	}
	

