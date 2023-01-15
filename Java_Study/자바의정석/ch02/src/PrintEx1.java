
public class PrintEx1 {

	public static void main(String[] args) {
//			System.out.println(10/3); //정수 나누기 정수라서 결과도 정수로 나온다 3
//			System.out.println(10.0/3); //3.3333333333333335
//			System.out.printf("%#o%n", 15);  //#은 접두사!
//			System.out.printf("%#x%n", 15);
//			System.out.printf("%#X%n", 15);
//			System.out.printf("%#X", 14);
			
//			System.out.printf("%d%n", 15);
//			System.out.printf("%#o%n", 15); //8진수
//			System.out.printf("%#x%n", 15);  //16진수
//			System.out.printf("%s", Integer.toBinaryString(15));  //2진 문자열
//		
			float f = 123.456789f;
			System.out.printf("%f%n", f); //7자리까지만 의미있고 뒤에는 의미없는 숫자들이다
			System.out.printf("%e%n", f);
			System.out.printf("%g%n", f);
	}

}
