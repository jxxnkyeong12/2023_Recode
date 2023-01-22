package ch07;

class Mypoint extends Object{  //부모가 없었으니까 자동으로 추가됨 - 모든 클래스의 조상인 Object
	 int x ;    //Object 클래스에는 11개의 메소드가 있다. 그중에서 toString()이 중요
	 int y ;
}

//class Circle extends Mypoint { //상속
//	 int r;
//}

class Circle  extends Object{ //포함 컴파일하면 이 코드가 추가된다.
	 Mypoint p ;  // = new MyPoint();
	 int r ;
	 
	 Circle(){
		 p = new Mypoint();
	 }
}

 public class InheritanceTest {
	  public static void main(String[] args) {
		  Circle c = new Circle(); 
		  System.out.println(c.toString() );  //여기에는 없지만 c를 가져왔고, c는 Object를 상속받았기 때문에 toString()을 사용할수 있는거다
		  //ch07.Circle@1eb44e46
		  //클래스 이름하고 @ 뒤로 객체의 주소값을 찍어준다.
		  
		  Circle c2 = new Circle(); 
		  System.out.println(c2.toString() );  //ch07.Circle@1c4af82c - 객체마다 이름이 다르게 나온다
		  System.out.println(c2); //ch07.Circle@1c4af82c - 똑같이 나온다. 위에것과 같은것이다. 
		  //참조변수 c만 출력하는것과 c.toString()하고 같이 호출하는것은 같다
	  }
 }