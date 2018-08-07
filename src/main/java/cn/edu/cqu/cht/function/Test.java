package cn.edu.cqu.cht.function;

import java.util.ArrayList;

/**
 * @author CHT
 * @date 创建时间：2018年5月14日 下午11:08:56
 * @version 1.0
 */
public class Test {
	public ArrayList<String> showLogistics(String logisticsState) {
		String temp = "";
		ArrayList<String> logistics=new ArrayList<>();
		for (int i = 0; i < logisticsState.length(); i++) {
			if (logisticsState.charAt(i) != '-') {
				temp += String.valueOf(logisticsState.charAt(i));
			} else {
				logistics.add(temp);
				temp="";
				continue;
			}
		}
		return logistics;
	}
	
	private static Test instance;

	public static Test getInstance() {
		if (instance == null) {
			instance = new Test();
		}
		return instance;
	}

	private Test() {
	};
	
	public static void main(String[] args) {
		Test test=new Test();
		String logisticsState="1-2-3-4-5-";
		ArrayList<String> show=test.showLogistics(logisticsState);
		for(String s:show) {
			System.out.println(s);
		}
	}
}
