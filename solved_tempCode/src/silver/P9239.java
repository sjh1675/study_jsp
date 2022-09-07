package silver;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class P9239 {

	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		double x = Double.parseDouble(br.readLine());
		int t, pre, pow;
		double cal;
		StringBuilder sb = new StringBuilder();
		for (int i = 1; i < 100000000; i++) {
			if (i == 384615) {
				System.out.println("테스트");
			}
			pre = t = i;
			pow = 1;			
			while (t > 10) {
				pre = t;
				t = t/10;
				pow *= 10;
			}
			if(pre % 10 == 0) {
				continue;
			}
			t = (i - t * pow) * 10 + t;
			
			cal = i * x;
			if (cal == (double)t) {
				sb.append(i).append('\n');
			}
		}
		if(sb.length() > 0) {
			System.out.print(sb.toString());
		} else {
			System.out.print("No solution");
		}
	}
}
