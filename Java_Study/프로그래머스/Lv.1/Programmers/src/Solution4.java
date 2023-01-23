import java.util.Scanner;

public class Solution4 {
	
	public static void main(String[] args) {
		 Solution5 so = new Solution5();
		    Scanner scanner = new Scanner(System.in);
	        System.out.println("입력하세요 :: ");
	        int num = Integer.parseInt(scanner.nextLine());
		   so.solution(num);
		   scanner.close(); //문닫아주기
	}
	
}


// 정수 n을 입력받아 n의 약수를 모두 더한 값을 리턴하는 함수, solution을 완성해주세요.
// 12의 약수는 1, 2, 3, 4, 6, 12입니다. 이를 모두 더하면 28입니다.
		class Solution5 {
		
			
		    public int solution(int num) {
		        int answer = 0;
		        for(int i = 1; i<= num ; i++) {
		        	if(num % i ==0 ) {
		        		answer += i;
		        	}
		        }
		        System.out.println(answer);
		        return answer;
		    }
		    
		    	
		    
		    
		    
		}
	
