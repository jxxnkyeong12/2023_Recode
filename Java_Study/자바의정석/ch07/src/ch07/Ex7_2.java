package ch07;


public class Ex7_2 {
	public static void main(String[] args) {
		Child c = new Child();
		c.method() ; //여기서 불러와서 실행시켜줘야 아래쪽에 있는 syso이 콘솔창에 나오지!
		
	}
	
}
	class Parent { 
		int x = 10; 
		// super.x 
	}
	
	class Child extends Parent {
		int x = 20; //this.x
		
		void method() {
			System.out.println("x= "+ x);
			System.out.println("this.x = " +  this.x);
			System.out.println("super.x= " + super.x);
		}
		
	}
	

