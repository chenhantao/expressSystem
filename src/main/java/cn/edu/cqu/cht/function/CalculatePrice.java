package cn.edu.cqu.cht.function;

/*
 * @author CHT
 * @date 创建时间：2018年5月11日 上午2:40:13
 * @version 1.0
 */
public class CalculatePrice {
	public Double init(Double weight, Integer pLevel1, Integer pLevel2, Integer cLevel1, Integer cLevel2,
			Integer aLevel1, Integer aLevel2) {

		Double price = 0.00;

		Integer pLevel = Math.abs(pLevel1 - pLevel2);
		Integer cLevel = Math.abs(cLevel1 - cLevel2);
		Integer aLevel = Math.abs(aLevel1 - aLevel2);

		if (pLevel == 0 && cLevel == 0 && aLevel == 0) {
			if (weight < 1.0) {
				price = 10.0;
			} else {
				price = 10.0 + (weight - 1.0) * 1.0;
			}
		} else if (pLevel == 0 && cLevel == 0 && aLevel != 0) {
			if (weight < 1.0) {
				price = 10.0;
			} else {
				price = 10.0 + (weight - 1.0) * 2.0;
			}
		} else if (pLevel == 0 && cLevel != 0) {
			if (weight < 1.0) {
				price = 12.0;
			} else {
				price = 12.0 + (weight - 1.0) * 4.0;
			}
		} else if (pLevel != 0) {
			if (weight < 1.0) {
				price = 18.0;
			} else {
				price = 18.0 + (weight - 1.0) * 7.0;
			}
		}
		return Double.valueOf(String.format("%.2f", price));
	}

	public Double init2(Double weight, String senderProvince, String senderCity, String senderArea,
			String recipientProvince, String recipientCity, String recipientArea) {
		Double price=0.00;
		if(!senderProvince.equals(recipientProvince)) {
			if(weight<1.0) {
				price=18.0;
			}else {
				price=18.0+(weight-1.0)*7.0;
			}
		}else if(!senderCity.equals(recipientCity)) {
			if (weight < 1.0) {
				price = 12.0;
			} else {
				price = 12.0 + (weight - 1.0) * 4.0;
			}
		}else if (!senderArea.equals(recipientArea)) {
			if (weight < 1.0) {
				price = 10.0;
			} else {
				price = 10.0 + (weight - 1.0) * 2.0;
			}
		}else {
			if (weight < 1.0) {
				price = 10.0;
			} else {
				price = 10.0 + (weight - 1.0) * 1.0;
			}
		}	
		return Double.valueOf(String.format("%.2f", price));
	}

	private static CalculatePrice instance;

	public static CalculatePrice getInstance() {
		if (instance == null) {
			instance = new CalculatePrice();
		}
		return instance;
	}

	private CalculatePrice() {
	}

	public static void main(String[] args) {
		CalculatePrice calculatePrice = new CalculatePrice();
		System.out.println(calculatePrice.init2(2.0, "重庆市", "重庆市", "沙坪坝区", "四川省", "成都市", "温江区"));
		System.out.println(String.format("%.2f", calculatePrice.init((double) 2, 3, 1, 1, 2, 1, 2)));
	}
}
