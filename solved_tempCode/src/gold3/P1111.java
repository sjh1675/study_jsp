package gold3;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class P1111 {

	public static void main(String[] args) throws Exception {
		
		BufferedReader rd = new BufferedReader(new InputStreamReader(System.in));
		
		int N = Integer.parseInt(rd.readLine());
		
		int[] fc = new int[N];
		int i = 0;
		StringTokenizer st = new StringTokenizer(rd.readLine());
		while (i < N) {
			fc[i++] = Integer.parseInt(st.nextToken()); 
		}
		
		if(N == 1) {
			System.out.print("A");
			return;
		} else if (N == 2) {
			if (fc[0] == fc[1]) {
				System.out.print(fc[0]);
				return;
			} else {
				System.out.print("A");
				return;
			}
		} else {
			if(fc[0] == fc[1]) {
				i = 2;
				while (i < N) {
					if(fc[i] != fc[i-1]) {
						System.out.print("B");
						return;
					}
					i++;
				}
				System.out.print(fc[0]);
			} else {
				int up = fc[2] - fc[1];
				int down = fc[1] - fc[0];
				
				if (up % down != 0) {
					System.out.print("B");
					return;
				} else {
					int a = up / down;				
					int b = fc[1] - fc[0]*a;
					
					i = 2;
					while (i < N) {
						if(fc[i] != a*fc[i-1] + b) {
							System.out.print("B");
							return;
						}
						i++;
					}
					int result = fc[i-1] * a + b;
					System.out.print(result);
				}				
			}
		}
	}	
}