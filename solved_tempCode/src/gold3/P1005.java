package gold3;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.StringTokenizer;

public class P1005 {
	
	
	static ArrayList<Integer>[] adjList;
	static int[] time;
	static int result;
	static int[] memo;
	public static void main(String[] args) throws Exception {
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringBuilder sb = new StringBuilder();
		int T = Integer.parseInt(br.readLine());
		
		while (T-- > 0) {
			StringTokenizer st = new StringTokenizer(br.readLine());
			
			int N = Integer.parseInt(st.nextToken());	// 건물
			int K = Integer.parseInt(st.nextToken());	// 규칙
			
			time = new int[N + 1];
			adjList = new ArrayList[N + 1];
			memo = new int[N + 1];
			Arrays.fill(memo, -1);
			st = new StringTokenizer(br.readLine());
			int i = 1;
			while (st.hasMoreTokens()) {
				time[i++] = Integer.parseInt(st.nextToken());
			}
			
			for (i = 0; i < N + 1; i++) {
				adjList[i] = new ArrayList<>();
			}
			while (K-- > 0) {
				st = new StringTokenizer(br.readLine());
				int x = Integer.parseInt(st.nextToken());
				int y = Integer.parseInt(st.nextToken());
				adjList[y].add(x);
			}
			
			int target = Integer.parseInt(br.readLine());			
			result = dfs(target);
			
			sb.append(result).append('\n');
		}
		System.out.print(sb.toString());
	}
	
	static int dfs(int v) {
		if (memo[v] != -1) {
			return memo[v];
		} else if (adjList[v].isEmpty()) {
			return memo[v] = time[v];
		} else {
			int maxTest;
			int max = Integer.MIN_VALUE;
			for (int vtx : adjList[v]) {
				maxTest = dfs(vtx);
				if(max < maxTest) {
					max = maxTest;
				}
			}
			return memo[v] = max + time[v];
		}
	}
}