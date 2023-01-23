
public class Solution2 {
	public static void main(String[] args) {
		  Even ev = new Even();
		System.out.println("결과는 :: "+  ev.solu(3));
		System.out.println("결과는 :: "+  ev.solu(4));
		
	}
}	
	//정수 num이 짝수일 경우 "Even"을 반환하고 홀수인 경우 "Odd"를 반환하는 함수, so 을 완성해주세요
	//제한조건 num은 int 범위의 정수입니다.
	// 0은 짝수입니다.
  class Even {
		String	solu(int num) {
			String answer = ""; //삼항연산자를 사용하면 굳이 이건 필요 없을것 같은..
			return num % 2 == 0 ? "Even" : "Odd";
		}
		
	}
