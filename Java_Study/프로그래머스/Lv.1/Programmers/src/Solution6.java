

public class Solution6 {
	 public static void main(String[] args) {
		Arry arr = new Arry();
		
		System.out.println("마지막 :: "+arr.solution(12345));
	}
}
	/*
	  자연수 n을 뒤집어 각 자리 숫자를 원소로 가지는 배열 형태로 리턴해주세요. 
	  예를들어 n이 12345이면 [5,4,3,2,1]을 리턴합니다.
	 */


class Arry {
    public int[] solution(long n) {
    	String test = String.valueOf(n);  //일단 String으로 담아주고
        int testlength = test.length();  //길이를 확인 -> 길이는 그냥 숫자로 나오니까 int로 담아줘도 됨
        int[] answer = new int[testlength]; // 비어있던 answer에 담기
        int temp = 0; //바꿔담아줄 값 선언

        for(int i  = 0; i<testlength; i++) { //for문으로 돌려돌려
        	temp = Integer.parseInt(test.substring(i, i+1)); //숫자하나하나씩 잘라서 (substring) temp에 담기
            answer[testlength - i - 1] = temp; // 4,3,2,1,0 배열 순으로 들어가는걸 확인할 수 있다! (디버깅모드로 )
        }
        System.out.println(answer);
        return answer;
    }
}
