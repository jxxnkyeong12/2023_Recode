
public class Solution {
	
	public static void main(String[] args) {
			solution1(123);
			System.out.println("도합몇이냐"+	solution1(123));
			
		
	} 
	
		//자연수 N이 주어지면, N의 각 자릿수의 합을 구해서 return하는 
		// solution 함수를 만들어 주세요 
		// 예를 들어 N = 123 이면 1+2+3 = 6을 return 하면 됩니다.
	    public static int solution1(int n) {
	        	int answer = 0;
	        
	        	String[] arr = String.valueOf(n).split("");
	        	for (String x : arr) {
					  answer += Integer.parseInt(x);
				}
		
	        return answer;
	    
	}
}
