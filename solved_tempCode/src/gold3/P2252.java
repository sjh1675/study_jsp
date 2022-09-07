package gold3;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;
import java.util.StringTokenizer;

public class P2252 {

	static ArrayList<ArrayList<Integer>> adjList = new ArrayList<>();
	static boolean[] visit;
	static Queue<Integer> que = new LinkedList<>();
	static int[] right;
	public static void main(String[] args) throws IOException {
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		StringTokenizer st = new StringTokenizer(br.readLine());
		StringBuilder sb = new StringBuilder();
		
		int N = Integer.parseInt(st.nextToken());
		int M = Integer.parseInt(st.nextToken());
		
		visit = new boolean[N + 1];
		right = new int[N + 1];
		for (int i = 0; i < N + 1; i++) {
			adjList.add(new ArrayList<Integer>());
		}
		int x, y;
		for (int i = 0; i < M; i++) {
			st = new StringTokenizer(br.readLine());			
			x = Integer.parseInt(st.nextToken());
			y = Integer.parseInt(st.nextToken());
			adjList.get(x).add(y);
			right[y]++;
		}
		int i = 1;
		Stack<Integer> stk = new Stack<>();
		while (i <= N) {
			if (right[i] == 0) {
				stk.add(i);
			}		
			i++;
		}
		
		while (!stk.isEmpty()) {
			int t = stk.pop();
			sb.append(t).append(' ');
			adjList.get(t).forEach(val -> {
				right[val]--;
				if (right[val] == 0) {
					stk.add(val);
				}
			});
		}
		
		sb.deleteCharAt(sb.length() - 1);
		System.out.print(sb.toString());
	}
}