package gold3;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;
import java.util.StringTokenizer;

public class P10159 {
	
	public static void main(String[] args) throws Exception {
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int N = Integer.parseInt(br.readLine());
		int M = Integer.parseInt(br.readLine());
		
		ArrayList<Short>[] adj1 = new ArrayList[N + 1]; // 작은 쪽 방향
		ArrayList<Short>[] adj2 = new ArrayList[N + 1]; // 큰 쪽 방향
		boolean[] visit = new boolean[N + 1];
		
		short i = 1;
		while (i < N + 1) {
			adj1[i] = new ArrayList<>();
			adj2[i++] = new ArrayList<>();
		}
		int repeat = M;
		while (repeat-- > 0) {
			StringTokenizer st = new StringTokenizer(br.readLine());
			short big = Short.parseShort(st.nextToken());
			short small = Short.parseShort(st.nextToken());
			
			adj1[big].add(small);
			adj2[small].add(big);
		}
		
		StringBuilder sb = new StringBuilder();
		Queue<Short> bfs = new LinkedList<>();
		i = 1;
		int count;
		while (i <= N) {
			count = 0;
			bfs.add(i);
			
			while (!bfs.isEmpty()) {
				short t = bfs.poll();
				if (!visit[t]) {
					count++;
					visit[t] = true;
				} else {
					continue;
				}
				
				for (short val : adj1[t]) {
					bfs.add(val);
				}
			}
			
			bfs.add(i);
			visit[i] = false;
			count--;
			while (!bfs.isEmpty()) {
				short t = bfs.poll();
				if (!visit[t]) {
					count++;
					visit[t] = true;
				} else {
					continue;
				}
				for (short val : adj2[t]) {
					bfs.add(val);
				}
			}
			sb.append(N-count).append('\n');
			i++;
			
			Arrays.fill(visit, false);
		}
		System.out.print(sb.toString());
	}	
}