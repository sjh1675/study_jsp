package gold3;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class P14890 {
	
	public static void main(String[] args) throws IOException {
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringTokenizer st = new StringTokenizer(br.readLine());
		
		int N = Integer.parseInt(st.nextToken());
		int L = Integer.parseInt(st.nextToken());
		
		int[][] mp = new int[N][N];
		
		int i = 0;
		while (i < N) {
			st = new StringTokenizer(br.readLine());			
			int j = 0;
			while (st.hasMoreTokens()) {
				mp[i][j++] = Integer.parseInt(st.nextToken());
			}
			i++;
		}
		
		int pre = 0;
		int now = 0;
		int pow = 0;
		int result = 0;
		for (int col = 0; col < N; col++) {
			int row = 0;
			int failFlag = 0;
			pre = mp[col][row++];
			pow = 1;
			for (; row < N; row++) {
				now = mp[col][row];
				if (now == pre) {
					pow++;
				} else if (now - pre == 1 && pow >= L) {
					pow = 1;
				} else if (pre - now == 1 && pow >= 0) {
					pow = -L + 1;
				} else {
					failFlag = 1;
					break;
				}
				pre = now;
			}			
			if (failFlag == 0 && pow >= 0) {
				result++;
			}
		}
		
		
		pre = 0;
		now = 0;
		pow = 0;
		for (int row = 0; row < N; row++) {
			int col = 0;
			int failFlag = 0;
			pre = mp[col++][row];
			pow = 1;
			for (; col < N; col++) {
				now = mp[col][row];
				if (now == pre) {
					pow++;
				} else if (now - pre == 1 && pow >= L) {
					pow = 1;
				} else if (pre - now == 1 && pow >= 0) {
					pow = -L + 1;
				} else {
					failFlag = 1;
					break;
				}
				pre = now;
			}			
			if (failFlag == 0 && pow >= 0) {
				result++;
			}
		}
		System.out.print(result);
	}
}