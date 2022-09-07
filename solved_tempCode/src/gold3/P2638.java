package gold3;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;
import java.util.StringTokenizer;

public class P2638 {

	static int[][] mp;
	static int[][] C_check;
	static boolean[][] visit;
	static final int[] dirX = {1, -1, 0, 0};
	static final int[] dirY = {0, 0, 1, -1};
	
	public static void main(String[] args) throws Exception {

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringTokenizer st = new StringTokenizer(br.readLine());
		
		int N = Integer.parseInt(st.nextToken());
		int M = Integer.parseInt(st.nextToken());
		int cheese = 0;
		
		mp = new int[N][M];
		visit = new boolean[N][M];
		C_check = new int[N][M];
		
		ArrayList<int[]> del = new ArrayList<>();
		
		// 데이터 넣기
		int i = 0;
		int j = 0;
		while (i < N) {
			st = new StringTokenizer(br.readLine());
			j = 0;
			while (st.hasMoreTokens()) {
				mp[i][j] = Integer.parseInt(st.nextToken());
				if (mp[i][j] == 1) {
					cheese++;
				}
				j++;
			}
			i++;
		}
		
		int result = 0;
		
		Queue<int[]> que = new LinkedList<>();
		
		
		while (cheese != 0) {
			que.add(new int[] {0, 0});
			visit[0][0] = true;
			while (!que.isEmpty()) {
				int[] now = que.poll();
				int x = now[0];
				int y = now[1];				
				for (i = 0; i < 4; i++) {
					int dx = x + dirX[i]; // N
					int dy = y + dirY[i]; // M
					
					if (dx >= 0 && dy >= 0 && dx < N && dy < M) {
						if (visit[dx][dy]) {
							continue;
						} else if (mp[dx][dy] == 0) {
							que.add(new int[] {dx, dy});
							visit[dx][dy] = true;
						} else {
							C_check[dx][dy]++;
							if (C_check[dx][dy] == 2) {
								del.add(new int[] {dx, dy});
							}
						}
					}
				}
			}
			for (int[] d : del) {
				mp[d[0]][d[1]] = 0;
				cheese--;
			}
			del.clear();
			for (int s = 0; s < N; s++) {
				Arrays.fill(visit[s], false);
				Arrays.fill(C_check[s], 0);
			}
			result++;
		}
		System.out.print(result);
	}
}