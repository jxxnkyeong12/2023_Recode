import java.lang.reflect.Array;
import java.text.DecimalFormat;
import java.util.Arrays;

public class Solution3 {
	
	/*
	 정수를 담고 있는 배열 arr의 평균값을 return하는 함수
	 , solution을 완성해보세요. 
	 ▶arr은 길이 1 이상, 100 이하인 배열입니다.
	 ▶arr의 원소는 -10,000 이상 10,000 이하인 정수입니다.
	*/
	
	public static void main(String[] args) {
		avgNumber an = new avgNumber();
		int[] test = new int [4];
		
		test[0] = 1;
		test[1] = 2;
		test[2] = 3;
		test[3] = 4;
	
		
		 an.avg(test);
			System.out.println("뭘로나와?:: " +an.avg(test) );
	}
}
	class avgNumber {
		double avg (int[] arr) {
			double answer = 0;
			
//		1. 첫번째 방법 ->평소 하던대로 더하기 변수 값을 지정해주고, for문을 돌려서 값을 더해주고, 배열의 길이만큼 나눠준다.
			//double sum = 0;
//			 
//			 for (int i : arr) {
//				sum += i; 
//						
//			}
//			 
//			 answer = sum / arr.length;
//			 Math.round(answer);
			
			//2. 두번째 방법 -Arrays.stram()
			//Arrays.stram()은 'Java 8' 지원되기 시작한 기능이다. 컬렉션에 저장되어 있는 
			// 엘리먼트들을 하나씩 순화하면서 처리할 수 있는 코드 패턴이다. 
			// 또한 내부 반복자를 사용하기 때문에 병렬처리가 쉽다는 점이 있다.
					 return (int)Arrays.stream(arr).average().orElse(0); 
		
		}
}

