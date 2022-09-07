package gold3;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class P1937 {

	static int[][] mp;
	static int[][] dp;
	static int n;
	static final int[] dir_x = {1, -1, 0, 0};
	static final int[] dir_y = {0, 0, 1, -1};
	
	static int answer = 0;
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
				
		n = Integer.parseInt(br.readLine());
		
		mp = new int[n][n];
		dp = new int[n][n];
		int i = 0;
		int j;
		int repeat = n;
		while (repeat-- > 0) {
			StringTokenizer st = new StringTokenizer(br.readLine());
			j = 0;
			while (st.hasMoreTokens()) {
				mp[i][j++] = Integer.parseInt(st.nextToken());
			}
			i++;
		}
		
		for (i = 0; i < n; i++) {
			for (j = 0; j < n; j++) {
				if (dp[i][j] == 0) {
					dfs(i, j);
				}
			}
		}
		System.out.print(answer);
	}
	static void dfs(int x, int y) {
		int val = mp[x][y];
		for (int i = 0; i < 4; i++) {
			int dx = x + dir_x[i];
			int dy = y + dir_y[i];
			
			if (dx >= 0 && dx < n && dy >= 0 && dy < n) {				
				if (mp[dx][dy] > val) {				
					if (dp[dx][dy] == 0) {						
						dfs(dx, dy);
						if (dp[x][y] <= dp[dx][dy]) {							
							dp[x][y] = dp[dx][dy] + 1;
						}
					} else if (dp[x][y] <= dp[dx][dy])  {					
						dp[x][y] = dp[dx][dy] + 1;
					}
				}
			}
		}
		if (dp[x][y] == 0) dp[x][y] = 1;
		if (answer < dp[x][y])	answer = dp[x][y];
	}
}
