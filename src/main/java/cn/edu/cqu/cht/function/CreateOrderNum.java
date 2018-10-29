package cn.edu.cqu.cht.function;

import java.text.SimpleDateFormat;
import java.util.Date;

/*
 * @author CHT
 * @date 创建时间：2018年5月9日 下午10:03:40
 * @version 1.0
 */
public class CreateOrderNum {
	public String init(Integer id) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = simpleDateFormat.format(new Date());
		StringBuilder num = new StringBuilder();
		for (int i = 0; i < 6; i++) {
			num.append(String.valueOf((int) (Math.random() * 10)));
		}
		num = new StringBuilder(String.valueOf(Math.abs(Integer.valueOf(num.toString()) - id)));
		String rand = String.valueOf(num.toString());
		if (rand.length() == 5) {
			rand = "0" + rand;
		}
		
		System.out.println(new Date().toString());
		return date + rand;
	}

	private static CreateOrderNum instance;

	public static CreateOrderNum getInstance() {
		if (instance == null) {
			instance = new CreateOrderNum();
		}
		return instance;
	}

	private CreateOrderNum() {
	}

	public static void main(String[] args) {
		// CreateOrderNum createOrderNum = new CreateOrderNum();
		// System.out.println(createOrderNum.init(1));
		// System.out.println(createOrderNum.init(1));
		// System.out.println(CreateOrderNum.getInstance().init(1));
		System.out.println(CreateOrderNum.getInstance().init(2));
		// ArrayList<String> test = new ArrayList<>();
		// for (int i = 0; i < 100000; i++) {
		// test.add(CreateOrderNum.getInstance().init(1));
		// }
		// int num = 0;
		// for (int i = 0; i < test.size(); i++) {
		// for (int j = i + 1; j < test.size(); j++) {
		// if (test.get(i) != test.get(j)) {
		// continue;
		// } else {
		// System.out.println("false");
		// }
		// }
		// num++;
		// }
		// System.out.println("finished" + num);
	}
}
