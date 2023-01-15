
public class Ex8_4 {
	
	public static void main(String[] args) {
		System.out.println(1);
		System.out.println(2);
			try {
				System.out.println(3);
			//	System.out.println(0/0);  //ArithmeticException
				System.out.println(args[0]); //ArrayIndexOutOfBoundsException
				// 배열 범위 벗어남
				System.out.println(4); //실행되지 않고 넘어간다
			} catch (ArithmeticException e) {
			    if(e instanceof ArithmeticException) // instanceof는 객체 타입을 확인하는 연산자이다
			    																//형변환 가능 여부를 확인하며 true / false로 결과를 반환한다
			    	System.out.println("true");
			    System.out.println("ArithmeticException");
			
			}catch(ArrayIndexOutOfBoundsException e){ // 이처리를 해주지 않으면 비정상 종료되고 실행중 예외 발생이 뜬다(죽음)
				System.out.println("ArrayIndexOutOfBoundsException!");  //정상종료 (예외가 종료됐기 때문에)
			}catch(Exception e){ 
				System.out.println("Exception");
			}//try - catch 끝
		System.out.println(6);
	} //main 메서드의 끝
}
